
# H&M Retail Intelligence
### Customer Behavior, Sales Performance & Product Insights

**Autora:** Beatriz Fernández  
**Proyecto final | Bootcamp Data Analytics — Ironhack**

## 1. Descripción del proyecto

**H&M Retail Intelligence** es un proyecto de análisis de datos que transforma millones de registros de transacciones en información útil para comprender la actividad comercial de H&M e identificar oportunidades de mejora.

El proyecto responde a una pregunta de negocio:

**¿Cómo puede H&M utilizar sus datos de transacciones para entender mejor el comportamiento de sus clientes, el rendimiento de sus productos y las diferencias entre canales de venta?**

El análisis está orientado a apoyar decisiones de los equipos de **dirección comercial, marketing y CRM, y planificación de productos**.

El proyecto combina análisis de datos con SQL, visualizaciones interactivas en Tableau y una aplicación desarrollada en Streamlit para explorar escenarios comerciales.

## 2. Objetivos

- Analizar la evolución de los artículos vendidos y los compradores únicos.
- Identificar diferencias en la actividad de compra según edad y afiliación al club.
- Estudiar las categorías de productos con mayor volumen de ventas.
- Comparar la distribución de productos entre canales de venta.
- Analizar la evolución mensual de las preferencias de productos.
- Proponer recomendaciones comerciales basadas en datos.
- Explorar escenarios hipotéticos mediante una aplicación interactiva.

## 3. Dataset y metodología

**Fuente:** H&M Personalized Fashion Recommendations (Kaggle).

El dataset original contiene información sobre clientes, artículos y más de 31 millones de registros de transacciones.

Para este proyecto se seleccionó el periodo comprendido entre el **23 de septiembre de 2019 y el 22 de septiembre de 2020**.

| Indicador | Resultado |
|---|---:|
| Artículos vendidos | 14.898.423 |
| Compradores únicos | 994.320 |
| Referencias de productos del catálogo | 105.542 |

### Herramientas utilizadas

- **Python y Pandas:** exploración, limpieza, preparación y validación de datos.
- **MySQL:** creación del modelo relacional, consultas SQL y cálculo de indicadores.
- **Tableau:** desarrollo de dashboards y visualización de resultados.
- **Streamlit:** aplicación interactiva para explorar datos y escenarios comerciales.
- **Git y GitHub:** control de versiones y documentación.

### Proceso de trabajo

1. Exploración y preparación de los datos originales con Python.
2. Creación de una base de datos relacional en MySQL.
3. Desarrollo de consultas SQL para analizar clientes, productos y canales.
4. Exportación de resultados agregados para visualización.
5. Construcción de dashboards en Tableau.
6. Desarrollo de un simulador interactivo en Streamlit.
7. Interpretación de resultados y elaboración de recomendaciones.

## 4. Visualización de resultados: Tableau

Se desarrollaron **cinco dashboards** que siguen un recorrido desde el diagnóstico comercial hasta la propuesta de decisiones.

| Dashboard | Contenido |
|---|---|
| **01 · Visión general del negocio** | Evolución mensual de artículos vendidos y compradores únicos. |
| **02 · Oportunidades de clientes** | Actividad por edad, afiliación al club y preferencias de categorías. |
| **03 · Productos y canales de venta** | Categorías más vendidas y diferencias entre canales y grupos de edad. |
| **04 · Decisiones estratégicas** | Hallazgos principales, recomendaciones y KPIs de seguimiento. |
| **05 · Evolución de preferencias de producto** | Cambios mensuales en la participación de las categorías. |

Los dashboards permiten identificar patrones de compra, comparar segmentos y estudiar la composición de las ventas desde diferentes perspectivas.

El libro de Tableau se encuentra en la carpeta `tableau/`.

## 5. Aplicación interactiva: Streamlit

Como complemento al análisis en Tableau, se desarrolló una aplicación en **Streamlit** que permite explorar los resultados y evaluar escenarios comerciales hipotéticos.

La aplicación utiliza datos agregados procedentes del análisis SQL e incorpora visualizaciones interactivas con Plotly.

Entre sus funcionalidades se incluyen:

- Exploración de indicadores comerciales y segmentos de clientes.
- Simulación de campañas segmentadas por edad y afiliación.
- Análisis de posibles ajustes en la planificación del surtido.
- Comparación de patrones de compra entre canales.
- Visualización de escenarios para apoyar la planificación comercial.

**Importante:** los escenarios se basan en supuestos definidos por el usuario. No representan predicciones garantizadas ni demuestran efectos causales.

### 🚀 Aplicación publicada

Puedes explorar el simulador interactivo de H&M Retail Intelligence aquí:

**[Abrir H&M Retail Intelligence — Streamlit](https://hm-retail-intelligence-beatriz-fernandez.streamlit.app/)**

## 6. Principales hallazgos

**Clientes:** el grupo de 25–34 años registra una media de **18,29 artículos por comprador**. Los clientes ACTIVE del club presentan una actividad media de **15,40 artículos**, frente a **5,48** en PRE-CREATE.

**Productos:** *Garment Upper body* representa el **38,62 %** de los artículos vendidos. Junto con *Garment Lower body*, concentra el **60,45 %**.

**Canales:** el canal 2 concentra el **71,85 %** de los artículos vendidos. La composición de categorías presenta diferencias entre los canales 1 y 2.

**Evolución temporal:** la participación mensual de las categorías cambia a lo largo del periodo. Destaca *Swimwear*, que alcanza aproximadamente el **15,6 %** de los artículos vendidos en mayo de 2020.

## 7. Recomendaciones estratégicas

A partir de los resultados se proponen tres líneas de actuación:

1. **Optimización del surtido:** estudiar la planificación de productos según categoría, canal y periodo.
2. **Segmentación y fidelización:** probar campañas adaptadas a distintos perfiles de clientes.
3. **Estrategia por canal:** evaluar acciones comerciales diferenciadas según los patrones observados.

Estas recomendaciones pueden explorarse mediante el simulador de Streamlit y deberían validarse posteriormente con indicadores de seguimiento y pruebas controladas.

## 8. Limitaciones y próximos pasos

### Limitaciones

- Cada registro representa **un artículo vendido, no un pedido**.
- Los precios están normalizados, por lo que no se calculan ingresos reales en euros.
- Septiembre de 2019 y septiembre de 2020 son meses parciales.
- Los canales se identifican como **1 y 2**, sin confirmar su correspondencia con tienda física u online.
- El análisis es descriptivo y no permite demostrar causalidad.
- Los escenarios de Streamlit son hipotéticos y dependen de los supuestos utilizados.

### Próximos pasos

- Ampliar el periodo histórico para estudiar patrones de demanda.
- Profundizar en la segmentación de clientes mediante análisis RFM y cohortes.
- Evaluar las recomendaciones mediante pruebas A/B.
- Incorporar nuevas variables comerciales para mejorar el análisis y la simulación.

## 9. Estructura del proyecto

```text
Proyecto_Final_Data_Analytics/
├── app/                  # Aplicación Streamlit
│   ├── app.py
│   ├── data/
│   ├── .streamlit/
│   └── requirements.txt
├── data/                 # Datos preparados y agregados
├── notebooks/            # Análisis y preparación en Python
├── scripts/              # Consultas y scripts SQL
├── tableau/              # Dashboards de Tableau
└── README.md
```

## 10. Fuente de datos

[H&M Personalized Fashion Recommendations — Kaggle](https://www.kaggle.com/competitions/h-and-m-personalized-fashion-recommendations)

---

**Beatriz Fernández**  
Proyecto final de Data Analytics — Ironhack