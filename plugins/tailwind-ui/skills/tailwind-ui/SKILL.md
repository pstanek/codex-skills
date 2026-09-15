---
name: tailwind-ui
description: Składanie UI na Tailwind i shadcn, tokeny motywu, responsywność i stany. Użyj przy stylowaniu widoków, wyborze komponentu albo mapowaniu motywu na CSS. Nie używaj jako jedynego źródła copy sprzedażowego ani warstw danych.
---

# UI (Tailwind / shadcn)

Mapa katalogów i tokeny motywu biorą się z `AGENTS.md` projektu. Ten skill nie zastępuje `$landing-page-design` ani `$visual-shortcuts`.

Testy UI → `$testing`. Copy sprzedażowe → `$panel-copywritera`. Dane → `$repository-writing`.

## Kiedy używać

- Nowy lub zmieniany widok, layout, wspólny komponent, token motywu.
- Wybór shadcn vs własny komponent.
- Responsywność, focus, stany formularza, reduced motion.

## Narzędzia

Sprawdź `package.json` i istniejący komponent. Nie zakładaj, że Tailwind, shadcn, Lucide albo `cn()` już są. Przy pierwszym zadaniu, które ich wymaga, dołóż minimalny setup zamiast pisać zamienniki od zera.

shadcn/ui jest pierwszym wyborem standardowych bloków. Istniejące elementy wykorzystuj ponownie; nie migruj całej aplikacji przy drobnej zmianie. Własny standardowy komponent wymaga wskazania konkretnego braku w dostępnych rozwiązaniach.

Gdy projekt jest na Tailwind 4: CSS-first, `@import 'tailwindcss'`, tokeny `@theme inline`, dokumentacja zainstalowanej wersji. `cn()` (clsx + tailwind-merge) do klas warunkowych. Nie odwołuj się do nieistniejących helperów.

## Powierzchnie

Trzymaj palety i layouty osobnych powierzchni (panel, marketing, storefront, wiele motywów) tak, żeby jedna nie nadpisywała drugiej. Unikaj globalnych selektorów `h1`, `p`, `button` w nowych modułach.

Wspólne bloki nie kopiuj per wariant. Warunków wyglądu nie wkładaj do routingu ani serwisu domenowego.

## Motyw i treści

Jeśli produkt ma motyw w danych, mapuj go walidowanym kontraktem na **nazwane zmienne CSS** w ograniczonym zakresie. Nie generuj dowolnego CSS, importów ani kodu z JSON. Dynamiczne kolory: zmienne CSS, nie interpolowane klasy Tailwind niewidoczne dla kompilatora.

Fonty i media muszą istnieć; obrazy mają proporcje i alt, gdy potrzebny. Wspólne etykiety UI trzymaj w i18n kodu; treści produktu w kontrakcie treści. Drugi język albo dark mode tylko gdy należą do zakresu widoku.

## Jakość

- Mobile-first, `min-width: 0` w flex/grid, bez niezamierzonego poziomego scrolla.
- Semantyczny HTML, etykiety, klawiatura, widoczny focus. Disabled button nie wykonuje akcji.
- Formularze: zapis, loading, błąd, pusto, sukces. Potwierdzenie = faktyczny zapis serwera.
- Małe komponenty; `'use client'` tylko przy interakcji.
- shadcn rozszerzaj kompozycją. Poprawka prymitywu — sprawdź wszystkich konsumentów.
- Animacje: `prefers-reduced-motion`. Bez dekoracji poza zakresem.

## Weryfikacja

Rzeczywisty widok desktop i mobile. Interakcje: klawiatura i stany formularza. Zmiana wspólnego komponentu: reprezentatywne powierzchnie. Build i HTTP 200 nie zastępują kontroli wizualnej. Nie stawaj infrastruktury testowej dla poprawki statycznego copy.
