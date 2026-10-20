# Situation Monitor Main — Claude Code Instructions

## Workspace and stack

The workspace root contains the command-proxy `package.json` and `README.md`. The web application is the nested Git repository `situation-monitor-main/`, with its own `CLAUDE.md`; inspect status at both repository roots before editing. Do not assume Git submodule metadata is configured.

The web app uses SvelteKit 2, Svelte 5 runes, TypeScript, Vite, Tailwind CSS, Vitest, Playwright, and `@sveltejs/adapter-static`. The separate `situation-monitor-main/mobile/` app uses Expo, React Native, TypeScript, and Vitest.

Web application layout:
- `src/routes/`: SvelteKit route pages and layouts.
- `src/lib/analysis/`: news/market analysis.
- `src/lib/api/`: data fetching and API integrations.
- `src/lib/components/`: Svelte UI, organized into `charts/`, `common/`, `layout/`, `modals/`, and `panels/`.
- `src/lib/config/`: feed, market, panel, and analysis configuration.
- `src/lib/services/`: shared API, persistence, real-time, and resilience services.
- `src/lib/stores/`: application state.
- `src/lib/types/` and `src/lib/utils/`: shared types and utilities.
- `tests/unit/` and source-colocated `*.test.ts` files: Vitest unit tests.
- `tests/e2e/`: Playwright end-to-end tests.
- `mobile/src/`: Expo mobile application; mobile unit tests are in `mobile/src/__tests__/`.

Follow the existing implementation in the relevant directory rather than introducing a parallel architecture. Preserve Svelte 5 rune usage and existing TypeScript, Svelte, and component conventions.

## Required workflow

1. Inspect the relevant source, tests, documentation, package scripts, and `git status` before editing. Trace existing behavior and reuse established helpers and patterns.
2. Preserve working behavior and all pre-existing user changes. Make focused changes; do not overwrite unrelated files or generated/local state.
3. For a verified bug fix, add a regression test that demonstrates the bug and protects the corrected behavior. Add tests for new behavior and relevant validation/error cases.
4. Run applicable tests, lint, type checks, and builds using the scripts below. Report the commands actually run, their actual results, and any failures not resolved. Never claim a check passed if it was skipped or failed.
5. Update relevant documentation when behavior, setup, or commands change. Review `git diff` and `git diff --check` before declaring completion; summarize changed files and validation.

## Safety

- Treat `.env`, `.env.*`, credentials, tokens, and local environment files as sensitive. Do not print, copy, commit, or expose their contents. `.env.example` is the tracked template; never put real secrets in it.
- Do not use destructive Git operations (including `reset --hard`, forced checkout, or cleaning user files). Do not discard unrelated changes. Do not commit, push, force-push, or publish unless the user explicitly authorizes that action.
- Do not run broad formatting or cleanup over unrelated files; format only the files in scope.

## Verified commands

Run these from the workspace root unless noted. Root scripts proxy to the nested web app.

```sh
npm run dev
npm run build
npm run check
npm run lint
npm run test:unit -- --minWorkers=1 --maxWorkers=2
npm run test:e2e
npm run deploy:check
```

Playwright starts its configured preview server for E2E tests. Set `REUSE_E2E_SERVER=true` only when intentionally reusing a server on port 4173.

Mobile commands from the workspace root:

```sh
npm --prefix ./situation-monitor-main/mobile run test
npm --prefix ./situation-monitor-main/mobile run typecheck
```

Use the package scripts as the source of truth. If a command fails because a dependency is missing, report that and follow the repository's setup docs rather than inventing a substitute command.
