#####################
# some example code #
#####################
# written by HAWKI2(OpenAI GPT 4o) and Sebastian Mader, 07.10.25
# clean environment
rm(list=ls())
# set working directory to my folder
setwd("C:/Users/ea10akaz/Documents/Courses/Teaching/CodingPractice/CodingPractice")
# Load necessary libraries
library(ggplot2)
  library(palmerpenguins)
library(tidyverse)
# Have a look at dataset
View(palmerpenguins::penguins)
# Load and clean the data: remove rows with NA values         
df<-na.omit(palmerpenguins::penguins)
    # calculate flipper-body mass ratio as a proxy for swim speed
    df<-df%>%mutate(fl.bm_ratio=flipper_length_mm/(body_mass_g/1000))
View(df)
# Restructure the dataset: select relevant columns
df.2<-df %>% select(!(bill_length_mm:bill_depth_mm))
View(df.2)
# First plot: Scatterplot with ggplot2
ggplot(data= df.2, aes(x=species,y=fl.bm_ratio,color= sex)) +
geom_boxplot() +
stat_summary(fun.data =mean_se,geom="errorbar",colour= "darkgrey", width=0.1,size=0.8)+
stat_summary(fun=mean,geom ="point",shape=23,fill ="red",colour="darkgrey", size =2) +
labs(title="Flipper length-bodymass ratio of different species",x="Species",y="Flipper-body mass ratio [mm/kg]")+
  theme_bw()
# Simple statistical analysis: Linear model
model<-lm(fl.bm_ratio~species *sex,data=df.2)
  anova(model)
# Add model predictions to the original data
df.2$predicted_fl.bm_ratio<-predict(model,newdata=df.2)
# Second plot: Adding prediction
ggplot(data= df.2,aes(x=species,y=fl.bm_ratio,color = sex)) +
  geom_boxplot() +
labs(title="Flipper length-bodymass ratio of different species",x="Species",y="Flipper-body mass ratio [mm/kg]")+
  geom_point(aes(y =predicted_fl.bm_ratio),shape = 23, fill = "red", size =2) +
labs(title="Predicted flipper length-bodymass ratios",x="Species",y="Flipper-body mass ratio [mm/kg]") +
  theme_bw()


# # More models:
# model1 <- lm(fl.bm_ratio~species,data =df.2)
# anova(model1)
# model1.1 <- glm(fl.bm_ratio~species*sex,data =df.2)
# anova(model1.1)
# model1.2 <- lm(fl.bm_ratio~species*sex+island,data =df.2)
# anova(model1.2)
