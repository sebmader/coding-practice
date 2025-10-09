#####################################
# stand-in code for data processing #
#####################################

process_data_function <- function(raw_data) {
  print("[INFO]: Processing the raw data in case you have not saved the clean data yet.")

  data <- na.omit(raw_data)
  
  # calculate flipper-body mass ratio as a proxy for swim speed
  data_processed <- data |>
    dplyr::mutate(fl_bm_ratio = flipper_length_mm / (body_mass_g / 1000))
  
  Sys.sleep(1)
  
  cat('\n')
  print("[INFO]: Done processing the data!")
  cat('\n')
  
  if (!file.exists(here::here("data/palmerpenguins_clean.csv"))) {
    write.csv(data_processed, here::here("data/palmerpenguins_clean.csv"))
    print("[INFO]: Processed data was saved as it didn't exist yet.")
  }
  
  return(data_processed)
}