library(dplyr)
library(readr)
student_data<- read.csv("C:/UTP/yr 2 sem 2/datascience/Week 8 Exercise/student_data.csv")
View(student_data)

#1) student_pass
student_pass<- student_fail<- student_data[student_data$final_exam_mark> 80,]
View(student_pass)

#2) Ascending order based on course_work_mark
mydata<- student_data %>% filter(final_exam_mark> 80) %>% arrange(coursework_mark)
View(mydata)

#3) Only Student Name & Final Exam Mark
mydata2 <- student_data%>% select(student_name,final_exam_mark)
View(mydata2)

#4) Number of rows and columns
nrow(student_data)
ncol(student_data)

#5) Explain how to obtain details, show dataset details based on R query
str(student_data) #Structure of the dataset
summary(student_data) #Stats Summary
head(student_data) #First 6 Rows of the dataset
tail(student_data) #Last 6 Rows of the dataset
nrow(student_data) #Number of rows in the dataset
ncol(student_data) #Number of columns in the dataset

#Identify & Detect outliers in the dataset, explain and demonstrate using R
boxplot(student_data$final_exam_mark,
        main = "Boxplot of FInal Exam Marks",
        ylab = "Marks",
        col = "lightblue")

Q1 <- quantile(student_data$final_exam_mark, 0.25, na.rm = TRUE)
Q3 <- quantile(student_data$final_exam_mark, 0.75, na.rm = TRUE)
IQR_value <- IQR(student_data$final_exam_mark, na.rm = TRUE)

lower_extreme <- Q1 - 1.5 * IQR_value
upper_extreme <- Q3 + 1.5 * IQR_value
cat("Lower Extreme Boundary: ", lower_extreme)
cat("Upper Extreme Boundary: ", upper_extreme)

outliers <- student_data %>% filter(final_exam_mark < lower_extreme | final_exam_mark > upper_extreme)
cat("Identified Outlier Records: \n")

if(nrow(outliers) >0) {
  print(outliers)
}  else {
    cat("No outliers detected in the final_exam_mark column.\n")
  }
