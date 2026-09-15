# pstanek Codex skills

Personal Codex plugin marketplace. Reusable craft only. Product contracts stay in the app repo.

A skill belongs here if its text is still true in a second project without renaming the product.

Third-party skills stay out of this repo. Install them with `npx skills add … -g`.

## Included plugins

- `landing-page-design` — landing-page strategy, conversion copy, SEO, and visual-system guidance.
- `panel-copywritera` — iterative improvement of Polish sales copy using five direct-response perspectives.
- `visual-shortcuts` — Polish slash-command shortcuts for visual and structured work.
- `spec-writing` — implementation specs before a module or architecture change.
- `repository-writing` — service vs repository boundaries, tenant filters, typed integration errors.
- `testing` — unit/integration/E2E: layer boundaries, real test DB, behavior over JSX.
- `tailwind-ui` — shadcn-first UI, theme tokens as CSS variables, separate surfaces.

## Add a skill

Add a directory at `plugins/<plugin-name>/skills/<skill-name>/SKILL.md`, then validate the plugin:

```bash
python3 /Users/pstanek/.codex/skills/.system/plugin-creator/scripts/validate_plugin.py plugins/<plugin-name>
```

## Use this marketplace locally

From the repository root:

```bash
codex plugin marketplace add "$PWD"
codex plugin add landing-page-design@pstanek-skills
```

After a plugin update, run the cachebuster helper, reinstall it, and start a new Codex task:

```bash
python3 /Users/pstanek/.codex/skills/.system/plugin-creator/scripts/update_plugin_cachebuster.py plugins/<plugin-name>
codex plugin add <plugin-name>@pstanek-skills
```
