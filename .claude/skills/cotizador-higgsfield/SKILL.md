---
name: cotizador-higgsfield
description: |
  Asesor de costos para generar en Higgsfield sin gastar créditos de más. Antes de
  generar cualquier imagen o video (ads, imágenes de ads, loops de producto, UGC,
  B-roll, ediciones de video o imagen, referencias), hace las preguntas justas,
  revisa saldo y modelos ilimitados en vivo, cotiza 2 o 3 modelos con el costo real
  y recomienda el más barato que cumple. Para imágenes de referencia compara
  generarlas en Higgsfield contra hacerlas en ChatGPT.
  Usar cuando: "voy a generar un video", "cotiza este video", "qué modelo uso",
  "hazme un ad", "un loop del producto", "un UGC", "B-roll", "edita este video",
  "cuántos créditos sale", "quiero ahorrar créditos", o antes de cualquier
  generate_video / generate_image de Higgsfield.
---

# Cotizador Higgsfield

Objetivo: que cada pieza salga con el modelo más barato que cumple lo que la pieza necesita. No es para limitar: el usuario siempre puede elegir otro modelo, la opción premium o saltarse pasos. El skill informa, recomienda y espera el "sí".

Funciona con el conector de Higgsfield (MCP), así sirve igual en Cowork, en chat y en Claude Code. Si solo hay CLI, usar `higgsfield generate cost <modelo> ...` para cotizar.

Todo el texto para el usuario va en español y sin guion largo (raya).

## Paso 1. Entender la pieza (preguntas cortas)

Pregunta solo lo que falte; si el usuario ya lo dijo, no lo repitas. Todas juntas, en un solo mensaje, con opciones para elegir rápido:

1. **Tipo de pieza**: imagen de ad, imagen de referencia o primer cuadro, loop de producto, B-roll, video ad, UGC (persona hablando o mostrando el producto), edición de un video o imagen existente, otro.
2. **Destino y medida**: Reel/TikTok/Story 9:16, feed 4:5 o 1:1, ad Meta (las 3 medidas), horizontal 16:9.
3. **Duración** (si es video): sugerir lo mínimo que funciona (loop 4 a 5 s, B-roll 4 a 6 s, ad 6 a 10 s por toma).
4. **Calidad**: borrador para probar idea, final para publicar, o hero/premium.
5. **Qué sale en cuadro**: solo producto, producto con manos, persona (¿habla a cámara?), escena sin producto.
6. **Audio**: ninguno (se agrega música en edición), sonido ambiente, o voz/diálogo.
7. **Referencias**: cuántas fotos reales del producto o imágenes de referencia hay; si hay que crearlas; si existe un video base (para ediciones).

Si el usuario dice "rápido" o ya dio todo, pasa directo al Paso 2.

## Paso 2. Revisar en vivo

Hazlo en paralelo:

- `balance`: créditos disponibles.
- `models_explore` con `action: "recommend"`, `type` (video o image), `input` (text o image) y una `query` que describa la pieza. Mira el bloque `unlim` y los modelos con `supports_unlim`: si hay generaciones ilimitadas disponibles que cubren un modelo apto, esa es la opción de 0 créditos.
- Para cada candidato (2 o 3), pedir el costo real con `get_cost: true` en `generate_video` o `generate_image` con los parámetros exactos (modelo, duración, medida, resolución, calidad, audio). Nunca inventar precios: la tabla de `references/precios-referencia.md` es solo orientación y puede estar desactualizada.

Candidatos: elígelos con `references/guia-modelos.md` según el tipo de pieza.

## Paso 3. Recomendar

Muestra una tabla corta:

| Opción | Modelo | Ajustes | Créditos | Por qué |
|---|---|---|---|---|
| Económica | ... | ... | ... | ... |
| Recomendada | ... | ... | ... | ... |
| Premium | ... | ... | ... | ... |

