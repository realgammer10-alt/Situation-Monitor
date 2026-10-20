# Situation Monitor Main — Cline Project Rules

## Inspect and preserve
- Before editing, inspect the relevant code, tests, docs, package scripts, and `git status`. Trace existing behavior first; follow local architecture, naming, formatting, and error-handling conventions.
- The workspace root contains command proxies. The SvelteKit web app is the nested Git repository `situation-monitor-main/`, with its own app-specific `CLAUDE.md`; the Expo/React Native app is `situation-monitor-main/mobile/`. Check status at both repository roots; do not assume Git submodule metadata is configured.
- Preserve working behavior, repository/submodule boundaries, and pre-existing user changes. Make focused edits; do not overwrite unrelated or generated/local files.
- Add a regression test for every verified bug fix and tests for new behavior, including relevant invalid-input and failure cases.

## Validate and report
- Run applicable tests, lint, type checks, and builds using existing package scripts. Report the exact commands run, actual results, and unresolved failures; never state that an unrun or failing check passed.
- Update relevant documentation when setup, commands, or behavior changes. Review the final diff and run `git diff --check` before completion.

## Safety
- Protect `.env`, `.env.*`, credentials, tokens, and local environment files: do not expose or commit their contents. `.env.example` is a template, not a place for real secrets.
- Never use destructive Git operations or discard unrelated changes. Do not commit, push, force-push, or publish without explicit user approval.
- Avoid repo-wide formatting or cleanup when only scoped files need changes.

## Stack and commands
- Web: SvelteKit 2, Svelte 5, TypeScript, Vite, Tailwind CSS, Vitest, Playwright, static adapter. Source is under `situation-monitor-main/src/`; unit tests are colocated and under `situation-monitor-main/tests/unit/`, E2E tests are under `situation-monitor-main/tests/e2e/`.
- Mobile: Expo, React Native, TypeScript, Vitest; tests are under `situation-monitor-main/mobile/src/__tests__/`.
- From the workspace root, use the existing proxies: `npm run dev`, `npm run build`, `npm run check`, `npm run lint`, `npm run test:unit -- --minWorkers=1 --maxWorkers=2`, `npm run test:e2e`, and `npm run deploy:check`.
- Mobile checks: `npm --prefix ./situation-monitor-main/mobile run test` and `npm --prefix ./situation-monitor-main/mobile run typecheck`.
- Playwright starts its configured preview server by default. Set `REUSE_E2E_SERVER=true` only to intentionally reuse port 4173. Do not invent replacement scripts when a configured command fails; report the failure and investigate its cause.
