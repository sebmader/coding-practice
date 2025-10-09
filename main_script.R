####################################################
# the main script that calls the full (?) pipeline #
####################################################

# In theory, each coding project should be coherent and aim to serve one
# purpose. Meaning, don't add additional functionality that we don't need to
# serve that purpose. This leads to the final outcome of a project, where you
# should be able to call *one* script, that calls all the necessary steps to
# execute the complete pipeline of your project. The result of that pipeline
# being everything that goes into the paper (right?).

# The core idea here comes from application development, where each app has a
# main 'executable', that calls all other functionality of the programme. We
# mostly know this from apps that we open - by running the executable (app.exe
# file) - and call the different functionalities when interacting with the app.
# But you also have apps, that just run from start to finish, after you run the
# executable; see for example command-line apps.

# Obviously, for scientific usage and data analysis, we have scripts to explore
# the data, check statistical assumptions and try out other models that are not
# necessarily part of the main pipeline. That is of course fair to include in
# the project; in the end it might be part of the supplementary data. This would
# not be part of the main pipeline though. I think, we can say that the main
# script should call all the code to create the results of the main body of the
# manuscript from the data (preferably from the raw data).

# placeholder code:

get_data <- FALSE
use_raw_data <- TRUE


# do you have the data yet? #
if(get_data) {
  print(paste(
    "[INFO]: Downloading the data to a designated place in the",
    "project, where the rest of the code looks for it."
  ))
  source(here::here("code/get_data.R"))
}


# import data:
clean_data <- data.frame()

if (use_raw_data) {
  stopifnot(
    "The raw data cannot be found! Make sure you run the 'get_data.R' script." =
      file.exists(
        here::here("data/palmerpenguins_raw.csv")
      )
  )
  
  raw_data <- read.csv(here::here("data/palmerpenguins_raw.csv"))

  source(here::here("code/functions/process_data_function.R"))

  clean_data <- process_data_function(raw_data)
} else {
  stopifnot(
    "The clean data cannot be found! Make sure you run the 'get_data.R' script
    and process the raw data" =
      file.exists(
        here::here("data/palmerpenguins_clean.csv")
      )
  )
  
  clean_data <- read.csv(here::here("data/palmerpenguins_clean.csv"))
}

# run statistical analysis
dataframe_name_in_stats_script <- clean_data # would be one possibility to hand
  # data from one script to another

source(here::here("code/run_statistical_analysis.R")) # this script also writes
  # the output into files

# plot results
source(here::here("code/plot_analysis_results.R")) # this script loads the 
  # results of the stats script from files (another possibility)

# run simulations
source(here::here("code/functions/simulation_function.R"))

simulation_results <- simulation_function(
  clean_data,
  "data/path_to_analysis_results"
)

simulation_results_path <- "data/results/random_simulation_results.csv"
write.csv(simulation_results,
  file = simulation_results_path
)

print(paste(
  "[INFO]: Simulation results can be found at",
  simulation_results_path
))
cat('\n')

print("The main script completed successfully! Congrats! :)")
