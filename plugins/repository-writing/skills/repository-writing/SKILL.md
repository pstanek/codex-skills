---
name: repository-writing
description: Granice serwis vs repozytorium, server-only, DTO, typowane błędy i dostęp do danych. Użyj przy zmianach persistence, integracji albo warstwy page/service/repository.
---

# Repozytoria

Ścieżki katalogów, klient ORM i nazwy tenantów biorą się z `AGENTS.md` projektu. Ten skill trzyma granice warstw.

Czytaj razem z `$testing`. Nowa istotna zmiana modelu → `$spec-writing`.

## Kiedy używać

- Nowe lub zmieniane repozytorium, serwis serwerowy, adapter zewnętrznego API.
- Mutacje danych, cache, izolacja tenantów, mapowanie błędów.

**Nie używaj** do CSS, copy ani specyfikacji bez zmiany danych.

## Granice

- Repozytorium: zapytania i mapowanie błędów danych. Named exports, `import 'server-only'` tam, gdzie kod nie może trafić do klienta.
- Serwis: uprawnienia, reguły biznesowe, transakcje, warunki publikacji.
- Jeden wspólny klient bazy na request; nie otwieraj nowego połączenia w każdym repozytorium.
- Adapter zewnętrznego API trzyma sekrety po stronie serwera. Nie wkładaj tokenów do JSON rekordu domenowego.
- Page → server service → repository. Hook → client service → Route Handler → server service → repository. Przeglądarka nie importuje ORM ani modułów z poświadczeniami.
- Parametry i DTO są jawne. Waliduj odpowiedzi zewnętrznego API. Nie wysyłaj całych rekordów integracji do klienta.

## Dane i tenant

Jeśli dane należą do tenanta, serwis ustala i autoryzuje jego ID. Zapytanie filtruje zasób **oraz** tenanta; samo ID rekordu nie wystarcza. Publiczny odczyt to osobny kontrakt (zweryfikowany host / opublikowana wersja), nie skrót od panelu.

Unikalność (slug, e-mail, domena) egzekwuj ograniczeniem w bazie, nie tylko checkiem przed insertem. Obsłuż konflikt równoległych zapisów.

Transakcję koordynuje serwis; repozytoria dostają wspólny klient transakcyjny. Requesty sieciowe poza transakcją DB.

Nie dodawaj migracji i modeli spoza zadania. Nie edytuj wygenerowanego klienta ORM. Migracje testuj na osobnej bazie, bez resetu danych użytkownika.

## Błędy integracji

Przed konkretną operacją czytaj aktualną dokumentację tego API. Nie wymyślaj endpointów ani scope.

Rozróżniaj: brak konfiguracji, brak zasobu, błąd autoryzacji, transportu, limitu, niepoprawnej odpowiedzi. HTTP 200 z błędami w body (np. GraphQL) to nie sukces. Retry mutacji po timeout tylko gdy operacja jest idempotentna.

Nie zamieniaj wyjątku na pustą listę. Opcjonalny wariant `*Safe` zwraca jawny sukces/awarię dla fragmentu UI; nie ukrywa błędów autoryzacji i nie omija walidacji. Nieznane błędy idą do właściwej granicy obsługi.

Loguj kod, status, czas, correlation ID. Bez tokenów, nagłówków, e-maili i pełnych payloadów.

## Weryfikacja

- Test serwisu mockuje repozytorium na granicy.
- Test repozytorium ORM: realna baza testowa, filtry tenanta, ograniczenia, transakcje.
- Test adaptera: błąd transportu, błąd API, zły payload. Fixture nie dowodzi żywej instalacji.
- Cache ma kontekst tenanta/wersji. Błąd integracji nie podstawia danych innego tenanta.

Szczegóły runnerów: `$testing`.
