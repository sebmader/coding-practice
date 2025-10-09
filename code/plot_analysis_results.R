#######################################
# random plot of clean data w/o stats #
#######################################

library(ggplot2)

plot <- ggplot(
  data = dataframe_name_in_stats_script,
  aes(
    x = species,
    y = fl_bm_ratio,
    color = sex
  )) +
  geom_boxplot() +
  stat_summary(
    fun.data = mean_se,
    geom = "errorbar",
    colour = "darkgrey",
    width = 0.1,
    linewidth = 0.8
  ) +
  stat_summary(
    fun = mean,
    geom = "point",
    shape = 23,
    fill = "red",
    colour = "darkgrey",
    size = 2
  ) +
  labs(
    title = "Flipper length-bodymass ratio of different species",
    x = "Species",
    y = "Flipper-body mass ratio [mm/kg]"
  ) +
  theme_bw()

print(plot)