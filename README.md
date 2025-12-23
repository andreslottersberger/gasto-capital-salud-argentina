📊 Gasto de capital en salud en Argentina (% del PBI)

Este repositorio documenta un **proyecto de análisis de datos** realizado a partir de información del **Banco Mundial**, cuyo objetivo es comparar el **gasto de capital en salud en Argentina**, medido como porcentaje del Producto Bruto Interno (PBI), en los años **2019 y 2021**. Elegimos estos años debido al impacto empírico de la pandemia de COVID-19.

El proyecto busca mostrar un **flujo de trabajo completo**, desde la obtención de datos crudos hasta su limpieza en excel y posterior reordenamiento en una tabla hecha con MySQL, consulta y visualización final, utilizando herramientas ampliamente empleadas en análisis de datos.

## 🎯 Objetivo del proyecto

El objetivo principal es **comparar y visualizar el gasto de capital en salud en Argentina**, expresado como porcentaje del PBI.

De manera complementaria, el proyecto tiene un objetivo metodológico: **documentar un pipeline de análisis de datos**, integrando distintas herramientas y lenguajes (Excel, SQL y R), con fines educativos y demostrativos.

## 📌 Indicador analizado

* **Nombre original de la variable:** Capital health expenditure (% of GDP)
* **Traducción utilizada:** *Gasto de capital en salud (% del PBI)*

Este indicador mide la proporción del producto interno bruto que se destina a **inversión en capital del sistema de salud**.

Al tratarse de un porcentaje del PBI, no sabemos en que divisa el Banco mundial mide el porcentaje de gastos.

## 🗂️ Fuente de datos

Los datos utilizados provienen del **Banco Mundial**, a partir de un archivo original en formato Excel que contiene información sobre gasto en salud para múltiples países y años.

link de acceso: https://datacatalog.worldbank.org/search/dataset/0037652/health-nutrition-and-population-statistics 

## 🛠️ Metodología y proceso de trabajo

El proyecto se desarrolló en varias etapas claramente diferenciadas:

### 1️⃣ Obtención y depuración inicial de datos (Excel)

* Se partió del archivo original descargado del Banco Mundial.
* Se aplicaron filtros para conservar únicamente los datos correspondientes a **Argentina**.
* Se realizó un recorte temporal **2015–2025**.
* Se eliminaron valores nulos, observándose que los datos disponibles llegaban hasta el año **2022**.

Esta etapa permitió obtener un conjunto de datos limpio y enfocado exclusivamente en el caso de estudio.

### 2️⃣ Transformación y consulta de datos (SQL)

* El archivo depurado fue cargado en una base de datos **MySQL**.
* Se utilizó **DBeaver** como entorno de trabajo para la ejecución de consultas SQL.
* Mediante una query específica, se seleccionaron los valores correspondientes a los años **2019 y 2021**, generando una tabla final con los datos de interés.
* El uso de SQL permitió estructurar los datos de forma clara y reproducible.

La Query utilizada fué: 
SELECT
  a.variable,
  a.valor AS valor_2019,
  b.valor AS valor_2021
FROM argentina a
JOIN argentina b
  ON a.variable = b.variable
WHERE a.anio = 2019
  AND b.anio = 2021
  AND a.variable = 'Capital health expenditure (% of GDP)';

### 3️⃣ Análisis y visualización (R)

* La tabla final fue importada en **RStudio**.
* Se utilizaron las siguientes librerías:

  * `dplyr` para manipulación de datos
  * `tidyr` para transformación al formato adecuado
  * `ggplot2` para la visualización
* Se construyó un **gráfico de barras** que compara el gasto de capital en salud (% del PBI) entre los años **2019 y 2021**.

El gráfico final permite una lectura clara y directa de la variación del indicador en el período seleccionado.

## 📈 Resultado

El resultado principal del proyecto es una visualización que muestra la **participación del gasto de capital en salud dentro de la economía argentina**, permitiendo observar diferencias entre 2019 y 2021 y facilitando la interpretación del esfuerzo de inversión en salud en distintos contextos temporales.

📌 Interpretación de los resultados

El gráfico muestra que el gasto de capital en salud como porcentaje del PBI fue más elevado en 2019 que en 2021.
Este resultado puede resultar contraintuitivo, ya que podría suponerse que, en el contexto posterior a la pandemia de COVID-19, la inversión habría aumentado o por lo menos se hubiera mantenido similar a 2019.

Sin embargo, la evidencia observada sugiere lo contrario: la participación del gasto de capital en salud dentro de la economía argentina fue menor en 2021.

## 📁 Estructura del repositorio

```
gasto-capital-salud-argentina/
├─ README.md
├─ data/
│  ├─ raw/        # Datos originales del Banco Mundial
│  ├─ processed/  # Datos depurados
│  └─ final/      # Tabla final utilizada para el análisis
├─ sql/           # Query SQL utilizada
├─ r/             # Script en R para el gráfico
└─ output/        # Gráfico final
```

## 👥 Autoría

Proyecto realizado de manera conjunta junto a **Estanislao Molinas** como ejercicio de análisis de datos y visualización.

## 📎 Notas finales

Este repositorio tiene fines **educativos y demostrativos**.
Los datos utilizados son de acceso público y provienen de fuentes oficiales.

Linkedin: 
- Andrés Lottersberger: www.linkedin.com/in/andreslottersberger
- Estanislao Molinas: www.linkedin.com/in/estanislao-molinas-4057ba1b8


