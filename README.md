# Situation Monitor Workspace

The Svelte application lives in the nested `situation-monitor-main` directory. Run the commands below from this workspace root.

## Commands

```powershell
npm install
npm run dev
npm run preview -- --port 4173
npm run check
npm run lint
npm run test:unit
npm run test:e2e
npm run deploy:check
npm run build:pages
```

E2E tests start a fresh preview server by default. To intentionally reuse an existing server on port 4173:

```powershell
$env:REUSE_E2E_SERVER = 'true'
npm run test:e2e
```

For a production preview with an automatic project-path check:

```powershell
.\start-preview.ps1 -Port 4173
```

The generated static site is written to `situation-monitor-main/build`.

## Repository Layout

- `package.json` provides parent workspace command proxies.
- `start-preview.ps1` starts the nested production build from the parent folder.
- `situation-monitor-main/` contains the SvelteKit application and its own Git history.
