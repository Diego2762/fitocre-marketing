# Guía de modelos por tipo de pieza

Usar para elegir 2 o 3 candidatos y luego cotizarlos con `get_cost`. Los modelos cambian seguido: si un id no existe, buscar el equivalente con `models_explore` (`action: "search"`).

## Video

| Pieza | Económica | Recomendada | Premium |
|---|---|---|---|
| Loop de producto (acercamiento, giro, luz) | `seedance1_5` 4 s, `kling3_0_turbo`, `wan2_7` | `kling3_0` (respeta mejor el envase con imagen de inicio) | `veo3_1`, `seedance_2_5` |
| B-roll sin personas (ambiente, tienda, texturas) | `grok_video_v15_lite`, `veo3_1_lite`, `kling3_0_turbo` | `kling3_0`, `wan3_0` | `veo3_1`, `cinematic_studio_3_0` |
| B-roll con personas (entrenando, manos, gestos) | `minimax_hailuo`, `kling3_0_turbo` | `kling3_0`, `minimax_h3` | `veo3_1`, `seedance_2_5` |
| Video ad con producto y referencias | `wan3_0`, `kling3_0` | `seedance_2_0` (producto, varias referencias) | `seedance_2_5`, `cinematic_studio_video_4_0` |
| UGC (persona habla o muestra el producto) | imagen del creador + `kling3_0` con audio | `marketing_studio_video` (hecho para UGC y ads) | `veo3_1` con diálogo, `seedance_2_5` |
| Varias tomas en un clip | `kling3_0` | `kling3_0` | `kling_o3_image_reference` |
| Hero cinematográfico | `kling3_0` | `veo3_1` | `cinematic_studio_3_0`, `seedance_2_5` 1080p |

## Edición de video existente

| Necesidad | Herramienta |
|---|---|
| Cambiar el producto u objeto en un video | `hf_mult_replace_object` (Genjutsu) |
| Copiar el movimiento de un video a otra persona/objeto | `hf_mult_motion_control` (Genjutsu) |
| Editar un video con instrucciones | `kling_video_edit`, `flux_3_video_edit` |
| Cambiar medida (9:16, 4:5, 1:1) | `reframe` |
| Subir calidad | `upscale_video` (o `topaz_video`) |
| Quitar fondo | `remove_background` / `video_background_remover` |
| Variantes de un ad (hooks, idioma, producto) | workflow `ad-multiplier` |

## Imagen

| Pieza | Económica | Recomendada | Premium |
|---|---|---|---|
| Boceto o idea rápida | `z_image`, `gpt_image_2_5` low, `seedream_5_0_flash` | `gpt_image_2_5` medium | |
| Foto de producto fiel al envase (con foto real) | `nano_banana_2_1` | `nano_banana_pro` | `nano_banana_pro` 4k |
| Imagen de ad con texto/copy en la imagen | `gpt_image_2_5` medium | `gpt_image_2_5` high | `ideogram_4_5`, `gpt_image_2_5` 2k/4k |
| Primer cuadro para animar | `gpt_image_2_5` medium, `seedream_v5_lite` | `nano_banana_pro` (si sale producto) | |
| Persona o escena realista | `seedream_v5_lite` | `seedream_v5_pro`, `gpt_image_2_5` high | `soul_cinematic` |
| Edición de imagen (quitar fondo, ampliar, reiluminar) | `remove_background`, `outpaint_image` | `nano_banana_2_relight`, `upscale_image` | |

## Notas

- Modelos con audio: `kling3_0`, `veo3_1`, `seedance_2_5`, `grok_video_v15`, `wan2_7`. Si no se necesita audio, no activarlo.
- Duraciones permitidas varían por modelo (ej. Veo 4/6/8 s, Hailuo 6/10 s, Seedance 1.5 4/8/12 s). Revisar con `models_explore` (`action: "get"`).
