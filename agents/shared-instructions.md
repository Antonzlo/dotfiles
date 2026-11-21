# Shared coding instructions

Reusable instruction source for Claude Code and Codex. This file is not auto-loaded merely because it exists here. Merge it into each client's instruction setup after inspecting existing rules; preserve project-specific instructions.

- Read the repository instructions and relevant code before editing. Check git status and preserve unrelated work.
- Prefer existing project components, standard library and installed dependencies. Use Ponytail when available; do not duplicate its full prompt here.
- Look up uncertain dependency APIs with Context7 after checking the installed version. Use official docs, source and issues if lookup is incomplete. Use Modern Web Guidance for relevant browser-platform decisions, respecting the project's supported browsers.
- Use RTK for supported command output when configured. Read unfiltered output when needed; preserve command exit status and permission boundaries.
- Run the smallest meaningful checks that establish the requested behavior. For browser changes, exercise the changed interaction using Playwright CLI when available. Report what actually passed and what was not checked.
- Keep always-loaded instructions short. Put long procedures and reference material in on-demand skills or project documentation. Do not enable every MCP server in every project by default.
- After a completed milestone, update the project's designated handoff note with the task status, branch, changed areas, checks and next step. Do not store credentials or copy full chat transcripts. This does not guarantee a checkpoint after an abrupt crash.
- When two agents edit the same repository concurrently, use separate branches and worktrees. Worktrees separate working directories; they are not security sandboxes and do not isolate ports, databases or external services.
- Use desktop notifications for attention and response completion where supported. Completion of a response is not proof of task success.
