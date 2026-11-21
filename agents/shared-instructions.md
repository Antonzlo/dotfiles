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

## Package and environment preferences

- For new JavaScript/TypeScript projects, prefer pnpm. In existing projects, follow repository instructions, the packageManager field and the existing lockfile. Do not migrate package managers or add a competing lockfile without an explicit task to do so.
- On Windows, prefer winget for system application installation when a suitable package is available. Check whether the application is already installed, and verify the intended package identity before installation. Do not treat a package manager preference as authorization to upgrade unrelated software.
- On Linux, detect the distribution and use its appropriate package manager for system packages. Keep project dependencies within the project's dependency tooling.
- Respect project-pinned runtime and tool versions. Avoid unrelated dependency upgrades or lockfile churn.
- Use the project's existing formatter, linter and test commands rather than introducing a competing toolchain for routine edits.

## Docker and CI builds

- Choose supported runtime/base-image releases with current security patches, compatible with the project. Do not infer vulnerability status from a major version alone. Pin deliberate image versions or digests for reproducibility and keep an explicit update process; do not use floating latest as a security policy.
- Keep the build context small with .dockerignore. Copy only required files; exclude credentials, local environment files, VCS metadata and irrelevant artifacts. Use multi-stage builds where appropriate so the runtime image contains only runtime dependencies and output.
- Design layer order for reuse: copy dependency manifests, lockfiles and required workspace metadata before dependency installation, then copy frequently changing source. Preserve lifecycle scripts and build inputs actually required by the project; do not disable scripts blindly.
- Use BuildKit cache mounts for package/compiler caches where supported. Configure persistent local or external layer caches for CI, including cache import and export. External layer-cache export does not by itself guarantee cache-mount contents survive a fresh runner.
- Reuse pnpm store and Gradle/dependency/task caches as appropriate. Respect lockfiles and key caches by relevant platform, toolchain and inputs; use only cache mechanisms that maintain correct invalidation.
- In monorepos, build and test affected components and their dependents. Changes to shared libraries, lockfiles, generators or build configuration must invalidate the relevant work. A frontend-only change should not force unrelated backend rebuilds.
- Check cache hit/miss behavior in logs and compare cold and warm builds before claiming an optimization. Investigate unexpected full rebuilds instead of adding unconditional clean/no-cache steps.
- Never put secrets into image layers, build arguments or exported caches. Use build secret mounts for temporary build credentials. Do not share writable trusted build caches or signing/deployment credentials with untrusted PR jobs.
- Cache reuse is not permission to skip checks required by the change. Completion reports should distinguish build success, tests and cache behavior.
