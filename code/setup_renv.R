#########################
# set up 'renv' for use #
#########################
# written by Sebastian Mader, 24.07.2025

# The goal of this script is to install 'renv':
# to align our installed packages (and their version)


## align packages --------------------------------------------------------------

# To make that happen, we use the package 'renv' (~ 'r'eproducible
# 'env'ironment). It documents and stores all the packages used within a project
# and their specific versions *inside* each project. Thanks to that, I can be
# sure, that you all have installed all required packages and use the same
# package versions as I am, and that there are no differences in functionality
# that could break the code.

# first, install the package, if you don't have it:
if (!require("renv")) {
  install.packages("renv")
}

# check the status of the project with renv:
renv::status()
# sidenote: why do I use 'renv::' to execute the function? Because I don't want
# to clutter my memory with loading the whole package *and* I want to be sure
# that I use the 'status()'-function of 'renv' and not any other package.
# probably you got something like this (with different details and a lot
# longer):

# The following package(s) are in an inconsistent state:
#
# package  installed recorded used
# lmerTest y         y        n

# check what it means:
?renv::status()
# --> most likely, you have a mismatch of your library with the 'lock.file'
# (where renv documents the packages and versions). Meaning, you don't have the
# packages that the project requires. Let's take care of that:

# initialise renv for your local project:
renv::init()
# You should get a prompt asking you to choose from a list of possible actions.
# Choose the option that says something like 'use existing renv.lock file to set
# up renv for this project directory'. Probably option 1.

# # otherwise:
# renv::activate()
# # and/or:
# renv::restore()


# 'renv' is extremely helpful in collaborations, but also for publishing code:
# both your collaborators and the reviewers or re-users will have it much, much
# easier to manage their versions of your code.
# But also for yourself, if you work on the same code on two different machines,
# or run your code on a server like the high-performance computing clusters.
# Of course, you may run into difficulties, but they are minor compared to the
# headaches of manually aligning libraries almost every time... (IMHO)




# TODO: omit!! well, move to slides:
## coding practice -------------------------------------------------------------

# Who do you write code for?
# A: the computer
# B: yourself
# C: other humans

# Why do you write code?
# A: so the computer calculates stuff
# B: to impress my supervisor with complicated code
# C: for people to understand what I am doing

# What is 'good coding practice'? It's mostly about how to structure your code
# and standardise 'style', so that the code can be easily maintained and other
# people (including your future self) can easily understand what you are doing.


## some tipps and tricks on RStudio --------------------------------------------

### A few tips on coding in R(Studio) ------------------------------------------
# - always make your code an R project (even better, an R package)
# - NEVER (!) do: rm(list = ls())
#   --> restart R session instead
# - NOR: setwd(C:/Users/YOURNAME/dir/project)
#   --> load project and use `here`-package
# - know your keyboard shortcuts:
#   - show keyboard shortcuts = ALT + SHIFT + K
#   - my selection:
#     - assignment operator ( <- ) = ALT + -
#     - reformat code selection = CTRL + SHIFT + A
#     - move (/copy) line up/down = ALT + (SHIFT +) Arrow Up/Down
#     - navigate with: CTRL + Arrows, (CTRL +) Pos1 & End
#     - help: cursor on function call + F1
# - automatic testing: package `assert`, function `assert::assert()`
# - instead of loading big libraries, use explicit calls like
#   package::function()

