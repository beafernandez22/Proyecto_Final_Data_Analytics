# H&M Retail Intelligence

### Customer Behavior, Sales Performance & Product Insights

**Autora:** Beatriz Fernández  
**Proyecto final | Bootcamp Data Analytics — Ironhack**

## 1. Descripción del proyecto

Este proyecto analiza datos históricos de ventas de **H&M** con el objetivo de comprender el comportamiento de compra de sus clientes, evaluar el rendimiento de las categorías de productos e identificar diferencias entre canales de venta.

El análisis busca responder a una pregunta de negocio:

**¿Cómo transformar los datos de clientes, productos y transacciones en información útil para mejorar las decisiones comerciales?**

Los resultados están orientados a apoyar decisiones de los equipos de marketing, fidelización, planificación de productos y estrategia comercial.

## 2. Objetivos

- Analizar la evolución de los artículos vendidos y los compradores únicos.
- Identificar diferencias en la actividad de compra según edad y afiliación al club.
- Evaluar las categorías más vendidas y su distribución por canal.
- Estudiar cómo cambia la composición de las ventas a lo largo del tiempo.
- Proponer recomendaciones comerciales basadas en los hallazgos.

## 3. Dataset y metodología

Se utiliza el dataset público **H&M Personalized Fashion Recommendations**, disponible en Kaggle, con información de clientes, artículos y transacciones.

El análisis comprende del **23 de septiembre de 2019 al 22 de septiembre de 2020**.

| Indicador | Resultado |
|---|---:|
| Artículos vendidos | 14.898.423 |
| Compradores únicos | 994.320 |
| Referencias de productos en el catálogo | 105.542 |

**Herramientas utilizadas:**

- **Python y Pandas:** exploración, limpieza y preparación de datos.
- **MySQL:** almacenamiento, consultas SQL y análisis de indicadores.
- **Tableau:** construcción de dashboards y visualización de resultados.
- **Git y GitHub:** organización y control de versiones.

## 4. Dashboards de Tableau

El proyecto incluye cinco dashboards que permiten recorrer el análisis desde una visión general hasta las recomendaciones comerciales.

| Dashboard | Contenido |
|---|---|
| **01 · Visión general del negocio** | Evolución mensual de artículos vendidos y compradores únicos. |
| **02 · Oportunidades de clientes** | Actividad de compra por edad, afiliación y preferencias de categorías. |
| **03 · Productos y canales** | Categorías más vendidas, composición por canal y diferencias entre edades. |
| **04 · Decisiones estratégicas** | Síntesis de hallazgos, recomendaciones y KPIs de seguimiento. |
| **05 · Evolución de preferencias** | Cambios mensuales en la participación de las categorías de productos. |

## 5. Principales hallazgos

**Clientes:** el segmento de 25–34 años registra una media de **18,29 artículos por comprador**. Los clientes ACTIVE del club presentan una mayor actividad media que los PRE-CREATE, aunque esta asociación no demuestra causalidad.

**Productos:** *Garment Upper body* representa el **38,62 %** de los artículos vendidos. Junto con *Garment Lower body*, concentra el **60,45 %**.

**Canales:** el canal 2 concentra el **71,85 %** de los artículos vendidos. La composición de categorías y la distribución por edad presentan diferencias entre ambos canales.

**Evolución temporal:** el peso mensual de las categorías varía durante el periodo analizado. Destaca el aumento relativo de *Swimwear* durante la primavera de 2020.

## 6. Recomendaciones estratégicas

A partir de los resultados, se proponen tres líneas de actuación:

1. **Optimización del surtido:** analizar la demanda por categoría, canal y periodo para mejorar la planificación comercial.
2. **Segmentación y fidelización:** probar campañas adaptadas a distintos perfiles de clientes y evaluar sus resultados.
3. **Estrategia por canal:** estudiar surtidos y acciones comerciales diferenciadas según los patrones de compra observados.

Estas propuestas deberían evaluarse mediante indicadores de seguimiento y pruebas controladas cuando sea posible.

## 7. Limitaciones del análisis

- Cada registro de transacción representa **un artículo vendido, no un pedido**.
- Los meses de septiembre de 2019 y septiembre de 2020 contienen datos parciales.
- Los canales se identifican como **1 y 2**, sin asumir que correspondan a tienda física o venta online.
- El análisis es descriptivo y no permite demostrar relaciones causales ni rentabilidad.

## 8. Fuente de datos

[H&M Personalized Fashion Recommendations — Kaggle](https://www.kaggle.com/competitions/h-and-m-personalized-fashion-recommendations)

---
