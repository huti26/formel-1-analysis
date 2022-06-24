library(ggplot2)

options(scipen = 100000)

# Color Pallete
# cbp1 <- c("#999999", "#E69F00", "#56B4E9", "#009E73",
#           "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
cbp1 <- c("#009E73", "#F0E442")


df <- read.csv("hamilton-vs-bottas/racepace-means-wide-with-deltas.csv")

df$delta.seconds <- df$delta / 1000
df$ham.faster <- df$delta > 0

g <- ggplot(df) +
  geom_line(aes(y = delta.seconds, x = races_round, group = 1), size = 0.8) +
  geom_point(
    aes(y = delta.seconds, x = races_round, fill = ham.faster),
    size = 3, alpha = 1, pch = 21, color = "black"
  ) +
  facet_grid(rows = vars(races_year)) +
  labs(
    title = "Hamilton vs Bottas - Mean Racepace Delta per Track",
    subtitle = "Positive Delta (yellow) means Hamilton was faster",
    y = "Delta in Seconds",
    x = "Race"
  ) +
  scale_fill_manual(values = cbp1) +
  scale_x_continuous(breaks = seq(1, 21, 2)) +
  guides(
    fill = FALSE
  )


print(g)

# ggsave("plots/racepace-mean-ham-bot-delta-per-track.png", width = 8.37, height = 10.0, dpi = 300)


# Without DNFs
df2 <- read.csv("hamilton-vs-bottas/racepace-means-wide-with-deltas-without-dnfs.csv")
df2$delta.seconds <- df2$delta / 1000
df2$ham.faster <- df2$delta > 0

g2 <- ggplot(df2) +
  geom_line(aes(y = delta.seconds, x = round, group = 1), size = 0.8) +
  geom_point(
    aes(y = delta.seconds, x = round, fill = ham.faster),
    size = 3, alpha = 1, pch = 21, color = "black"
  ) +
  facet_grid(rows = vars(year)) +
  labs(
    title = "Hamilton vs Bottas - Mean Racepace Delta per Track - DNFs Removed",
    subtitle = "Positive Delta (yellow) means Hamilton was faster",
    y = "Delta in Seconds",
    x = "Race"
  ) +
  scale_fill_manual(values = cbp1) +
  scale_x_continuous(breaks = seq(1, 21, 2)) +
  guides(
    fill = FALSE
  )

print(g2)

# ggsave("plots/racepace-mean-ham-bot-delta-per-track-without-dnfs.png", width = 8.37, height = 10.0, dpi = 300)

# Remove SPA 2021 (Race 12)
df3 <- read.csv("hamilton-vs-bottas/racepace-means-wide-with-deltas-without-dnfs-without-spa-2021.csv")
df3$delta.seconds <- df3$delta / 1000
df3$ham.faster <- df3$delta > 0

g3 <- ggplot(df3) +
  geom_line(aes(y = delta.seconds, x = round, group = 1), size = 0.8) +
  geom_point(
    aes(y = delta.seconds, x = round, fill = ham.faster),
    size = 3, alpha = 1, pch = 21, color = "black"
  ) +
  facet_grid(rows = vars(year)) +
  labs(
    title = "Hamilton vs Bottas - Mean Racepace Delta per Track - DNFs & Spa 2021 Removed",
    subtitle = "Positive Delta (yellow) means Hamilton was faster",
    y = "Delta in Seconds",
    x = "Race"
  ) +
  scale_fill_manual(values = cbp1) +
  scale_x_continuous(breaks = seq(1, 21, 2)) +
  scale_y_continuous(limits = c(-3, 3)) +
  guides(
    fill = FALSE
  )

print(g3)

ggsave("plots/racepace-mean-ham-bot-delta-per-track-without-dnfs-without-spa-2021.png", width = 8.37, height = 10.0, dpi = 300)

