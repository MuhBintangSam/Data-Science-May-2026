#Week 8
library(dplyr)
library(readr)
student_data<- read.csv("C:/UTP/yr 2 sem 2/datascience/week 8/student_data.csv")
View(student_data)

#student_fail
student_fail<- student_fail<- student_data[student_data$final_exam_mark< 40,]
View(student_fail)

#Ascending & Descending the Order
mydata1<- student_data %>% filter(final_exam_mark< 40) %>% arrange(desc(final_exam_mark))
View(mydata1)

mydata2<- student_data %>% filter(final_exam_mark< 40) %>% arrange(final_exam_mark)
View(mydata2)

#Which Column wants to be shown
mydata2 <- student_data%>% select(student_id,coursework_mark,final_exam_mark)
View(mydata2)
#glimpse
glimpse(student_data)

#Mutate
mydata4 = student_data%>% mutate(Total_Mark=(coursework_mark+ final_exam_mark/200*100))
View(mydata4)

#Descriptive Statistics
data(iris)
head(iris,10)
tail(iris,20)
str(iris)

#How to find min & max
min(iris$Sepal.Length) #this produces 4.3
max(iris$Sepal.Length) #this produces 7.9

range(iris$Sepal.Length)
sd(iris$Sepal.Length)
summary(iris)

#Quantile
A<-c(170.2, 181.5, 188.9, 163.9, 166.4, 163.7, 160.4, 175.8, 181.5)
quantile(A)

#Counting Column & Row
nrow(iris)
ncol(iris)

#Graphs
hist(iris$Sepal.Length,
     main = "Histogram of Sepal Length",
     xlab = "Sepal Length (cm)",
     ylab = "Frequency",
     col = "lightblue",
     border = "black")


boxplot(Sepal.Length ~ Species,
        data = iris,
        main = "Sepal Length by Species",
        xlab = "Species",
        ylab = "Sepal Length (cm)",
        col = c("lightgreen", "lightpink","lightyellow"))

plot(iris$Sepal.Length, iris$Petal.Length,
     main = "Sepal Length vs Petal Length",
     xlab = "Sepal Length (cm)",
     ylab = "Petal Length (cm)",
     col = as.numeric(iris$Species),
     pch = 19)

legend("topleft",
       legend = levels(iris$Species),
       col = 1:3,
       pch = 19)

data<-c(30,24,26,28,29,28,27,26,32,34,13,15,14,31,29,28,24,25,30,34,35,27,30,34,44,48)
boxplot(data, main = "Boxplot")
first_q<-quantile(data,0.25)
third_q<-quantile(data,0.75)
inter_q<-quantile(data,0.50)

#Quartile
iqr<-IQR(data)
#Lower Extreme
lower_extreme<-first_q - 1.5 * iqr
upper_extreme<-third_q + 1.5 * iqr

#How to deal with outliers
#Remove the outlies
data_new<- data
data_new<- data_new[!data_new<lower_extreme]
data_new<- data_new[!data_new>upper_extreme]
data_new

#Replace the outlier
data_new<- data
avg <- round(mean(data_new))#for the purpose of example we round up value
data_new[data_new<lower_extreme] <- avg
data_new[data_new>upper_extreme] <- avg
data_new
 
#Replace with Upper and Lower Value
data_new<- data
data_new[data_new<le] <- lower_extreme
data_new[data_new>ue] <- upper_extreme
data_new