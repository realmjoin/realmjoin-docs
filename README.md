# RealmJoin Documentation

The source for the official [RealmJoin](https://realmjoin.com) product documentation, published at **[docs.realmjoin.com](https://docs.realmjoin.com)**.

[RealmJoin](https://realmjoin.com) is the application lifecycle and management companion to Microsoft Intune: deploy and maintain software from a curated catalogue of more than 3,000 applications, manage your Entra ID users, groups and devices in one unified view, and automate everyday IT operations — cloud-native, without on-premise servers.

This repository is connected to GitBook via **Git Sync**, so the published site and this repository always mirror each other.

---

## Repository layout

```
.
├── docs/                       # ← everything GitBook publishes
│   ├── README.md               #   documentation home page
│   ├── SUMMARY.md              #   table of contents / site navigation
│   ├── overview.md
│   ├── .gitbook/assets/        #   images and downloads referenced by pages
│   ├── deployment/             #   onboarding, permissions, architecture
│   ├── ugd-management/         #   user, group & device management
│   ├── application-management/ #   packages, package store, packaging requests
│   ├── automation/             #   Azure Automation, runbooks & runbook reference
│   ├── realmjoin-agent/        #   the Windows agent
│   ├── analyze-and-export/     #   advanced search, reporting, exports
│   ├── administration-and-settings/
│   ├── monitoring-and-logs/
│   ├── dev-reference/          #   RealmJoin API, runbook development
│   ├── security-and-privacy/
│   ├── troubleshooting-and-faq/
│   └── legal/                  #   licensing and support terms
├── .gitbook.yaml               # GitBook config: content root + URL redirects
├── .github/
│   ├── workflows/              # automation (see below)
│   └── scripts/                # PowerShell generators for the runbook reference
└── AGENTS.md / CLAUDE.md       # instructions for AI coding agents
```

Two files drive the published site and should be kept in sync with any page you add, move or delete:

| File | Purpose |
| --- | --- |
| `docs/SUMMARY.md` | The table of contents. A page that is not listed here does not appear in the site navigation. |
| `.gitbook.yaml` | Declares `docs/` as the content root and holds the `redirects:` map. Whenever a page moves or is removed, add a redirect so existing links keep working. |

## How the sync works

* **Edits in GitBook** are pushed back to `main` automatically and show up as commits prefixed with `GITBOOK-…`.
* **Edits in Git** (pull requests merged into `main`) are pulled into GitBook and published.

Because the sync is bidirectional, avoid rewriting history on `main` and prefer small, reviewable pull requests.

## Contributing

1. Create a branch off `main`.
2. Add or edit Markdown files under `docs/`.
3. Register new pages in `docs/SUMMARY.md`, and add a redirect in `.gitbook.yaml` if you move or delete a page.
4. Put images in `docs/.gitbook/assets/` and reference them with a relative path.
5. Open a pull request. Once merged, GitBook publishes the change.

### Content conventions

* **Frontmatter** — pages may carry a YAML block with fields such as `description` (used for SEO and card previews), `type`, `icon` or `layout`. Keep existing frontmatter intact when editing a page.
* **GitBook blocks** — content uses GitBook's extended Markdown (`{% hint %}`, `{% tabs %}`, `{% stepper %}`, card tables, `<figure>` elements). Follow the style of neighbouring pages; the syntax is documented in the [GitBook docs](https://gitbook.com/docs).
* **Section folders** use a `README.md` as the section landing page.
* **Don't hand-edit generated content** — see below.

### Working with AI agents

`AGENTS.md` and `CLAUDE.md` describe how coding agents should treat this repository. The short version: load the GitBook skill (`npx skills add gitbookio/gitbook-skills`, or <https://gitbook.com/docs/skill.md>) before editing, and never clobber the sync metadata (frontmatter, `SUMMARY.md`, `.gitbook.yaml`, `.gitbook/`).

## Automation

The **📚 Update Runbook Docs** workflow (`.github/workflows/update-runbook-references.yml`) runs daily at 02:00 UTC and can also be triggered manually. It checks out [`realmjoin/realmjoin-runbooks`](https://github.com/realmjoin/realmjoin-runbooks) and regenerates:

* `docs/automation/runbooks/runbook-references/**` — one page per runbook, including parameters and required permissions
* `docs/automation/runbooks/release-notes.md` — rendered from the runbooks repository's GitHub Releases
* `docs/automation/connecting-azure-automation/azure-ad-roles-and-permissions.md` — the aggregated module and permission requirements
* the *Runbook References* section of `docs/SUMMARY.md`

These files are **generated** — changes belong in the source runbooks repository or in the PowerShell generators under `.github/scripts/`, otherwise the next run overwrites them. If a fetch fails, the previously published page is kept and a Teams notification is sent (requires the `TEAMS_WEBHOOK_URL` and `TEAMS_WEBHOOK_SECRET` repository secrets).

## Useful links

| | |
| --- | --- |
| 📖 Documentation | [docs.realmjoin.com](https://docs.realmjoin.com) |
| 🌐 Product website | [realmjoin.com](https://realmjoin.com) |
| 🔑 RealmJoin Portal | [portal.realmjoin.com](https://portal.realmjoin.com) |
| 🆕 Changelog & feature requests | [feedback.realmjoin.com](https://feedback.realmjoin.com) |
| 🤖 Runbooks repository | [realmjoin/realmjoin-runbooks](https://github.com/realmjoin/realmjoin-runbooks) |

## Feedback

Spotted something wrong or missing? Open an issue or a pull request. For product questions and support, see [Support & Service Level](docs/legal/support.md).
