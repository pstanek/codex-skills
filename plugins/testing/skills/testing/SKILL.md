---
name: testing
description: Dobór i pisanie testów unit, integration, component i E2E. Użyj przy implementacji logiki, nowej regule biznesowej albo zmianach testów. Nie używaj do recenzji samego copy ani dokumentacji.
---

# Testowanie

Stosuj granice warstw z `AGENTS.md` projektu. Scenariusze domenowe biorą się z kontraktu tamtego repo, nie z tego skilla.

## Kiedy używać

- Nowa reguła biznesowa, poprawka istotnego błędu, zmiana auth, danych albo integracji.
- Setup runnerów albo nowe pliki testów.

**Nie pisz testów** kopiujących JSX, sprawdzających klasy CSS albo treść dokumentacji. Drobna zmiana statycznego copy zwykle nie wymaga nowego zestawu.

## Narzędzia

Najpierw odczytaj `package.json` i konfiguracje w tym repo. Nie zakładaj, że Vitest, RTL, Playwright, Prisma albo Bun już są. Brakujący runner dodaj tylko w zadaniu, które go pierwszy raz potrzebuje — nie przy edycji dokumentacji.

- Unit i integration logiki serwera: Vitest (albo to, co jest w skryptach).
- Interaktywne komponenty/hooki: RTL + user-event, osobne środowisko DOM od testów serwerowych.
- Kluczowe ścieżki użytkownika: Playwright na uruchomionej aplikacji.
- Nazwy plików, o ile projekt nie stanowi inaczej: `*.test.ts` (unit), `*.test.tsx` (component), `*.integration.test.ts` (baza), `e2e/*.spec.ts`.
- Odpalaj skrypty z `package.json`. Przy Bunie `bun test` to inny runner niż `bun run test`, gdy testy idą przez Vitest.

## Co testować

Krytyczne przepływy z `AGENTS.md` / speca projektu nie są „nice to have”. Typowe warstwy:

| Rodzaj | Cel |
| --- | --- |
| Unit | Reguła w serwisie, walidacja kontraktu, błędy, izolacja tenantów jeśli produkt je ma |
| Integration | Realna baza testowa: ograniczenia, transakcje, wyścigi, filtry dostępu |
| Component | Zachowanie formularza i stanów UI po roli/etykiecie, nie po klasach |
| E2E | Auth i 2–3 ścieżki, bez których produkt kłamie |

Asercja dotyczy zachowania i widocznego wyniku, nie szczegółu implementacji.

## Mockowanie i baza testowa

- Test serwisu mockuje repository / adapter na granicy warstwy. Nie mockuj prywatnych funkcji testowanego modułu.
- Test repozytorium ORM używa realnej bazy testowej i migracji, nie deweloperskiego `DATABASE_URL`. Stop, gdy brak jawnego URL testowego. Nie resetuj bazy deweloperskiej ani produkcji. Sprzątaj tylko dane tego testu.
- Klient zewnętrznego API mockuj z kontrolowanymi sukcesami, błędami HTTP i timeoutem. Fixture nie dowodzi żywej integracji. Nie obciążaj prawdziwych płatności ani nie wysyłaj kampanii.

## UI i E2E

Sprawdzaj loading, error, empty i sukces, nie tylko callback. Async Server Components — logika serwerowa + E2E, nie wymuszaj ich w RTL.

Playwright: własne fixture, własny port, własna sesja. Nie podpinaj przypadkowej aplikacji na `localhost:3000`. CI testuje zbudowaną aplikację. Zmiany UI weryfikuj też wizualnie (desktop i mobile, klawiatura gdy dotyczy interakcji).

## Raport

Uruchom adekwatne testy i typecheck z tego repo. Build przy zmianie routingu/RSC albo przed commitem/PR. Migracje — walidacja i test na bazie testowej, gdy schema się zmienia.

Brak runnera, przeglądarki, sklepu albo bazy to ograniczenie do podania, nie zaliczony test. Osobno: mocki, realna integracja, kontrola wizualna, produkcja. HTTP 200 nie jest kontrolą UI. Po zielonych adekwatnych testach nie powtarzaj ich bez nowej zmiany.
