# Stale Files Audit — `docs/`

This report lists Markdown files under `docs/` that are **not referenced** from `docs/SUMMARY.md` (the GitBook table of contents). These files are not surfaced in the published GitBook site and are likely leftovers from previous restructurings.

## Methodology

1. Parsed all Markdown link targets ending in `.md` from `docs/SUMMARY.md` to build the set of **live (referenced)** pages.
2. Enumerated all `*.md` files under `docs/` (recursively).
3. The difference (`all − referenced`) yields the **stale / orphaned** set. `docs/SUMMARY.md` itself is excluded (it is the TOC, never linked from itself).
4. For each stale file, identified a **likely canonical replacement** by mapping legacy top-level folders to their current SUMMARY.md location (e.g. `realmjoin-client/…` → `realmjoin-agent/realmjoin-client/…`, `settings/…` → `realmjoin-settings/…`, `runbooks/…` → `automation/runbooks/…`, etc.) and matching by basename.
5. Searched all live pages for inbound references to the stale paths. Five link-syntax forms were checked:
   - Markdown links `[text](path.md)` and image links `![alt](path.png)`
   - HTML `href="…"` and `src="…"` attributes
   - GitBook `{% content-ref url="…" %}` blocks
   - GitBook `{% include "…" %}` blocks (for `.gitbook/includes/` files)
   - GitBook `{% embed url="…" %}` blocks
   For each match the target was resolved relative to the source file, and three candidate paths were tested against the stale set: the literal path, the path + `.md`, and the path + `/README.md` (GitBook resolves directory links to README).
6. Searched all non-Markdown files in the repo (`*.yml`, `*.yaml`, `*.json`, `*.ps1`, `*.html`, `*.js`, `*.ts`, `*.toml`, etc.), including `.github/scripts/` and `.github/workflows/`, for literal mentions of any stale path.
7. Captured each stale file's last commit date via `git log` (after `git fetch --unshallow`).

## Summary

- Total `.md` files under `docs/`: **362**
- Files referenced by `SUMMARY.md` (resolving to existing files): **280** (plus `SUMMARY.md` itself = 281 live)
- **Stale / orphaned files: 82**
- **Inbound references from live pages to stale files: 0** (verified across all five link-syntax forms listed above).
- **Mentions of stale paths in scripts/workflows/configs: 0** (the `update-runbook-references.yml` workflow and `Update-SummaryMd.ps1` only touch `docs/automation/runbooks/runbook-references/` and `docs/SUMMARY.md`; they do not depend on any stale path).

Because no live page, script, workflow, or config file links into any of these files, deleting them will not produce broken inbound links anywhere in the published documentation or the automation. The only "references" to these paths are between the stale files themselves.

### What is *not* included in this audit (scope limits)

- **Assets** under `.gitbook/assets/` are not analyzed. Some images may only be referenced from stale files and become orphaned after deletion. They cause no broken links in live content and can be cleaned up separately.
- **GitBook UI-only metadata** (reusable block embeddings managed in the GitBook UI rather than in `.md` text) cannot be detected by a repo scan. The single GitBook include file (`pre-shared-key-per-customer.md`) is therefore listed under "Special case" and recommended for manual verification, not automatic deletion.

## Stale top-level folders

These entire top-level folders under `docs/` appear to be legacy locations that have been superseded by reorganized paths in `SUMMARY.md`:

- `docs/AppManagement/` → `docs/app-management/`
- `docs/developer-reference/` → `docs/dev-reference/`
- `docs/onboarding/` → `docs/realmjoin-deployment/ and automation/connecting-azure-automation/`
- `docs/readme/` → `docs/(content moved to other/ and top-level)`
- `docs/realmjoin-client/` → `docs/realmjoin-agent/realmjoin-client/ (with infrastructure → realmjoin-deployment/infrastructure/)`
- `docs/runbooks/` → `docs/automation/runbooks/`
- `docs/settings/` → `docs/realmjoin-settings/ (and automation/runbooks/, logs/)`
- `docs/support/` → `docs/legal/`
- `docs/troubleshooting/` → `docs/other/troubleshooting/`
- `docs/user-group-device-management/` → `docs/ugd-management/`

Top-level loose stale files: `audit-log.md`, `licensing.md`, `self-service-forms.md`, `workplace-cloud-storage.md` (all have canonical replacements; see table).

## ⚠️ Drift detected (reviewed — safe to delete)

