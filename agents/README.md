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
- Identify the command-output filtering tool before adding it.
- Choose shared project memory separately from public dotfiles.
