
####################################  R- PROGRAMMING  ##########################################

############################# Project on " Credit Card" ####################################

# Group Members - 
## 1)Pooja Popat Mane
## 2)Mrunal Shashikant Patil
## 3)Baliram
## 4)Akshay


#_______________________________________________________________________________
#_______________________________________________________________________________


#>  R is general purpose , multiplatform , object oriented interpreted language is used for
#  computational statistics , analysis and hard work analysis

#> R provides variety of statistical and graphical techniques and is highly extensible

#> R is available as free software

#> R is easy and friendly to new programmers
#> 
#> ## Features of R :-

# 1) comprenhsive language
# 2) Provide the user a large array of packages
# 3) Posses a number of graphical libraries
# 4) Open source
# 5) Cross platform compatibility
# 6) Facilities of various industries
# 7) No need for a compiler
# 8) Perform fast calculations
# 9) R is also used in machine learning



# Install library to read file
library(readxl)

##  First We have to  LOAD & READ  the file.
## For that we have 2 Techniques

# Install library to read file
library(selectr)
library(rvest)

##  First We have to  LOAD & READ  the file.
## For that we have 2 Techniques
# 1) Technique - Applying by file path :-
Credit_Card<- read.csv("Group 2 - Credit card.csv")
class(Credit_Card)


# 2) Technique - Applying by file.choose() function (This function will choose file from out storage without giving path)
Credit_Card =read.csv(file.choose())
Credit_Card


## To get Details & lebels of each column we can use str()  
str(Credit_Card)


## To get count of Columns And Rows
dim(Credit_Card)

nrow(Credit_Card)                                   # This will show only Rows
ncol(Credit_Card)                                   # This will show only Columns


## To get Mathematical information such as Mean , Mode , Median..etc.
summary(Credit_Card)

## columns for factor and convert it
creditcard$Income_Category <-as.factor(creditcard$Income_Category)
creditcard$Income_Category

## do operation by using dplyr
## q1. sort using Customer_Age and Credit_limit
library(dplyr)
creditcard1 <- arrange(creditcard,Customer_Age,Credit_Limit)
creditcard1

## q2. sort using CLIENTNUM and Avg_Utilization_Ratio descending
creditcard3 <- arrange(creditcard,CLIENTNUM,desc(Avg_Utilization_Ratio))
creditcard3

select<-dplyr::select
## select command is used to select required columns in dataframe
select(creditcard,1:5)      ## select column 1,2,3,4,5 i.e CLIENTNUM Customer_Age Income_Category Credit_Limit Total_Revolving_Bal
select(creditcard,c(1,5))   ## select column 1 and 5 i.e.CLIENTNUM Total_Revolving_Bal

## filter function is used to filter data
filter(creditcard,Customer_Age==40)
filter(creditcard,Customer_Age<=40)
filter(creditcard,Customer_Age<=40 & Total_Revolving_Bal>=2000)

## rename is used to rename the column name
## we are changing column name Customer_Age to Age
creditcard4 <- rename(creditcard,"Age"=Customer_Age)
creditcard4

## use mutate command to add new column
## add new column to show cutting of 50 from Total_Revolving_Bal 
creditcard5<-mutate(creditcard,after_cutting_bal=Total_Revolving_Bal-50)
str(creditcard5)

## multiple command packaging  %>% pipe operation
## we are calculating mean of total revolving bal and total transction amount having customer age is greater than 60
creditcard %>%
  select(1:6) %>%
  filter(Customer_Age>60) %>%
  arrange(Customer_Age,desc(Total_Revolving_Bal)) %>%
  summarise(mean(Total_Revolving_Bal),mean(Total_Trans_Amt))

############### graphs using base graphics #######################

## bar chart of Customer age

max(creditcard$Customer_Age)
barplot(creditcard$Customer_Age,main="Barchart of Customer Age",ylab="Customer age",col="green",ylim = c(0,70))

## Box plot of Customer age and Income_Category
boxplot(creditcard$Customer_Age ~ creditcard$Income_Category,main = "boxplot of customer age and income category",col=c("blue","red","green"),horizontal = FALSE)

################## graphs using ggplot ######################

## scatter plot of total resolving balace with age according to total transction amount

library(ggplot2)
agebalance<-ggplot(creditcard,aes(Customer_Age,Total_Revolving_Bal))+geom_point(aes(color=Total_Trans_Amt,size=0.3))+labs(x="Age",y="balance")
print(agebalance)