Five stale files were edited as recently as **2025-09 / 2026-01** even though they are not part of the live SUMMARY.md. This confirms the drift problem described in the task: someone edited the stale copy via GitHub. **However**, after diffing each stale file against its canonical counterpart, in every case the **canonical (live) file is already newer and already contains a superset of the stale file's content** (text rewrites, image updates, expanded sections). No edit on the stale side is "stranded" or needs to be replayed.

| Stale (recently edited) path | Last commit on stale | Canonical replacement | Last commit on canonical | Verdict |
|---|---|---|---|---|
| `docs/runbooks/azure-ad-roles-and-permissions.md` | 2026-01-23 | `docs/automation/connecting-azure-automation/azure-ad-roles-and-permissions.md` | 2026-05-05 | Canonical newer & expanded — safe to delete |
| `docs/runbooks/customization.md` | 2025-09-04 | `docs/automation/runbooks/runbook-customization.md` | 2025-11-27 | Canonical newer — safe to delete |
| `docs/runbooks/logs/README.md` | 2025-09-04 | `docs/automation/runbooks/runbook-logs/README.md` | 2025-11-27 | Canonical newer (fixed image paths, updated cross-links) — safe to delete |
| `docs/runbooks/logs/runbook-job-details.md` | 2025-09-04 | `docs/automation/runbooks/runbook-logs/runbook-job-details.md` | 2025-11-27 | Canonical newer (refreshed screenshots) — safe to delete |
| `docs/runbooks/permissions.md` | 2025-09-04 | `docs/automation/runbooks/runbook-permissions.md` | 2026-01-30 | Canonical newer & expanded — safe to delete |

All other stale files (last touched 2024-08-07 in the "restructure github repo" commit) can be deleted as-is.

## Special case

- `docs/.gitbook/includes/pre-shared-key-per-customer.md` is a **GitBook reusable include block**, not a regular page. It is not referenced via standard Markdown link syntax (so it appears as "orphaned" by this audit) but may be embedded into one or more pages through GitBook's block-content mechanism. **Verify in the GitBook UI before deleting.** Recommendation: do *not* delete in the cleanup PR — leave it as-is until manually confirmed unused.

## Stale files

