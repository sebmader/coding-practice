##############################
# the script to get the data #
##############################
# because, you should not (and often cannot) transfer data over git

library(palmerpenguins)

if (!dir.exists(here::here("data"))) {
  dir.create(here::here("data"))
  dir.create(here::here("data/results"))
}

if (!file.exists("data/palmerpenguins_raw.csv")) {
  write.csv(palmerpenguins::penguins, "data/palmerpenguins_raw.csv")
}
