#####################
# some example code #
#####################
# written by HAWKI2(OpenAI GPT 4o) and Sebastian Mader, 07.10.25

# config
run_more_models <-  FALSE

library(ggplot2)
library(palmerpenguins)
# library(tidyverse) # DON'T LOAD THESE HUUGE PACKAGES FOR JUST ONE FUNCTION!

View(palmerpenguins::penguins)

# NAs mess up the plotting an statistical analysis: remove them
penguins_clean <- na.omit(palmerpenguins::penguins)

# calculate flipper-body mass ratio as a proxy for swim speed
penguins_clean <- penguins_clean %>%
  dplyr::mutate(fl_bm_ratio = flipper_length_mm / (body_mass_g / 1000))

View(penguins_clean)

# we are not interested in the bird's bill metrics right now: omit 
penguins_subset <- penguins_clean %>%
  dplyr::select(!(bill_length_mm:bill_depth_mm))

View(penguins_subset)

# have a look at the distribution of flipper-body mass ratios of different
# species and sexes
ggplot(
  data = penguins_subset,
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
    size = 0.8
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


# check if the differences are statistically significant
model <- lm(fl_bm_ratio ~ species * sex, data = penguins_subset)
anova(model)

# See how the model predictions compare to the actual data
penguins_subset$predicted_fl_bm_ratio <- predict(model)

ggplot(data = penguins_subset, aes(x = species, y = fl_bm_ratio, color = sex)) +
  geom_boxplot() +
  geom_point(aes(y = predicted_fl_bm_ratio),
    shape = 23, fill = "red", size = 2
  ) +
  labs(
    title = "Predicted flipper length-bodymass ratios",
    x = "Species",
    y = "Flipper-body mass ratio [mm/kg]"
  ) +
  theme_bw()

if (run_more_models) {
  # More models:
  model1 <- lm(fl.bm_ratio ~ species, data = df.2)
  anova(model1)
  model1.1 <- glm(fl.bm_ratio ~ species * sex, data = df.2)
  anova(model1.1)
  model1.2 <- lm(fl.bm_ratio ~ species * sex + island, data = df.2)
  anova(model1.2)
}

# Take-aways:
# - DO NOT rm(list = ls()) !!!
#   --> it does not clean the environment sufficiently
# - DO NOT hardcode paths !!!
#   --> nobody else will be able to run your code without changing it (and
#       setwd() at the beginning of the script is a relatively easy fix...)
#   Use 'here'-package instead
# - Don't load unnecessarily large libraries if you only want to use a few 
#   functions; use explicit function calls instead: package::function()
# - Comments should add information, not only describe what the code tells us
#   anyways. Say, why you do something, not what (only if code is difficult to
#   understand)
# - Use meaningful variable (and function) names: then, the code is easier to
#   understand and you don't have to comment as much
# - Stay within the margin: 80-100 characters a line. Otherwise it will be hard
#   to read on smaller screens. 
#   Trick for comments: Ctrl + Shift + # (or / depending on keyboard layout)
# - Watch indentation and spacing of lines. It makes it so much easier to
#   read, when you know can easily see the context of each line of code as a
#   paragraph.
# - Use a coherent style for variables (and function, file, folder names):
#   R-standard is snake_case (but there are others, like, kebab-case, camelCase)
# - Instead of commenting out code, make it conditional and add a config at the
#   top of the script to decide the path it should take 
