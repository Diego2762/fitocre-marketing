# Fitcore Store · Marketing

Repositorio de configuración (skills y hooks) para el trabajo de contenido y marketing de Fitcore Store.
Aquí NO se guardan imágenes, videos ni documentos.

## Fuente de verdad
Las instrucciones y reglas del proyecto viven en Google Drive, carpeta
Fitcore Marketing > 00 Sistema Claude (id `1JcnZn60OILE6MwPnslabNLmoa_qLSGo_`):
00 Instrucciones del proyecto, 01 Quiénes somos, 02 Marca Fitcore Store,
03 Flujo Asana, 04 Estándares de contenido, ads y Higgsfield.
Leerlas antes de producir contenido. Si algo choca con este archivo, mandan esos documentos.

Recordatorios clave: trabajar en español; la marca es "Fitcore Store" (no Grupo Fitcore);
nunca usar guion largo (raya); mostrar prompt, modelo, medida y créditos de Higgsfield y esperar un "sí" antes de generar.

## Dónde guardar el trabajo
Archivos finales en Drive > Fitcore Marketing > Producción
(id `1iecR3dywV5o4LHO7myzevvcqNFsj-GT7`), en la subcarpeta del mes con formato `AAAA-MM Mes`
(ej. `2026-10 Octubre`). Si la carpeta del mes no existe, crearla. Se pueden crear otras
subcarpetas cuando haga falta (por campaña, por tipo de pieza); no es una estructura estricta.
No hacer commit de archivos generados en este repo.

## Higgsfield
- Para el día a día, preferir el conector MCP de Higgsfield (no requiere login).
- La CLI (`higgsfield`) se instala con el hook de inicio, pero requiere `higgsfield auth login`
  en cada sesión nueva. En la nube el navegador redirige a `localhost:8765/callback?...`,
  que no carga: pedir al usuario que pegue esa URL y reenviarla con
  `curl --noproxy localhost '<url>'` mientras `higgsfield auth login --port 8765` corre en segundo plano.
- Workspace: `e221cd7a-ae6c-4678-8796-ad214b6a9f01` (`higgsfield workspace set <id>`).
- Los skills de Higgsfield están en `.claude/skills/`.

## Edición y montaje de video
- Toda edición por código (unir tomas, voz, subtítulos, textos, transiciones) se hace en el
  sandbox de Higgsfield (`sandbox_exec` del conector): tiene internet, ffmpeg y transcripción
  de voz, y no gasta créditos. El material entra por link y el resultado se sube con
  `media_upload` para tener un link público (al Drive se pasa a mano).
- Productos con etiqueta: animarlos en edición con las fotos reales (0 créditos, etiqueta fiel)
  antes que generarlos con AI.
- Reels faceless (voz en off + B-roll): skill `video-faceless`. El skill `higgsfield-video-explainer`
  es para explicativos animados en bloques de 10 s, no para reels.
- Detalle en el documento 04 (sección "Edición y montaje").
