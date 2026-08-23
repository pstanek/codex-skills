---
name: visual-shortcuts
description: "Rozpoznaje 200 skrótów-promptów zapisanych ze slashem, np. /blueprint, /crosssection, /hook10 i /premortem, i stosuje ich właściwy format do obrazu lub treści. Używaj, gdy użytkownik wpisuje taką komendę, pyta o jej działanie albo chce korzystać z katalogu komend."
---

# Visual shortcuts

Rozpoznawaj komendy ze slashem jako skróty intencji, a nie jako oficjalne funkcje ChatGPT. Zachowaj nazwę komendy, a opis i odpowiedź prowadź po polsku, chyba że użytkownik używa innego języka.

## Rozpoznanie

1. Wyszukaj komendę w [katalogu](references/commands.md). Jeśli użytkownik pyta o kilka komend albo cały katalog, przeczytaj odpowiednią sekcję.
2. Jeśli komenda nie występuje w katalogu, nie zgaduj jej znaczenia. Poproś o opis albo zaproponuj najbliższą znaną komendę.
3. Treść po komendzie jest tematem lub materiałem wejściowym. Gdy użytkownik dołącza obraz, komendy wizualne stosuj do tego obrazu.

## Komendy wizualne

Komendy z bloku „Zobaczyć pomysł” oraz „Obraz z AI” tworzą albo przekształcają obraz.

- Z dołączonym obrazem korzystaj z narzędzia do edycji obrazu. Zachowaj rozpoznawalny obiekt, kadr, perspektywę i istotne elementy źródła, chyba że komenda albo użytkownik wyraźnie prosi o ich zmianę.
- Bez obrazu wygeneruj nowy obraz z komendą jako główną dyrektywą stylu lub kompozycji.
- W przypadku `/blueprint`, `/explodedview`, `/xray`, `/cutaway`, `/crosssection`, `/anatomy`, `/layers` i `/diagram` opisz w promptcie, co ma być widoczne, oraz zażądaj czytelnego, spójnego technicznie rezultatu.
- Nie dodawaj napisów, wymiarów ani oznaczeń, jeśli użytkownik o nie nie prosi. Gdy o nie prosi, podaj ich dokładne brzmienie w promptcie.

## Komendy tekstowe

Dla pozostałych komend wykonaj konkretną transformację lub stwórz materiał zgodnie z opisem z katalogu. Nie powtarzaj definicji komendy, jeśli użytkownik oczekuje od razu wyniku.

- Wymagaj jedynie kontekstu, który istotnie zmienia rezultat. Gdy można bezpiecznie przyjąć założenie, nazwij je krótko i działaj.
- Dla `/audit`, `/critique`, `/premortem`, `/redteam`, `/swot`, `/validate` i podobnych komend oddziel obserwacje od założeń oraz nie wymyślaj danych.
- Dla komend, które mają wygenerować listę, zachowaj deklarowaną liczbę pozycji, np. 10 dla `/hook10`, `/caption10` i `/ideas10`, a 50 dla `/ideas50`.

## Łączenie komend

Można połączyć do dwóch kompatybilnych komend w jednej wiadomości, np. `/viralhook /script30`. Pierwsza określa styl lub priorytet, druga format wyniku. Przy trzech lub większej liczbie komend potwierdź najważniejszą kolejność albo wykonaj pracę w dwóch etapach.
