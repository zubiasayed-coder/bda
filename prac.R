titanic <- read.csv("C:/Users/zubia/Downloads/titanic.csv")

head(titanic)

str(titanic)

sapply(titanic, class)

titanic$Survived <- as.factor(titanic$Survived)
titanic$Sex <- as.factor(titanic$Sex)

summary(titanic)

colSums(is.na(titanic))

dropnull_train <- titanic

dropnull_train$Age[is.na(dropnull_train$Age)] <-
  mean(dropnull_train$Age, na.rm = TRUE)

survivedlist <- dropnull_train[
  dropnull_train$Survived == "1", ]

notsurvivedlist <- dropnull_train[
  dropnull_train$Survived == "0", ]

mytable <- table(titanic$Survived)
print(mytable)

lbls <- paste(names(mytable), "\n", mytable, sep = "")

pie(mytable,
    labels = lbls,
    main = "Passenger Survival")

hist(survivedlist$Age,
     xlab = "Age",
     ylab = "Frequency",
     main = "Age Distribution of Survivors",
     col = "lightblue")

fare <- na.omit(titanic$Fare)
temp <- density(fare)

plot(temp,
     type = "n",
     main = "Fare Distribution",
     xlab = "Fare",
     ylab = "Density")

polygon(temp, col = "lightgray", border = "gray")