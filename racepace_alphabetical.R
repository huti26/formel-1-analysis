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
  geom_hline(yintercept = 0, linetype = "dashed", color = "#999999") +
    geom_bar(
    aes(y = delta.seconds, x = race_name, fill = ham.faster),
    size = 0.7, alpha = 1, color = "black", width = 0.25,
    stat = "identity"
  ) +
  facet_grid(rows = vars(year)) +
  labs(
    title = "Hamilton vs Bottas - Mean Racepace Delta per Track",
    subtitle = "Positive Delta (yellow) means Hamilton was faster",
    y = "Delta in Seconds",
    x = ""
  ) +
  scale_fill_manual(values = cbp1) +
  scale_x_discrete(guide = guide_axis(angle = 90)) +
  scale_y_continuous(limits = c(-1.5, 1.5)) +
  guides(
    fill = "none"
  )  +
  theme(
    text = element_text(size = 14),
    plot.margin = margin(t = 1, r = 2, b = 0.5, l = 1, unit = "cm"),
    axis.text.x = element_text(size = 10)
  )


print(g)

ggsave("plots/racepace-mean-ham-bot-delta-per-track-alphabetical.png", width = 9.37, height = 8.0, dpi = 300)

# finalise_plot(plot_name = g,
#               source = "Source: Gapminder",
#               save_filepath = "filename_that_my_plot_should_be_saved_to.png",
#               width_pixels = 640,
#               height_pixels = 450,
#               logo_image_path = "hutan-logo.png")

