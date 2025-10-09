#####################################
# stand-in function for simulations #
#####################################

simulation_function <- function(
    clean_data,
    path_to_analysis_results
  ) {
  print(paste(
    "[INFO]: Printing some info on the simulation parameters",
    "(which should also be given to the function...)."
  ))
  
  print("[INFO]: Running simulation")
  
  for(i in 1:5) {
    cat(".")
    Sys.sleep(0.75)
  }
  cat('\n')
  
  print("[INFO]: Simulation finished successfully!")
  cat('\n')
  
  return(clean_data[sample.int(nrow(clean_data), 100), ])
}
