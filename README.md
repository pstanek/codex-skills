# pstanek Codex skills

Personal Codex plugin marketplace. Each plugin groups related skills and can be installed independently.

## Included plugins

- `landing-page-design` — landing-page strategy, conversion copy, SEO, and visual-system guidance.

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
