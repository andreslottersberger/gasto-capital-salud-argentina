datos <- read.csv(file.choose())
library(dplyr)
library(tidyr)
library(ggplot2)
datos_long <- datos %>%
  pivot_longer(
    cols = c(valor_2019, valor_2021),
    names_to = "anio",
    values_to = "valor"
  ) %>%
  mutate(
    anio = ifelse(anio == "valor_2019", "2019", "2021")
  )
ggplot(datos_long, aes(x = factor(anio), y = valor, fill = anio)) +
  geom_col(width = 0.6) +
  geom_text(
    aes(label = paste0(sprintf("%.2f", valor), " %")),
    vjust = -0.4,
    size = 4
  ) +
  scale_fill_manual(
    values = c(
      "2019" = "#F03B20",  # azul
      "2021" = "#2C7FB8"   # rojo/naranja (contraste claro)
    )
  ) +
  scale_y_continuous(
    labels = function(x) paste0(x, " %"),
    expand = expansion(mult = c(0, 0.12))
  ) +
  labs(
    title = "Gasto de capital en salud (% del PBI)",
    subtitle = "Participación de la inversión en salud dentro de la economía argentina en el año 2019 y 2021",
    x = "Año",
    y = "Porcentaje del PBI (%)",
    fill = "Año"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(size = 11),
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black"),
    panel.grid.minor = element_blank()
  )
