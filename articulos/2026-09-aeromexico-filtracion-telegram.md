---
titulo: "Aeroméxico y los 15 millones de registros en Telegram: un robo de 2025 que se sigue vendiendo en 2026"
fecha: 2026-09-23
autor: Pablo Mosqueira
categoria: Ciberseguridad / Protección de datos
etiquetas: [Aeroméxico, filtración de datos, Salesforce, ShinyHunters, terceros, LFPDPPP, SABG, phishing]
estado: borrador
---

# Aeroméxico y los 15 millones de registros en Telegram: un robo de 2025 que se sigue vendiendo en 2026

**En resumen:** El 18 de septiembre de 2026 alguien puso a la venta en Telegram una base de datos con más de 15 millones de registros atribuidos a clientes de Aeroméxico. La Secretaría Anticorrupción y Buen Gobierno (SABG) la detectó y lo hizo público el 20 de septiembre. Un día después, Aeroméxico dijo que los datos probablemente vienen de un incidente de **octubre de 2025**, cuando se accedió sin autorización a una plataforma de gestión de clientes **administrada por un proveedor externo**. No hubo datos bancarios ni contraseñas, pero sí nombres, correos, teléfonos y fechas de nacimiento. Con eso basta para montar campañas de fraude muy convincentes.

Nada de esto era nuevo. Desde octubre de 2025, Aeroméxico aparecía en el sitio de extorsión de ShinyHunters, con fecha de ataque del **4 de julio de 2025**, y el periodista especializado en ciberseguridad Ignacio Gómez Villaseñor lo había reportado públicamente. El segundo comunicado de la aerolínea confirma lo esencial de esa información.

El incidente deja tres lecciones para cualquier empresa mexicana. La información robada no caduca. El riesgo de terceros es riesgo propio. Y "no se publicó en su momento" no significa "no pasó nada".

---

## Qué pasó: la cronología

| Fecha | Hecho |
|---|---|
| **Jun–oct 2025** | Una campaña internacional de robo de datos en entornos **Salesforce** afecta a cientos de organizaciones en todo el mundo. La atribuyen a grupos que operan juntos como *Scattered LAPSUS$ Hunters* (ShinyHunters, Scattered Spider y Lapsus$). |
| **4 jul 2025** | Fecha del ataque contra Aeroméxico según el registro del grupo ShinyHunters que recoge el rastreador independiente ransomware.live, y según los metadatos del archivo robado. |
| **3 oct 2025** | El colectivo abre un sitio de filtraciones con **39 empresas** afectadas, entre ellas **Aeroméxico**, y amenaza con publicar su información si no se paga un rescate antes del 10 de octubre. |
| **3–4 oct 2025** | Ignacio Gómez Villaseñor publica en X que la muestra contiene **datos reales** de clientes de Aeroméxico. Aclara que no es ransomware sino extorsión tras un robo, y que la vulneración se originó en **Salesforce**: los registros tienen la estructura nativa de ese CRM (cuentas, contactos, reservaciones). |
| **10 oct 2025** | El FBI y la unidad francesa BL2C incautan el dominio de extorsión. La versión *onion* sigue en línea y parte de los datos se filtra. |
| **18 sep 2026** | Un usuario de Telegram ofrece una base de **más de 15 millones de registros (1.10 GB)** "presuntamente atribuible" a Aeroméxico. |
| **20 sep 2026** | La SABG lo informa públicamente. Obtuvo una **muestra de 100,092 registros** con nombre completo, correo, teléfono, celular, fecha de nacimiento y fecha de alta. En la muestra aparecen **servidores públicos y figuras públicas**. Ese mismo día, Aeroméxico emite un **primer comunicado**: dice haber iniciado una investigación y descarta la exposición de datos financieros y de contraseñas, incluidas las de Aeroméxico Rewards. **No menciona el incidente de 2025 ni al proveedor externo.** |
| **21 sep 2026** | **Segundo comunicado** con los avances de su investigación forense. Ahora sí vincula los datos al incidente de octubre de 2025 y a un proveedor externo. |

## Dos comunicados, dos versiones

La diferencia entre los dos comunicados es el dato más revelador del caso.

- **20 de septiembre:** Aeroméxico presenta el tema como una "presunta" base de datos que empezaba a investigar. Se concentra en lo que *no* se expuso.
- **21 de septiembre:** reconoce que hubo una **sustracción de datos personales y de contacto de sus clientes**, que ocurrió en **2025**, a través de un **proveedor externo**, y que en ese momento activó protocolos de respuesta y trabajó con el proveedor en la contención.

