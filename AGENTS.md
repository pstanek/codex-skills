# Agent — marketplace `pstanek-skills`

To repozytorium jest katalogiem **wielokrotnego użytku**. Nie ma tu kontraktu żadnego produktu.

## Co tu trzymać

Skill należy tutaj, jeśli jego treść jest prawdziwa w drugim projekcie bez zmiany słów.

- Craft: landing, copy, visual shortcuts, spec-first, warstwy danych, testy, Tailwind/shadcn.
- Nie: ścieżki jednego appa, `NB-SPEC`, coming soon, waitlista, Shopify, brandbook JSONB.
- Nie: cudze skille. Obce zestawy instaluj przez `npx skills add … -g`, nie kopiuj do `plugins/`.

Kontrakt repo (deploy, schema, tenancy tego produktu) zostaje w `.agents/skills` albo `AGENTS.md` tamtego projektu.

## Katalog

| Plugin | Kiedy czytać `SKILL.md` |
| --- | --- |
| `landing-page-design` | landing, marketing UI, konwersja, system wizualny strony |
| `panel-copywritera` | polskie copy sprzedażowe |
| `visual-shortcuts` | skróty-prompty (`/blueprint`, `/hook10`, …) |
| `spec-writing` | nowy moduł, architektura, plan bez kodu |
| `repository-writing` | serwis vs repozytorium, tenant, błędy integracji |
| `testing` | dobór unit/integration/E2E |
| `tailwind-ui` | shadcn, tokeny, powierzchnie UI |

Nie instaluj całego katalogu w każdej sesji. Włącz plugin, którego ten wątek używa.

## Autorstwo

Nowy plugin: `plugins/<name>/skills/<name>/SKILL.md` + wpis w `.agents/plugins/marketplace.json`. Walidacja: `validate_plugin.py`. Po zmianie: cachebuster i `codex plugin add <name>@pstanek-skills` w nowym wątku.
