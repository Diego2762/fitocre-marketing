# Fitcore Store · Marketing

Repositorio de configuración (skills, hooks e instrucciones para Claude Code) del trabajo de contenido y marketing de Fitcore Store.
Aquí NO se guardan imágenes, videos ni documentos generados: todo el contenido va a Drive.

## Fuente de verdad

1. **Proyecto de Claude "Fitcore Marketing"** (archivos 00 a 05). Si la sesión está conectada al proyecto, leerlos ahí.
2. **Copia en Google Drive:** Fitcore Marketing > 00 Sistema Claude (id `1JcnZn60OILE6MwPnslabNLmoa_qLSGo_`).
   Usar los documentos con versión en el título (00 v2.1, 01 v2.0, 02 v2.2, 03 v2.0, 04 v2.0, 05 v1.0).
   Los que dicen "versión anterior" están obsoletos.
3. **Extensión de marca vigente:** "Extension de Marca - Fitcore Store v1.1 (nov 2026).html" en
   GRUPO FITCORE > Fitcore Store Valera Lanzamiento > Manual de Marca (id `1XpsottE0AsW_AMBuMy4Uzlbl3xRQ6q7C`). La v1.0 está obsoleta.

Leer esas fuentes antes de producir contenido. Si algo choca con este archivo, mandan ellas.

## Reglas clave (resumen, versión 23 nov 2026)

- Trabajar en español. La marca es "Fitcore Store" (F mayúscula, c minúscula; nunca "FitCore"), no Grupo Fitcore.
- El local es "tienda", nunca "kiosco".
- Sin firma "Fitcore Store · Valera" y sin CTA en píldora: un solo CTA verde como texto subrayado, texto verde o sobre franja verde.
- Fondos permitidos: gradiente navy a morado (135°, #0B1840 a #3B1F6B), navy sólido, morado sólido o blanco.
- Nunca usar guion largo (raya).
- Precios, descuentos y disponibilidad solo desde Shopify (solo lectura), con fecha de fin visible en las promos.
- Nada de antes/después, promesas de salud o de resultados, quemadores ni imágenes de azar en piezas que puedan ir a pauta.
- Créditos de Higgsfield: el montaje en el sandbox cuesta 0 y se itera libre. Antes de gastar créditos (video, imagen, música, voz) usar la skill cotizador-higgsfield, mostrar prompt, modelo, duración, medida y créditos estimados, y esperar un "sí".
- Cada versión de una pieza se registra como comentario en su tarjeta de Asana (vN, link, cambios, créditos de la versión y total).
- Fhocos (contenido orgánico) y el departamento de ADs (María, pauta) trabajan en Asanas separados; un arte se produce una sola vez y el otro equipo lo reutiliza por link (archivo 05).

## Dónde guardar el trabajo

Archivos finales en Drive > Fitcore Marketing > Producción
(id `1iecR3dywV5o4LHO7myzevvcqNFsj-GT7`), en la subcarpeta del mes con formato `AAAA-MM Mes`
(ej. `2026-11 Noviembre`). Si la carpeta del mes no existe, crearla. Lo del departamento de ADs va en
la subcarpeta `ADs` del mes. Se pueden crear otras subcarpetas cuando haga falta (por campaña, por tipo de pieza).
El archivo final se copia a Drive cuando la pieza se aprueba.
No hacer commit de archivos generados en este repo.

## Higgsfield

- Para el día a día, preferir el conector MCP de Higgsfield (no requiere login). Su sandbox (`sandbox_exec`) es donde se hace todo el montaje por código.
- La CLI (`higgsfield`) se instala con el hook de inicio, pero requiere `higgsfield auth login`
  en cada sesión nueva. En la nube el navegador redirige a `localhost:8765/callback?...`,
  que no carga: pedir al usuario que pegue esa URL y reenviarla con
  `curl --noproxy localhost '<url>'` mientras `higgsfield auth login --port 8765` corre en segundo plano.
- Workspace: `e221cd7a-ae6c-4678-8796-ad214b6a9f01` (`higgsfield workspace set <id>`).
- Los skills de Higgsfield están en `.claude/skills/`.
