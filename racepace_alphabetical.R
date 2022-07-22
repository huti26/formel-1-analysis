library(ggplot2)
# library(bbplot)

options(scipen = 100000)

# Color Pallete
# cbp1 <- c("#999999", "#E69F00", "#56B4E9", "#009E73",
#           "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
cbp1 <- c("#009E73", "#F0E442")


df <- read.csv("hamilton-vs-bottas/racepace-means-alphabetical-wide-without-spa-with-deltas.csv")

df$delta.seconds <- df$delta / 1000
df$ham.faster <- df$delta > 0

g <- ggplot(df) +
  geom_vline(xintercept = 0, linetype = "dashed", color = "#999999") +
  geom_bar(
    aes(x = delta.seconds, y = race_name, fill = ham.faster),
    size = 0.7, alpha = 1, color = "black", width = 0.25,
    stat = "identity"
  ) +
  facet_grid(cols = vars(year)) +
  labs(
    title = "Hamilton vs Bottas - Mean Racepace Delta per Track",
    subtitle = "Positive Delta (yellow) means Hamilton was faster",
    y = "",
    x = "Delta in Seconds"
  ) +
  scale_fill_manual(values = cbp1) +
  scale_y_discrete(limits = rev) +
  scale_x_continuous(limits = c(-1.5, 1.5)) +
  guides(
    fill = "none"
  )  +
  theme(
    text = element_text(size = 14),
    plot.margin = margin(t = 0.5, r = 1, b = 0.5, l = 0.5, unit = "cm"),
    axis.text = element_text(size = 12)
  )


print(g)

ggsave("plots/racepace-mean-ham-bot-delta-per-track-alphabetical.png", width = 9.37, height = 11.0, dpi = 300)