Es decir, la aerolínea **sabía del incidente y le daba seguimiento desde 2025**. Gómez Villaseñor lo resume en una pregunta: si desde octubre de 2025 estaban dando seguimiento al caso, ¿por qué el primer comunicado evitó decirlo? En 24 horas no cambió la evidencia forense. Cambió lo que la empresa decidió contar.

## Qué dice Aeroméxico y qué no dice

En su comunicado del 21 de septiembre, la aerolínea afirma lo siguiente:

- **No** identificó exposición de datos financieros (cuentas bancarias, tarjetas), contraseñas ni itinerarios de vuelo.
- La información involucrada son **nombres y, en algunos casos, fechas de nacimiento, correos y teléfonos**.
- El incidente **no afectó** su infraestructura tecnológica, sus operaciones ni sus servicios.
- El acceso no autorizado ocurrió en una **plataforma de gestión de información de clientes administrada por un proveedor externo**. La aerolínea no dice cuál. El formato de los datos, la lista del grupo atacante y el análisis que Gómez Villaseñor publicó en 2025 apuntan a **Salesforce**.
- "En ese momento, no se materializó la divulgación de datos de clientes de Aeroméxico por parte de los ciberdelincuentes."

Quedan varias preguntas abiertas, y las hacemos con la información pública disponible:

1. **Hay cifras distintas.** En 2025 los atacantes hablaron de volúmenes mayores (se mencionaron 172.9 GB con direcciones, pasaportes y reservaciones). Hoy la base en Telegram tiene 15 millones de registros y 1.10 GB. Las dos cosas pueden ser ciertas a la vez: lo que se vende ahora puede ser un subconjunto "limpio" del botín original. Todavía no se sabe si hay más.
2. **La fecha del incidente.** Aeroméxico habla de "octubre de 2025". Pero el registro del grupo atacante (recogido por ransomware.live y Resecurity) y los metadatos del archivo fechan el robo el **4 de julio de 2025**. Octubre fue cuando se hizo público. Es decir, los datos llevan más de 14 meses en manos de los delincuentes.
3. **¿Cuántas personas y qué periodo?** Aeroméxico no ha precisado cuántos clientes están afectados ni de qué años son las reservaciones. Circulan cifras distintas (15, 30 y 39 millones de registros), pero ninguna está confirmada por la empresa ni por la autoridad.
4. **La notificación a los titulares.** Desde marzo de 2025, la nueva LFPDPPP obliga a informar **de inmediato** a las personas afectadas cuando una vulneración afecta de forma significativa sus derechos patrimoniales o morales (art. 19). No encontramos un aviso público y generalizado a clientes en 2025, aunque la empresa ahora reconoce que conocía el incidente desde entonces. Si los datos se robaron entonces, la pregunta no es si se divulgaron, sino si los titulares tuvieron oportunidad de protegerse.

## Por qué "solo nombres y correos" sí es grave

Es tentador leer "no hubo datos bancarios" y dar el caso por cerrado. Sería un error. Una base con **nombre completo, correo, celular y fecha de nacimiento** de clientes de una aerolínea es justo la materia prima del fraude dirigido:

- **Phishing y smishing con contexto real:** "Estimado/a [nombre], su vuelo presenta un cambio, confirme su reservación aquí". El atacante sabe que eres cliente y tiene tu nombre y tu número.
- **Vishing (fraude telefónico):** alguien se hace pasar por la aerolínea, por el programa de lealtad o por el banco, y "valida" tu identidad con tu fecha de nacimiento para ganarse tu confianza.
- **Toma de cuentas:** la fecha de nacimiento suele ser pregunta de seguridad o parte de contraseñas débiles. Si se combina con filtraciones anteriores, el riesgo crece.
- **Objetivos de alto valor:** la SABG encontró **servidores públicos y figuras públicas** en la muestra. Para un atacante eso es una lista de blancos para ingeniería social o suplantación.

Además, los datos personales no caducan: nadie cambia su fecha de nacimiento y casi nadie cambia de celular después de una filtración. Por eso una base robada en 2025 sigue teniendo valor comercial en 2026.

## El patrón de fondo: la cadena de suministro SaaS

Aeroméxico no es un caso aislado. La campaña de 2025 contra entornos Salesforce tuvo dos vías principales, documentadas por Google Threat Intelligence y por un aviso FLASH del FBI (12 de septiembre de 2025):

