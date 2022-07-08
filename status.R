library(ggplot2)

options(scipen = 100000)

# Color Pallete
# cbp1 <- c("#999999", "#E69F00", "#56B4E9", "#009E73",
#           "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
cbp1 <- c("#009E73", "#F0E442")

df <- read.csv("hamilton-vs-bottas/status-with-bool-column.csv")

g <- ggplot(df) +
  geom_point(
    aes(y = dnf, x = round, fill = code),
    size = 3, alpha = 1, pch = 21, color = "black",
    position = position_dodge(1)
  ) +
  facet_grid(rows = vars(year)) +
  labs(
    title = "Hamilton vs Bottas - DNFs over each season",
    y = "",
    x = "Race",
    fill = "DNF"
  ) +
  scale_fill_manual(values = cbp1) +
  scale_x_continuous(breaks = seq(1, 21, 2)) +
  scale_y_discrete(limits = "True", labels = "") +
  theme(axis.ticks.y = element_blank())


print(g)

ggsave("plots/ham-bot-dnfs.png", width = 8.37, height = 4.0, dpi = 300)
