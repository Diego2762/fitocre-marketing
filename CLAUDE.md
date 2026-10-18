# FitCore Marketing

Repositorio de configuración (skills y hooks) para el trabajo de marketing de Grupo FitCore.
Aquí NO se guardan imágenes, videos ni documentos.

## Idioma
Responder siempre en español.

## Dónde guardar el trabajo
Todo lo que se genere (imágenes, videos, textos, briefs, reportes) se guarda en Google Drive,
en la carpeta **Fitcore Marketing**:
https://drive.google.com/drive/folders/1lSyfVJSdT5WWgBjOgbr9UvD-fRTpcwcX
(id `1lSyfVJSdT5WWgBjOgbr9UvD-fRTpcwcX`). Organizar en subcarpetas por campaña o tipo de contenido.
No hacer commit de archivos generados en este repo.

Otras carpetas de Drive útiles:
- Fitcore Productos: `16bzf-KyPDbdV41wRaajcARjvrScORBXN`
- FITCORE STORE LOGOS: `1YGUPAnrdeYX5NbSh7KZU0chR3Iu1ZIba`

## Higgsfield
- Para generaciones del día a día, preferir el conector MCP de Higgsfield (no requiere login).
- La CLI (`higgsfield`) se instala con el hook de inicio, pero requiere `higgsfield auth login`
  en cada sesión nueva. En la nube el navegador redirige a `localhost:8765/callback?...`,
  que no carga: pedir al usuario que pegue esa URL y reenviarla con
  `curl --noproxy localhost '<url>'` mientras `higgsfield auth login --port 8765` corre en segundo plano.
- Workspace: `e221cd7a-ae6c-4678-8796-ad214b6a9f01` (`higgsfield workspace set <id>`).
- Los skills de Higgsfield están en `.claude/skills/`.
