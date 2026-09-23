# Caso 2: "Eternal": venta de 12.9 millones de leads bancarios (sep 2026)

Estado: **REGISTRADO, NO PUBLICABLE TODAVÍA** (falta confirmación independiente)
Fecha de registro: 2026-09-23

## ¿Es el mismo caso que Aeroméxico?

**No. Es un segundo caso**, con un vendedor en común.

| | Caso 1: Aeroméxico | Caso 2: Leads bancarios |
|---|---|---|
| Vendedor | "Eternal" (atribución de SILIKN, **confirmada**) | "Eternal" (según el informante; **sin confirmar**) |
| Origen de los datos | CRM (Salesforce) de un proveedor externo, robado por ShinyHunters | Call centers que venden productos bancarios (según el propio vendedor) |
| Fecha de los datos | Robo del 4 de julio de 2025 | Registros fechados en abril de 2025 (según las muestras) |
| Volumen | Más de 15 millones de registros, 1.10 GB | 12,909,799 líneas en 13 archivos CSV (según el vendedor) |
| Campos | Nombre, correo, teléfono, fecha de nacimiento, fecha de alta | Nombre, RFC, hasta 4 teléfonos, domicilio, banco, producto, límite de crédito, score de Buró, **últimos 4 dígitos de tarjeta** |
| Entidades mencionadas | Aeroméxico | Banamex, HSBC, BBVA, Santander, Banorte, Scotiabank, Invex, Liverpool, Sears |
| Postura de la empresa o la autoridad | Aeroméxico lo reconoció; la SABG investiga | Ninguna encontrada (bancos, CONDUSEF, CNBV, SABG) |

**Cuidado con confundirlos:**
- El archivo `Banamex_CrossSell_Joy` menciona la tarjeta **"Aeroméxico"**. Es el nombre de un producto de Banamex (tarjeta de marca compartida), no datos de la aerolínea.
- `Amazon_Transacciones` tampoco indica una filtración de Amazon: es un nombre de campaña dentro de las bases de leads.

El patrón común es que "Eternal" parece funcionar como **revendedor o intermediario** de bases de distinto origen, no como autor del robo a Aeroméxico (ese fue ShinyHunters).

## Estado de verificación

| Afirmación | Estado | Fuente |
|---|---|---|
| "Eternal" vende la base de Aeroméxico | **Confirmado** | SILIKN (vía Xataka y Fortuna y Poder), independiente del informante |
| Existe una oferta de 12.9 millones de leads bancarios con 13 CSV y precio de 16,500 MXN | Solo informante | Capturas de Ignacio Gómez Villaseñor. Proyecto Puente y Capital México **citan su alerta**; no hicieron verificación propia. |
| El vendedor de los leads es el mismo "Eternal" | Solo informante | Sin confirmar |
| Los datos son reales y de abril de 2025 | Solo informante | Sin validación técnica independiente |
| Origen en call centers | Solo lo dice el vendedor | Es el texto del anuncio |
| Base interna QMA (`darkweb_intel`, `ransomware_mx_victims`, `blacktrace_group_intel`, `threat_actor_classification`, `villain_canonical`) | Sin coincidencias | No hay registros de "Eternal" ni de bancos mexicanos |

## Qué falta para publicar

Basta una de estas:

1. Una postura de algún banco mencionado, de la ABM, de CONDUSEF, de la CNBV o de la SABG.
2. Una segunda firma de inteligencia de amenazas (por ejemplo SILIKN u otra) que confirme la oferta y al vendedor.
3. Una validación técnica independiente de la muestra, hecha por un tercero autorizado. QMA no debe descargar ni manipular datos personales.

## Notas

- Las capturas tienen marca de agua de @IVILLASENOR. No se deben reproducir sin su permiso; citar la fuente.
- Si se confirma, el caso afecta la regulación bancaria (CNBV, secreto bancario) además de la LFPDPPP. El riesgo principal para las personas es el vishing con datos reales: "su tarjeta Oro con terminación 4521...".

## Fuentes

- [Proyecto Puente: Hacker pone a la venta datos de millones de tarjetahabientes de Banamex, HSBC y BBVA](https://proyectopuente.com.mx/2026/09/22/alerta-hacker-pone-a-la-venta-datos-de-millones-de-tarjetahabientes-de-banamex-hsbc-y-bbva/)
- [Capital México: Reportan venta de información de clientes bancarios](https://www.capitalmexico.com.mx/tema-dia/tus-datos-estan-en-riesgo-reportan-venta-de-informacion-de-clientes-bancarios/)
- [Xataka México: atribución de SILIKN a "Eternal" (caso Aeroméxico)](https://www.xataka.com.mx/seguridad/detectan-posible-filtracion-datos-aeromexico-telegram-base-tendria-15-millones-registros)
- [Fortuna y Poder: Aeroméxico confirma oferta de datos en Telegram](https://fortunaypoder.com/corporativos/aeromexico-confirma-oferta-de-datos-de-clientes-en-telegram-descarta-informacion-financiera)
