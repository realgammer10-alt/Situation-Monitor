# Situation Monitor Workspace

The Svelte application lives in the nested `situation-monitor-main` directory. Install its dependencies there, then run the command proxies below from this workspace root.

## Commands

```powershell
Set-Location .\situation-monitor-main
npm install
Set-Location ..
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

## Monitoring

- Custom keyword monitors rescan the latest news whenever feeds or monitor settings change.
- The **API Endpoint Health** dashboard panel checks GDELT, CoinGecko, FRED, and USGS on load, on demand, and every five minutes. It reports browser-visible HTTP availability and response latency; browser network or cross-origin restrictions can make an endpoint appear unavailable even when its service is otherwise operational.

## Repository Layout

- `package.json` provides parent workspace command proxies.
- `start-preview.ps1` starts the nested production build from the parent folder.
- `situation-monitor-main/` contains the SvelteKit application and its own Git history.

## Mobile app

The Expo/React Native companion app is in `situation-monitor-main/mobile`. Install and run it from that directory:

```powershell
Set-Location .\situation-monitor-main\mobile
npm install
npm start
```

Before launching, configure `EXPO_PUBLIC_GRAPHQL_ENDPOINT` with a reachable external GraphQL HTTP(S) endpoint. The statically hosted web app does not provide a `/graphql` route, and the mobile app has no default endpoint. For example:

```powershell
$env:EXPO_PUBLIC_GRAPHQL_ENDPOINT = 'https://your-graphql-host.example/graphql'
npm start
```

Run mobile checks from the mobile directory with `npm test` and `npm run typecheck`. The root application checks remain available from the workspace root through `npm run check`, `npm run lint`, `npm run test:unit`, `npm run test:e2e`, and `npm run build`.