Debajo:
- **Costo realista**: si la pieza es nueva o difícil (personas, manos, texto, movimiento complejo), avisa que suele necesitar 2 o 3 intentos y muestra el total probable.
- **Plan de ahorro** cuando aplique (ver "Reglas de ahorro").
- **Saldo después** de generar.
- Si una sola generación supera 25 créditos, dilo claramente y propone una alternativa más barata o un borrador primero. No bloquear: si el usuario confirma, se hace.

## Paso 4. Imágenes de referencia: Higgsfield o ChatGPT

Cuando la pieza necesita imágenes nuevas (primer cuadro, escena, persona, ad estático):

- En Higgsfield, GPT Image 2.5 cuesta muy poco (cotizar; orientativo 0.25 en `quality: low`, 1.5 en `high`). Nano Banana Pro y Nano Banana 2.1 son los mejores para respetar el envase real usando la foto del producto como referencia.
- Ventaja de generar en Higgsfield: el `job_id` de la imagen se usa directo como referencia del video, sin descargar ni subir nada.
- Ofrece ChatGPT cuando conviene de verdad: muchas iteraciones conversacionales sobre la misma imagen ("muévelo, cambia la luz, ahora sin texto"), o cuando el saldo de Higgsfield está bajo. Pregunta: "¿La hacemos en ChatGPT (incluido en tu plan, la subes después) o aquí con <modelo> por <X> créditos?". Si elige ChatGPT, entrega el prompt listo para pegar, la medida y qué foto de referencia adjuntar; luego súbela con `media_upload`.
- Para fotos de producto donde la etiqueta debe salir fiel, recomendar Higgsfield con la foto real (Drive > Fitcore Productos), no ChatGPT.

## Paso 5. Confirmar y generar

- Resume en una línea: modelo, prompt, medida, duración, audio, créditos. Espera un "sí" explícito.
- Una generación a la vez (`count: 1`), salvo que pidan variantes.
- Si `generate_video` devuelve `unlim_choice`, pregunta al usuario si usa ilimitadas o créditos.
- Después de generar: reporta créditos usados y saldo restante. Si el proyecto lo pide, deja prompt, modelo, ajustes y créditos en la tarea de Asana y el archivo final en Drive > Fitcore Marketing > Producción > AAAA-MM Mes.

## Reglas de ahorro

Aplica las que sirvan para la pieza; no todas siempre.

1. **Imagen antes que video**: para piezas nuevas, aprobar primero el primer cuadro como imagen (0.25 a 2 créditos) y animar después. Evita perder un video entero por composición.
2. **Borrador barato, final bueno**: probar movimiento y ritmo con un modelo barato o a 480p/720p; repetir en el modelo final solo cuando la idea funciona. Recomendado en formatos nuevos; opcional en formatos ya aprobados.
3. **Duración mínima útil**: los créditos suben con los segundos. Un loop de 5 s se repite en edición.
4. **Audio solo si hace falta**: la música se pone en edición; pagar audio generado solo para voz o sonido sincronizado.
5. **Resolución**: 720p suele bastar para Reels; 1080p o 4K solo para hero. Considerar `upscale` sobre el clip elegido en vez de generar todo en alta.
6. **Formatos ya aprobados**: si existe un formato estándar (archivo 04, "Formatos estándar aprobados"), reutilizar su modelo y ajustes; no volver a explorar.
7. **Ad en 3 medidas**: generar la toma principal una vez y usar `reframe` para las otras medidas cuando la composición lo permita, en vez de generar 3 veces.
8. **Ediciones antes que regenerar**: si un video casi sirve, cotizar una edición (replace object, kling video edit, upscale, reframe) antes de generarlo de nuevo.
9. **Ilimitadas**: si hay generaciones ilimitadas que cubren un modelo apto, priorizarlo. Algunas promos de Higgsfield solo aplican en su web: en ese caso, ofrecer el prompt listo para que el usuario lo genere allá.

## Si el usuario ya sabe qué quiere

Si pide un modelo concreto, respétalo: cotízalo y, solo si hay una alternativa claramente más barata con resultado parecido, menciónala en una línea. No insistir.
