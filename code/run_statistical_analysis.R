###########################
# stand-in code for stats #
###########################


print(paste(
  "[INFO]: Using dataset", quote(dataframe_name_in_stats_script),
  "to calculate some statistics."
))

cat('\n')

print("Dataset looks like this:")

str(dataframe_name_in_stats_script)

cat('\n')

print("[INFO]: Running some models.")

model <- lm(fl_bm_ratio ~ species * sex, data = dataframe_name_in_stats_script)
print(summary(model))
print(anova(model))
