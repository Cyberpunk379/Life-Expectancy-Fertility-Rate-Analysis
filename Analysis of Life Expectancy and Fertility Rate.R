#import and read file
setwd("/Users/badboihy/project/Analysis of Life Expectancy and Fertility Rate")
foo <-read.csv("Datset_IA.csv")
head(foo,20)
str(foo)

#Changing integer into factor
factor(foo$Year)
foo$Year <- factor(foo$Year)

str(foo)

#exploring data set
nrow(foo)
ncol(foo)
head(foo,10)
tail(foo)
str(foo)
summary(foo)

# Creating Data Frame
foo_df <- data.frame(Country_Code, Life_Expectancy_At_Birth_1960, Life_Expectancy_At_Birth_2020)
head(foo_df)

#Renaming the columns in data frames
colnames(foo_df)<-c("Code", "Life_Expectancy_1960", "Life_Expectancy_2020")
head(foo_df)
summary(foo_df)
str(foo_df)

# Merging data frames
head(foo)
head(foo_df)
foo_merged <- merge(foo, foo_df, by.x="Country.Code", by.y="Code")
head(foo_merged)
tail(foo_merged)
str(foo_merged)

#Locate missing data
complete.cases(foo_merged)
!complete.cases(foo_merged)
foo_merged[!complete.cases(foo_merged),]

# Analyzing NA Value
is.na(foo_merged$Country.Code)
foo_merged[is.na(foo_merged$Country.Code),]

is.na(foo_merged$Country.Name)
foo_merged[is.na(foo_merged$Country.Name),]

is.na(foo_merged$Region)
foo_merged[is.na(foo_merged$Region),]

is.na(foo_merged$Year)
foo_merged[is.na(foo_merged$Year),]

is.na(foo_merged$Fertility.Rate)
foo_merged[is.na(foo_merged$Fertility.Rate),]

is.na(foo_merged$Life_Expectancy_1960)
foo_merged[is.na(foo_merged$Life_Expectancy_1960),]

is.na(foo_merged$Life_Expectancy_2020)
foo_merged[is.na(foo_merged$Life_Expectancy_2020),]

library(ggplot2)
head(foo_merged)
str(foo_merged)

# Creating scatterplots
# Scatterplot for 1960
ggplot(subset(foo_merged, Year == "1960"), 
       aes(x = Fertility.Rate, y = Life_Expectancy_1960, color = Region)) +
  geom_point() +
  labs(title = "Life Expectancy vs Fertility Rate by Region (1960)",
       x = "Fertility Rate",
       y = "Life Expectancy") +
  theme_minimal() +
  theme(legend.position = "right")

# Scatterplot for 2020
ggplot(subset(foo_merged, Year == "2020"), 
       aes(x = Fertility.Rate, y = Life_Expectancy_2020, color = Region)) +
  geom_point() +
  labs(title = "Life Expectancy vs Fertility Rate by Region (2020)",
       x = "Fertility Rate",
       y = "Life Expectancy") +
  theme_minimal() +
  theme(legend.position = "right")


