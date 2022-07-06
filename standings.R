library(ggplot2)
library(dplyr)

options(scipen = 100000)

# Color Pallete
# cbp1 <- c("#999999", "#E69F00", "#56B4E9", "#009E73",
#           "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
cbp1 <- c("#009E73", "#F0E442")

# df <- read.csv("hamilton-vs-bottas/standings-wide.csv")
df <- read.csv("data/standings_ham_vs_bot.csv")

# Add vline column with wdc decision race number
df <- mutate(df,
             wdc.decided.race = case_when(
               year == 2017 ~ 18,
               year == 2018 ~ 19,
               year == 2019 ~ 19,
               year == 2020 ~ 14,
               year == 2021 ~ 22,
             )
)


g <- ggplot(df) +
  geom_vline(aes(xintercept = wdc.decided.race), linetype = "dashed", color = "#999999") +
  geom_line(aes(y = points, x = round, group = code), size = 0.8) +
  geom_point(
    aes(y = points, x = round, fill = code),
    size = 3, alpha = 1, pch = 21, color = "black"
  ) +
  facet_grid(rows = vars(year)) +
  labs(
    title = "Hamilton vs Bottas - Points Development over each season",
    y = "Points",
    x = "Race",
    fill = ""
  ) +
  scale_fill_manual(values = cbp1) +
  scale_x_continuous(breaks = seq(1, 21, 2))


print(g)

ggsave("plots/ham-bot-standings.png", width = 8.37, height = 10.0, dpi = 300)
