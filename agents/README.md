# Agent tools

This document records the initial portable setup; it does not install or configure tools automatically.

## Ponytail

Upstream: https://github.com/DietrichGebert/ponytail

Claude Code (run each command separately inside Claude Code):

```text
/plugin marketplace add DietrichGebert/ponytail
/plugin install ponytail@ponytail
```

Codex (requires a CLI release supporting these plugin commands):

```sh
codex plugin marketplace add DietrichGebert/ponytail
codex plugin add ponytail@ponytail
```

Check installed versions on both machines before automating installation. The existing home-machine version has not been inspected.

## Context7

Upstream: https://github.com/upstash/context7
Documentation: https://context7.com/docs/resources/all-clients

Use Context7 to look up dependency documentation after checking the installed version in the project lockfile. Fall back to official documentation, source and issues when necessary. Do not call it for changes that do not need documentation.

The local stdio server supports `CONTEXT7_API_KEY` in its process environment. Keep actual keys out of this public repository and inject them from a local secret store or an untracked file outside this checkout. A local MCP process still queries the Context7 service.

## Public configuration and private data

Keep installation instructions and configuration templates public. Keep credentials, OAuth state and private project memory separate.

A private Git submodule is possible: the public parent stores the private repository URL and commit reference, not its files. Cloning that submodule requires independent authorization. Never embed credentials in its URL. Private Git is access control, not encryption; prefer a secret manager or encrypted files for tokens.

## Pending work

- Inspect existing Claude Code and Codex settings on the home machine.
- Automate installation without overwriting unrelated settings.
- Select a secret provider and configure Context7 on each machine.
- Choose shared project memory separately from public dotfiles.

## RTK: compact command output

Upstream: https://github.com/rtk-ai/rtk
Installation: https://github.com/rtk-ai/rtk/blob/develop/INSTALL.md

Install RTK using the upstream instructions for the target machine. If using Cargo:

```sh
cargo install --git https://github.com/rtk-ai/rtk rtk
```

Then initialize each installed client separately:

```sh
rtk init -g
rtk init -g --codex
```

Inspect proposed settings changes before accepting. These commands are an operator-run setup, not executed by this repository's install.sh. Check existing hooks for duplicate or legacy RTK entries before initializing. Keep permission checks intact: wrapper commands change what approval rules see. Use the unfiltered log or `rtk bypass` when the compact output is insufficient. No savings percentage is assumed.

## Linux desktop notifications

Template: [claude-notifications.json](claude-notifications.json).
Requires `notify-send` (Fedora/Nobara: `sudo dnf install libnotify`) and access to the logged-in desktop session's notification service.

Merge the template's hook entries into `~/.claude/settings.json`; do not replace existing settings or hooks. The Notification hook signals attention is needed. Stop means Claude finished responding, not that tests passed or the task succeeded. Titles include the working-directory name.

Reference: https://code.claude.com/docs/en/hooks-guide

This template has not been exercised on the user's desktop. Codex desktop notifications still need a client/version-specific adapter; do not copy Claude hook schemas into Codex.

## Modern Web Guidance

Upstream: https://github.com/GoogleChrome/modern-web-guidance
Installation and updates: https://developer.chrome.com/docs/modern-web-guidance/get-started

Recommended upstream installation (interactive; choose installed agents):

```sh
npx modern-web-guidance@latest install
```

The documented CLI installation enables automatic updates. Use this installation route OR an agent-specific plugin installation, not duplicate installations of the same skills. Automatic updates trade strict version reproducibility for freshness; verify installed revisions when comparing behavior between machines.

Use its guidance for relevant web platform, HTML, CSS, JavaScript and browser compatibility questions, within the project's browser support requirements. It is not a universal backend architecture policy.

Ponytail already covers reuse of existing code and platform capabilities, avoiding speculative abstractions and completing the necessary change without dropping validation or error handling. Do not add a duplicate blanket KISS/DRY/YAGNI prompt. Extract shared code when it represents the same responsibility, not merely similar-looking lines. Read the touched code and preserve project conventions.

## Setup status

These are saved instructions and a notification template, not an installation on either computer. Next: inspect local versions and settings, install the selected tools, merge hooks, and verify output filtering and desktop notifications on the actual machine.
