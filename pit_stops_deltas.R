library(ggplot2)
library(dplyr)

options(scipen = 100000)

# Color Pallete
# cbp1 <- c("#999999", "#E69F00", "#56B4E9", "#009E73",
#           "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
cbp1 <- c("#009E73", "#F0E442", "#0072B2", "#D55E00")

df <- read.csv("hamilton-vs-bottas/pit_stops_deltas.csv")

df$stop.char <- as.character(df$stop)
df$delta.secs <- df$delta / 1000
df$ham.faster <- df$delta > 0

g <- ggplot(df) +
  geom_hline(aes(yintercept = 0), linetype = "dashed", color = "#999999") +
  geom_bar(
    aes(y = delta.secs, x = round, fill = ham.faster),
    stat = "identity", position = "dodge"
  ) +
  facet_grid(rows = vars(year)) +
  labs(
    title = "Pitstop Delta between Championship Contenders",
    subtitle = "Positive Delta (yellow) means Hamilton's Pitstop was faster",
    y = "Delta in Seconds",
    x = "Race",
    fill = ""
  ) +
  scale_fill_manual(values = c("#999999", "#F0E442")) +
  scale_x_continuous(breaks = seq(1, 22, 1)) +
  guides(
    fill = "none"
  )


print(g)

# ggsave("plots/pit-stop-deltas-with-outliers.png", width = 8.37, height = 10.0, dpi = 300)

# Remove big outliers from 2021
df <- subset(df, df$delta.secs < 4 & df$delta.secs > -4)

g <- ggplot(df) +
  geom_hline(aes(yintercept = 0), linetype = "dashed", color = "#999999") +
  geom_bar(
    aes(y = delta.secs, x = round, fill = ham.faster),
    size = 0.7, alpha = 1, color = "black",
    stat = "identity", position = "dodge2"
  ) +
  facet_grid(rows = vars(year)) +
  labs(
    title = "Pitstop Delta between Championship Contenders - Deltas larger than 4 seconds excluded",
    subtitle = "Positive Delta (yellow) means Hamilton's Pitstop was faster",
    y = "Delta in Seconds",
    x = "Race",
    fill = ""
  ) +
  scale_fill_manual(values = c("#999999", "#F0E442")) +
  scale_x_continuous(breaks = seq(1, 22, 1)) +
  scale_y_continuous(breaks = seq(-2, 2, 2), limits = c(-4, 4)) +
  guides(
    fill = "none"
  ) 


print(g)

ggsave("plots/pit-stop-deltas.png", width = 8.37, height = 10.0, dpi = 300)
