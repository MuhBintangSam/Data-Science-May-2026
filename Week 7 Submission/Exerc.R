#Task One
Name       <- c("Aisha", "Bryan", "Chloe", "Daniel", "Emily")
Gender     <- c("Female", "Male", "Female", "Male", "Female")
Age        <- c(22, 23, 21, 24, 22)
Test_Score <- c(85, 78, 92, 65, 88)
Attendance <- c(90, 85, 95, 70, 88)
students <- data.frame(Name, Gender, Age, Test_Score, Attendance)
View(students)

#Task Two
students["Test_Score"]
students$Test_Score  
# first 3 rows
students[1:3,]
# Older than 22
students[students$Age>22,]
#Female students with Test_Scord >80
students[students$Gender == "Female" & students$Test_Score > 80,]

#Task Three
new_student <- data.frame(
  Name = "Lina", Gender = "Male", Age = 20,
  Test_Score = 95, Attendance = 92
)

students <- rbind(students, new_student)
students

#Task Four
students_na <- data.frame(
  Name       = c("Aisha", "Bryan", "Chloe", "Daniel", "Emily"),
  Gender     = c("Female", "Male", "Female", "Male", "Female"),
  Age        = c(22, NA, 21, 24, 22),
  Test_Score = c(85, 78, NA, 65, 88),
  Attendance = c(90, 85, 95, NA, 88)
)

# Checking missing value
is.na(students_na)
colSums(is.na(students_na))

# Replace N/A in Age with the mean age
students_na$Age[is.na(students_na$Age)] <- mean(students_na$Age, na.rm = TRUE)

# Replace N/A in Test_Score with the median
students_na$Test_Score[is.na(students_na$Test_Score)] <- median(students_na$Test_Score, na.rm = TRUE)

# Replace N/A in Attendance with 0 
students_na$Attendance[is.na(students_na$Attendance)] <- 0

students_na




