library(ggplot2)
library(ggthemes)
library(ggrepel)
library(showtext)
library(curl)

data <- read.csv("C:\\Users\\micha\\Desktop\\Visualizations for School\\Data\\monthly_in_situ_co2_mlo.csv")

data$day <- '15'

data$fulldate <- as.Date(with(data, paste(Yr, Mn, day, sep = "-")), "%Y-%m-%d")

font_add_google("Roboto Condensed")
showtext_auto()

graph <- ggplot(data, aes(x = fulldate, y = CO2.filled)) +
  geom_line(size = 1.25, color = "#A9D6E5") +
  labs(title = "Carbon Dioxide Concentration Since 1958",
       y = "Carbon Dioxide Concentration (parts per million)",
       x = "Date",
       caption = "Graph created for GEOG 30N Assignment 2, Spring 2022") +
  scale_y_continuous(limits = c(300,420)) +
  scale_x_date(date_labels = "%b %Y") +
  theme_minimal() +
  theme(
    plot.background = element_rect(fill = "#012A4A"),
    panel.grid = element_line(color = "#A9D6E5"),
    panel.grid.minor = element_blank(),
    plot.title = element_text(family = "Roboto Condensed", color = "#FFFFFF", size = 30,
                              margin = margin(t = 15, r = 0, b = 15, l = 0), hjust = -0.55),
    axis.title.y = element_text(family = "Roboto Condensed", color = "#FFFFFF", size = 15, 
                              margin = margin(t = 0, r = 15, b = 0, l = 10)),
    axis.title.x = element_text(family = "Roboto Condensed", color = "#FFFFFF", size = 15, 
                                margin = margin(t = 5, r = 0, b = 0, l = 0)),
    axis.text = element_text(family = "Roboto Condensed", color = "#A9D6E5"),
    plot.caption = element_text(family = "Roboto Condensed", color = "#FFFFFF")
  )

graph

### Colors palette used (in order of darkest to lightest):
### 012A4A
### 013A63
### 01497C
### 014F86
### 2A6F97
### 2C7DA0
### 468FAF
### 61A5C2
### 89C2D9
### A9D6E5
### FFFFFF