- **UNC6040 (vishing):** los atacantes llamaban a empleados haciéndose pasar por soporte de TI y los convencían de autorizar una aplicación conectada, una versión maliciosa de *Data Loader*. Con eso descargaban la información del CRM.
- **UNC6395 (tokens OAuth):** robaron tokens de integración de la app *Salesloft Drift* y los usaron para extraer datos de **más de 700 organizaciones**, incluidas empresas de ciberseguridad.

Ninguna de las dos vías explotó una falla en los servidores de las víctimas. Aprovecharon **la confianza**: la de un empleado en una llamada y la de una plataforma en una integración de terceros. Por eso Aeroméxico puede decir con razón que "no se afectó su infraestructura" y aun así tener los datos de sus clientes a la venta.

## El contexto regulatorio en México

Este es uno de los primeros casos de alto perfil con la **nueva LFPDPPP** (publicada el 20 de marzo de 2025). Sus puntos relevantes aquí:

- Tras la extinción del INAI, la **Secretaría Anticorrupción y Buen Gobierno** es ahora la autoridad de protección de datos personales en el sector privado. Esta vez **la propia autoridad detectó** la venta en Telegram mediante monitoreo y la hizo pública. Es una señal de que la SABG va a vigilar de forma activa.
- La ley distingue al **responsable** (quien decide sobre el tratamiento, en este caso la aerolínea) del **encargado** (el proveedor que trata los datos por su cuenta). Que el acceso ocurriera en el proveedor **no quita la responsabilidad** al responsable. El comunicado de Aeroméxico lo reconoce: "Aeroméxico es responsable de proteger la información de sus clientes".
- Las multas pueden llegar a **320,000 UMA** y se duplican cuando hay datos sensibles.

## Qué deben hacer las empresas (lecciones accionables)

**1. Inventariar y gobernar integraciones SaaS.**
Revisar qué aplicaciones conectadas (OAuth) tienen acceso al CRM y a otras plataformas con datos de clientes, con qué permisos y desde cuándo. Revocar lo que no se usa, rotar tokens y restringir por IP cuando se pueda.

**2. Tratar al proveedor como parte del perímetro (Zero Trust).**
Pedir contractualmente plazos de notificación de incidentes, evidencia de controles y derecho a auditoría. Si el proveedor administra tu CRM, sus registros de actividad deben llegar a tu monitoreo.

**3. Monitorear la exfiltración, no solo la intrusión.**
Una descarga masiva desde el CRM (reportes, exportaciones o llamadas a la API fuera de patrón) es una señal temprana. Muchas víctimas de 2025 se enteraron por el sitio de extorsión, no por sus alertas.

**4. Preparar al personal contra el vishing.**
La vía de entrada fue una llamada telefónica. Hay que entrenar a mesa de ayuda y a usuarios con acceso privilegiado a no autorizar aplicaciones ni teclear códigos de verificación a pedido de alguien que llama.

**5. Vigilar la fuga después del incidente.**
Un incidente no termina al contenerlo. Hay que dar seguimiento continuo en foros, sitios de filtración y canales de Telegram para detectar cuando los datos reaparecen, como ocurrió aquí casi un año después.

**6. Notificar pronto y con claridad.**
Además de ser obligatorio, notificar permite que los clientes se protejan cuando todavía sirve. Un aviso tardío erosiona la confianza más que el incidente mismo.

## Qué deben hacer los clientes de Aeroméxico

Si **has comprado vuelos con Aeroméxico**, asume que tus datos de contacto pueden estar en esa base.

- **Desconfía** de correos, SMS, WhatsApp o llamadas que mencionen tu vuelo, tu reservación o tu programa de lealtad y pidan datos, pagos o "validaciones". Verifica siempre en los canales oficiales, escribiendo tú la dirección o marcando tú el número.
- **Nunca compartas** códigos de verificación (OTP) ni contraseñas por teléfono.
- **Activa la autenticación de dos factores** en tu correo y en tus cuentas de viaje y bancarias.
- **No uses tu fecha de nacimiento** en contraseñas ni como respuesta de seguridad.
- **Revisa tus estados de cuenta** y alerta a tu banco ante cualquier llamada que diga venir de ellos y use tus datos personales para "validarte".

---

## Conclusión

