library(ggplot2)
library(dplyr)

options(scipen = 100000)

# Color Pallete
# cbp1 <- c("#999999", "#E69F00", "#56B4E9", "#009E73",
#           "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
cbp1 <- c("#009E73", "#F0E442", "#0072B2", "#D55E00")

df <- read.csv("data/pit_stops.csv")


g <- ggplot(df) +
  geom_point(
    aes(y = milliseconds, x = name, fill = code),
    size = 3, alpha = 1, pch = 21, color = "black"
  ) +
  facet_grid(rows = vars(year)) +
  labs(
    title = "Pit Stops",
    y = "Duration in Milliseconds",
    x = "Race",
    fill = ""
  ) +
  scale_fill_manual(values = cbp1) +
  scale_x_discrete(guide = guide_axis(angle = 90))


print(g)

# ggsave("plots/ham-bot-positions.png", width = 8.37, height = 14.0, dpi = 300)