| # | Stale path | Likely canonical replacement | Last modified | Inbound refs from live pages | Safe to delete? |
|---|---|---|---|---|---|
| 1 | `docs/AppManagement/README.md` | (no direct replacement found) | 2024-08-07 | none | ✅ Yes |
| 2 | `docs/AppManagement/avd-templates.md` | `docs/app-management/avd-templates.md` | 2024-08-07 | none | ✅ Yes |
| 3 | `docs/AppManagement/package-management/README.md` | (no direct replacement found) | 2024-08-07 | none | ✅ Yes |
| 4 | `docs/AppManagement/package-management/package-details.md` | `docs/app-management/packages/package-details.md` | 2024-08-07 | none | ✅ Yes |
| 5 | `docs/AppManagement/package-store/README.md` | `docs/app-management/packages/package-store/README.md` | 2024-08-07 | none | ✅ Yes |
| 6 | `docs/AppManagement/package-store/package-store-details.md` | `docs/app-management/packages/package-store/package-store-details.md` | 2024-08-07 | none | ✅ Yes |
| 7 | `docs/audit-log.md` | `docs/logs/audit-log.md` | 2024-08-07 | none | ✅ Yes |
| 8 | `docs/developer-reference/README.md` | (no direct replacement found) | 2024-08-07 | none | ✅ Yes |
| 9 | `docs/developer-reference/interacting-with-runbooks.md` | `docs/dev-reference/interacting-with-runbooks.md` | 2024-08-07 | none | ✅ Yes |
| 10 | `docs/developer-reference/local-admin-password-management.md` | `docs/dev-reference/local-admin-password-management.md` | 2024-08-07 | none | ✅ Yes |
| 11 | `docs/developer-reference/realmjoin-api/README.md` | `docs/dev-reference/realmjoin-api/README.md` | 2024-08-07 | none | ✅ Yes |
| 12 | `docs/developer-reference/realmjoin-api/authentication.md` | `docs/dev-reference/realmjoin-api/authentication.md` | 2024-08-07 | none | ✅ Yes |
| 13 | `docs/developer-reference/simulating-a-runbook-environment.md` | `docs/dev-reference/simulating-a-runbook-environment.md` | 2024-08-07 | none | ✅ Yes |
| 14 | `docs/licensing.md` | `docs/legal/licensing/README.md` | 2024-08-07 | none | ✅ Yes |
| 15 | `docs/onboarding/README.md` | (no direct replacement found) | 2024-08-07 | none | ✅ Yes |
| 16 | `docs/onboarding/connecting-azure-automation/README.md` | `docs/automation/connecting-azure-automation/README.md` | 2024-08-07 | none | ✅ Yes |
| 17 | `docs/onboarding/connecting-azure-automation/required-permissions.md` | `docs/automation/connecting-azure-automation/required-permissions.md` | 2024-08-07 | none | ✅ Yes |
| 18 | `docs/onboarding/onboarding-realmjoin-portal/README.md` | `docs/realmjoin-deployment/onboarding-realmjoin-portal/README.md` | 2024-08-07 | none | ✅ Yes |
| 19 | `docs/onboarding/onboarding-realmjoin-portal/required-permissions.md` | `docs/realmjoin-deployment/required-permissions.md` | 2024-08-07 | none | ✅ Yes |
| 20 | `docs/readme/faq.md` | `docs/other/faq.md` | 2024-08-07 | none | ✅ Yes |
| 21 | `docs/realmjoin-client/README.md` | `docs/realmjoin-agent/realmjoin-client/README.md` | 2024-08-07 | none | ✅ Yes |
| 22 | `docs/realmjoin-client/additional-settings.md` | (no direct replacement found) | 2024-08-07 | none | ✅ Yes |
| 23 | `docs/realmjoin-client/anydesk-integration/README.md` | `docs/realmjoin-agent/realmjoin-client/anydesk-integration/README.md` | 2024-08-07 | none | ✅ Yes |
| 24 | `docs/realmjoin-client/anydesk-integration/anydesk-cloud-connections.md` | (no direct replacement found) | 2024-08-07 | none | ✅ Yes |
| 25 | `docs/realmjoin-client/anydesk-integration/customer-tasks.md` | `docs/realmjoin-agent/realmjoin-client/anydesk-integration/customer-tasks.md` | 2024-08-07 | none | ✅ Yes |
| 26 | `docs/realmjoin-client/anydesk-integration/glueckkanja-tasks.md` | (no direct replacement found) | 2024-08-07 | none | ✅ Yes |
| 27 | `docs/realmjoin-client/client-menu.md` | `docs/realmjoin-agent/client-menu/README.md` | 2024-08-07 | none | ✅ Yes |
| 28 | `docs/realmjoin-client/connecting-a-tenant.md` | (no direct replacement found) | 2024-08-07 | none | ✅ Yes |
| 29 | `docs/realmjoin-client/deploy-apps/README.md` | `docs/realmjoin-agent/realmjoin-client/deploy-apps.md` | 2024-08-07 | none | ✅ Yes |
| 30 | `docs/realmjoin-client/deploy-apps/realmjoin-esp.md` | `docs/realmjoin-agent/realmjoin-client/realmjoin-esp.md` | 2024-08-07 | none | ✅ Yes |
| 31 | `docs/realmjoin-client/infrastructure/README.md` | `docs/realmjoin-deployment/infrastructure/README.md` | 2024-08-07 | none | ✅ Yes |
| 32 | `docs/realmjoin-client/infrastructure/multi-user-devices.md` | `docs/realmjoin-deployment/infrastructure/multi-user-devices.md` | 2024-08-07 | none | ✅ Yes |
| 33 | `docs/realmjoin-client/installation.md` | `docs/realmjoin-agent/installation.md` | 2024-08-07 | none | ✅ Yes |
| 34 | `docs/realmjoin-client/local-admin-password-solution-laps/README.md` | `docs/realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/README.md` | 2024-08-07 | none | ✅ Yes |
| 35 | `docs/realmjoin-client/local-admin-password-solution-laps/application-insights.md` | `docs/realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/application-insights.md` | 2024-08-07 | none | ✅ Yes |
| 36 | `docs/realmjoin-client/local-admin-password-solution-laps/keyvault.md` | `docs/realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/keyvault.md` | 2024-08-07 | none | ✅ Yes |
| 37 | `docs/realmjoin-client/showing-notifications.md` | `docs/realmjoin-agent/realmjoin-client/showing-notifications.md` | 2024-08-07 | none | ✅ Yes |
| 38 | `docs/runbooks/README.md` | `docs/automation/runbooks/README.md` | 2024-08-07 | none | ✅ Yes |
| 39 | `docs/runbooks/azure-ad-roles-and-permissions.md` | `docs/automation/connecting-azure-automation/azure-ad-roles-and-permissions.md` | 2026-01-23 | none | ✅ Yes |
| 40 | `docs/runbooks/customization.md` | `docs/automation/runbooks/runbook-customization.md` | 2025-09-04 | none | ✅ Yes |
| 41 | `docs/runbooks/logs/README.md` | `docs/automation/runbooks/runbook-logs/README.md` | 2025-09-04 | none | ✅ Yes |
| 42 | `docs/runbooks/logs/runbook-job-details.md` | `docs/automation/runbooks/runbook-logs/runbook-job-details.md` | 2025-09-04 | none | ✅ Yes |
| 43 | `docs/runbooks/naming-conventions.md` | `docs/automation/runbooks/naming-conventions.md` | 2024-08-07 | none | ✅ Yes |
| 44 | `docs/runbooks/permissions.md` | `docs/automation/runbooks/runbook-permissions.md` | 2025-09-04 | none | ✅ Yes |
| 45 | `docs/runbooks/powershell-modules.md` | (no direct replacement found) | 2024-08-07 | none | ✅ Yes |
| 46 | `docs/runbooks/scheduling.md` | `docs/automation/runbooks/scheduling.md` | 2024-08-07 | none | ✅ Yes |
| 47 | `docs/self-service-forms.md` | `docs/realmjoin-settings/self-service-forms.md` | 2024-08-07 | none | ✅ Yes |
| 48 | `docs/settings/README.md` | `docs/realmjoin-settings/settings.md` | 2024-08-07 | none | ✅ Yes |
| 49 | `docs/settings/custom-roles/README.md` | `docs/realmjoin-settings/permission/custom-roles/README.md` | 2024-08-07 | none | ✅ Yes |
| 50 | `docs/settings/custom-roles/available-permissions.md` | `docs/realmjoin-settings/permission/custom-roles/available-permissions.md` | 2024-08-07 | none | ✅ Yes |
| 51 | `docs/settings/general.md` | `docs/realmjoin-settings/general.md` | 2024-08-07 | none | ✅ Yes |
| 52 | `docs/settings/groups.md` | `docs/realmjoin-settings/groups.md` | 2024-08-07 | none | ✅ Yes |
| 53 | `docs/settings/log-analytics.md` | `docs/logs/log-analytics.md` | 2024-08-07 | none | ✅ Yes |
| 54 | `docs/settings/permission.md` | `docs/realmjoin-settings/permission/README.md` | 2024-08-07 | none | ✅ Yes |
| 55 | `docs/settings/runbook-customizations.md` | `docs/automation/runbooks/runbook-customization.md` | 2024-08-07 | none | ✅ Yes |
| 56 | `docs/settings/runbook-permissions.md` | `docs/automation/runbooks/runbook-permissions.md` | 2024-08-07 | none | ✅ Yes |
| 57 | `docs/settings/runbooks.md` | `docs/automation/runbooks/runbooks.md` | 2024-08-07 | none | ✅ Yes |
| 58 | `docs/support/README.md` | `docs/legal/support.md` | 2024-08-07 | none | ✅ Yes |
| 59 | `docs/support/changelog.md` | (removed; replaced by external https://feedback.realmjoin.com/) | 2024-08-07 | none | ✅ Yes |
| 60 | `docs/troubleshooting/README.md` | `docs/other/troubleshooting/README.md` | 2024-08-07 | none | ✅ Yes |
| 61 | `docs/troubleshooting/package-installation-issues/README.md` | `docs/other/troubleshooting/package-installation-issues/README.md` | 2024-08-07 | none | ✅ Yes |
| 62 | `docs/troubleshooting/package-installation-issues/analysing-chocolatey.log.md` | `docs/other/troubleshooting/package-installation-issues/analysing-chocolatey.log.md` | 2024-08-07 | none | ✅ Yes |
| 63 | `docs/troubleshooting/package-installation-issues/collecting-logfiles.md` | `docs/other/troubleshooting/package-installation-issues/collecting-logfiles.md` | 2024-08-07 | none | ✅ Yes |
| 64 | `docs/troubleshooting/package-installation-issues/fixes-for-common-issues.md` | `docs/other/troubleshooting/package-installation-issues/fixes-for-common-issues.md` | 2024-08-07 | none | ✅ Yes |
| 65 | `docs/troubleshooting/package-installation-issues/logfiles-structure.md` | `docs/other/troubleshooting/package-installation-issues/logfiles-structure.md` | 2024-08-07 | none | ✅ Yes |
| 66 | `docs/troubleshooting/package-installation-issues/troubleshooting-failed-chocolatey-packages.md` | `docs/other/troubleshooting/package-installation-issues/troubleshooting-failed-chocolatey-packages.md` | 2024-08-07 | none | ✅ Yes |
| 67 | `docs/troubleshooting/package-installation-issues/troubleshooting-failed-craft-packages.md` | `docs/other/troubleshooting/package-installation-issues/troubleshooting-failed-craft-packages.md` | 2024-08-07 | none | ✅ Yes |
| 68 | `docs/user-group-device-management/README.md` | (no direct replacement found) | 2024-08-07 | none | ✅ Yes |
| 69 | `docs/user-group-device-management/about-me.md` | `docs/ugd-management/about-me.md` | 2024-08-07 | none | ✅ Yes |
| 70 | `docs/user-group-device-management/device-list/README.md` | `docs/ugd-management/user-list/README.md` | 2024-08-07 | none | ✅ Yes |
| 71 | `docs/user-group-device-management/device-list/device-details.md` | `docs/ugd-management/user-list/device-details.md` | 2024-08-07 | none | ✅ Yes |
| 72 | `docs/user-group-device-management/group-list/README.md` | `docs/ugd-management/user-list/README.md` | 2024-08-07 | none | ✅ Yes |
| 73 | `docs/user-group-device-management/group-list/group-details.md` | `docs/ugd-management/user-list/group-details.md` | 2024-08-07 | none | ✅ Yes |
| 74 | `docs/user-group-device-management/organization-details.md` | `docs/ugd-management/organization-details.md` | 2024-08-07 | none | ✅ Yes |
| 75 | `docs/user-group-device-management/remediation-scripts.md` | `docs/automation/remediation-scripts.md` | 2024-08-07 | none | ✅ Yes |
| 76 | `docs/user-group-device-management/user-and-group-settings.md` | `docs/ugd-management/user-and-group-settings/README.md` | 2024-08-07 | none | ✅ Yes |
| 77 | `docs/user-group-device-management/user-and-group-settings/README.md` | `docs/ugd-management/user-and-group-settings/README.md` | 2024-08-07 | none | ✅ Yes |
| 78 | `docs/user-group-device-management/user-and-group-settings/available-settings.md` | `docs/ugd-management/user-and-group-settings/additional-settings.md` | 2024-08-07 | none | ✅ Yes |
| 79 | `docs/user-group-device-management/user-list/README.md` | `docs/ugd-management/user-list/README.md` | 2024-08-07 | none | ✅ Yes |
| 80 | `docs/user-group-device-management/user-list/user-details.md` | `docs/ugd-management/user-list/user-details.md` | 2024-08-07 | none | ✅ Yes |
| 81 | `docs/workplace-cloud-storage.md` | `docs/realmjoin-settings/workplace-cloud-storage.md` | 2024-08-07 | none | ✅ Yes |
| 82 | `docs/.gitbook/includes/pre-shared-key-per-customer.md` | (GitBook include block — not referenced via markdown link) | 2025-08-26 | none | ⚠️ Verify in GitBook first |

## Recommendation

After your review and approval:

1. Delete the **81 stale files** marked ✅ (i.e. all stale files **except** `docs/.gitbook/includes/pre-shared-key-per-customer.md`). Whole legacy folders (`docs/AppManagement/`, `docs/developer-reference/`, `docs/onboarding/`, `docs/readme/`, `docs/realmjoin-client/`, `docs/runbooks/`, `docs/settings/`, `docs/support/`, `docs/troubleshooting/`, `docs/user-group-device-management/`) and the loose top-level files `audit-log.md`, `licensing.md`, `self-service-forms.md`, `workplace-cloud-storage.md` can all be removed.
2. **No inbound-link fixes are required**: the audit confirmed zero references from any live (SUMMARY-listed) page into these stale paths.
3. Hold `docs/.gitbook/includes/pre-shared-key-per-customer.md` for manual verification in the GitBook editor (it may be embedded as a reusable block). Delete only after confirming it is not used.

---

*Generated by the stale-files audit. Reproduce by running the diff between Markdown link targets in `docs/SUMMARY.md` and `find docs -name '*.md'`.*