El caso Aeroméxico no se trata de una aerolínea "hackeada" en septiembre de 2026. Se trata de cómo un robo de datos en la **cadena de suministro SaaS** de 2025 sigue generando riesgo, y dinero para los delincuentes, un año después. La pregunta útil para cualquier consejo de administración o dirección de TI en México es esta: **¿sabemos qué terceros tienen nuestros datos de clientes y cómo nos enteraríamos si esos datos aparecen a la venta mañana?**

---

### Fuentes

- Aeroméxico, comunicado "Aeroméxico informa avances de su investigación forense", 21 de septiembre de 2026.
- Excélsior — [Aeroméxico responde a versiones sobre supuesta base de datos](https://www.excelsior.com.mx/nacional/aeromexico-responde-versiones-sobre-supuesta-bases-datos) (primer comunicado, 20 de septiembre de 2026)
- Ignacio Gómez Villaseñor en X — [evidencia de robo de datos reales de Aeroméxico (oct 2025)](https://x.com/ivillasenor/status/1974497366951571773) y [origen en Salesforce (oct 2025)](https://x.com/ivillasenor/status/1974170489456075164); [listado de Aeroméxico por ShinyHunters (oct 2025)](https://x.com/ivillasenor/status/1974163761754759217).
- ransomware.live — registro de víctimas en México: Aeroméxico, grupo ShinyHunters, fecha de ataque 4 de julio de 2025 (consultado vía inteligencia interna QMA).
- El Imparcial — [Secretaría Anticorrupción investiga una posible filtración de más de 15 millones de datos de pasajeros de Aeroméxico](https://www.elimparcial.com/mexico/2026/09/20/secretaria-anticorrupcion-investiga-una-posible-filtracion-de-mas-de-15-millones-de-datos-de-pasajeros-de-aeromexico-ofrecidos-en-telegram-y-analiza-una-muestra-de-100-mil-registros/)
- Xataka México — [Detectan posible filtración de datos de Aeroméxico en Telegram](https://www.xataka.com.mx/seguridad/detectan-posible-filtracion-datos-aeromexico-telegram-base-tendria-15-millones-registros)
- El Informador — [Anticorrupción investigará presunta filtración de base de datos de la aerolínea](https://www.informador.mx/mexico/aeromexico-apareces-tu-anticorrupcion-investigara-presunta-filtracion-de-base-de-datos-de-la-aerolinea-en-telegram-20260920-0085.html)
- La Razón — [Aeroméxico confirma filtración de datos de clientes; ocurrió en octubre del 2025](https://www.razon.com.mx/negocios/2026/09/21/aeromexico-confirma-filtracion-de-datos-de-clientes-ocurrio-en-octubre-del-2025-afirma/)
- Expansión — [Aeroméxico adjudica exposición de datos de clientes a un ciberataque](https://expansion.mx/empresas/2026/09/21/aeromexico-adjudica-exposicion-datos-clientes-a-ciberataque)
- UnoTV — [Aeroméxico desmiente ciberataque reciente](https://www.unotv.com/negocios/aeromexico-desmiente-ciberataque-reciente-acota-que-filtracion-seria-tras-incidente-de-2025/)
- UPI — [Mexico probes possible Aeromexico customer data breach](https://www.upi.com/Top_News/World-News/2026/09/21/latam-mexico-aeromexico-date-breach-investigation/7411790010504)
- Resecurity — [ShinyHunters Launches Data Leak Site: Trinity of Chaos Announces New Ransomware Victims](https://www.resecurity.com/blog/article/shinyhunters-launches-data-leak-site-trinity-of-chaos-announces-new-ransomware-victims)
- BleepingComputer — [ShinyHunters launches Salesforce data leak site to extort 39 victims](https://www.bleepingcomputer.com/news/security/shinyhunters-starts-leaking-data-stolen-in-salesforce-attacks/)
- CyberInsider — [Scattered Lapsus$ Hunters Leak First Wave of Salesforce Victim Data](https://cyberinsider.com/scattered-lapsus-hunters-leak-first-wave-of-salesforce-victim-data/)
- The Hacker News — [FBI Warns of UNC6040 and UNC6395 Targeting Salesforce Platforms](https://thehackernews.com/2025/09/fbi-warns-of-unc6040-and-unc6395.html)
- Hogan Lovells — [Nueva Ley Federal de Protección de Datos de México: implicaciones para las empresas](https://www.hlc.com/es/publications/mexicos-new-federal-data-protection-law-what-it-means-for-companies)
- Greenberg Traurig — [Nueva LFPDPPP](https://www.gtlaw.com/en/insights/2025/3/nueva-ley-general-proteccion-de-datos)
