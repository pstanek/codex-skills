---
name: spec-writing
description: Specyfikacje implementacyjne przed nowym modułem, zmianą architektury, modelu danych lub flow. Użyj gdy zakres jest niejasny albo użytkownik prosi o plan bez kodu. Nie używaj przy małym bugfixie, zmianie copy ani dopasowaniu instrukcji.
---

# Pisanie specyfikacji

Kontrakt produktu, prefiks plików i katalog speców biorą się z `AGENTS.md` projektu. Ten skill opisuje proces, nie numerację jednego produktu.

Czytaj razem z `$repository-writing` i `$testing`.

## Kiedy używać

- Nowy moduł, istotny flow, model danych albo zmiana architektury.
- Użytkownik prosi o analizę/spec i nie chce jeszcze kodu.
- Zakres jest niejasny albo koliduje z istniejącym kontraktem produktu.

**Nie pisz speca** przy małym bugfixie, zmianie copy, refaktorze bez zmiany kontraktu albo dopasowaniu instrukcji.

## Źródła

1. Kontrakt produktu w tym repo (często `SPEC.md` / `AGENTS.md`).
2. Istniejący kod i już zatwierdzone specy tego projektu.
3. Notatki i backlog nie zmieniają zakresu, dopóki użytkownik ich nie zatwierdzi.

Nie implementuj funkcji ze speców innego produktu ani nie przejmuj ich statusów. Gdy użytkownik prosi tylko o analizę/spec, nie zmieniaj kodu.

Nowy plik nazwij i złóż tam, gdzie każe `AGENTS.md` projektu. Numeruj w serii tego repo, bez kolizji z importowanymi referencjami.

## Struktura

Dostosuj długość do zadania. Pełna spec obejmuje:

1. `Status`: Draft / Approved / In progress (data) / Implemented (data) / Superseded by …; przy fazach dodaj ich stan.
2. Cel, problem i zakres, w tym co pozostaje poza zmianą.
3. Flow użytkownika i kryteria odbioru.
4. Architektura: UI → transport → serwisy → repozytoria; granica server/client.
5. Dane: schema, relacje, DTO, ograniczenia, migracja i błędy.
6. Integracje i uprawnienia, jeśli dotyczą zadania.
7. Fazy z weryfikowalnymi wynikami.
8. Testy, ryzyka, nieustalone kwestie i historia istotnych zmian.

Krótka spec: status, problem, rozwiązanie, kroki, kryteria odbioru. Nie dodawaj wycen ani terminów bez prośby.

## Decyzje i realizacja

Najpierw ustalenia użytkownika i repo. Pytaj tylko o decyzje, które zmieniają zakres, odpowiedzialność albo kontrakt. Rutynowe wybory implementacyjne opisz jako założenia.

Samo planowanie → spec bez kodu, implementacja po zgodzie. Już zlecona implementacja w ustalonym zakresie → spec jest planem, nie dodatkową bramką. Nie oznaczaj Approved bez rzeczywistej autoryzacji.

Status według wykonania, nie zamiaru. Implemented wymaga kodu i opisanej weryfikacji; brakującą integrację albo produkcję podaj osobno. Nie poszerzaj V1 o funkcje z innego projektu tylko dlatego, że tam były.

## Po specu

- Warstwy danych → `$repository-writing`
- Testy → `$testing`
- UI → `$tailwind-ui`
