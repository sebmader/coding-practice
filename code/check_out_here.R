#############################
# show 'here' functionality #
#############################
# written by Sebastian Mader, 8.10.2025

library(here) # this automatically sets the working directory
# No need anymore for 'setwd' and it doesn't matter where you (or others) have
# stored the project, it will always be the project root.

# give reasoning why the working directory was set on that level
here::dr_here()

print(testthat::expect_error(
  a_function()
))

# instead of writing hard paths, write dynamic ones
source(here::here("code/functions/a_function.R"))
# --> This could also be achieved using "../" to go up a folder level from where
#     we are. The advantage of 'here': it always starts from the project root,
#     so moving this script around will not affect the function calls.

testthat::expect_no_error(
  a_function()
)

# Take-aways:
# - The 'here'-package allows you to write the most robust dynamic paths in your 
#   project:
#   - if you move the project as a whole, they stay valid
#   - if you move the script, that calls, they stay valid
#   - but: if you move the file that you call, you have to change the path, ofc
