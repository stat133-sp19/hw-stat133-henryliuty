#title: make-shots-data
#description: this script combines the performance of five players into one bigger file.
#input(s): stephen-curry.csv, andre-iguodala.csv, kevin-durant.csv, klay-thompson.csv, draymond-green.csv
#output(s): shots-data-summary.txt, shots-data.csv

coltypes = c("character", "character", "integer","integer","integer","integer","character","factor","factor","integer","character","integer","integer")

curry <- read.csv(file="../data/stephen-curry.csv", stringsAsFactors = FALSE, header=TRUE, colClasses = coltypes)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE, header=TRUE, colClasses = coltypes)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE, header=TRUE, colClasses = coltypes)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE, header=TRUE, colClasses = coltypes)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE, header=TRUE, colClasses = coltypes)


curry$name = "Stephen Curry"
iguodala$name = "Andre Iguodala"
green$name = "Draymond Green"
durant$name = "Kevin Durant"
thompson$name = "Klay Thompson"


curry[curry$shot_made_flag=="n",]$shot_made_flag = "shot_no"
curry[curry$shot_made_flag=="y",]$shot_made_flag = "shot_yes"

iguodala[iguodala$shot_made_flag=="n",]$shot_made_flag = "shot_no"
iguodala[iguodala$shot_made_flag=="y",]$shot_made_flag = "shot_yes"

green[green$shot_made_flag=="n",]$shot_made_flag = "shot_no"
green[green$shot_made_flag=="y",]$shot_made_flag = "shot_yes"

durant[durant$shot_made_flag=="n",]$shot_made_flag = "shot_no"
durant[durant$shot_made_flag=="y",]$shot_made_flag = "shot_yes"

thompson[thompson$shot_made_flag=="n",]$shot_made_flag = "shot_no"
thompson[thompson$shot_made_flag=="y",]$shot_made_flag = "shot_yes"

curry$minute = (curry$period * 12) - curry$minutes_remaining
iguodala$minute = (iguodala$period * 12) - iguodala$minutes_remaining
green$minute = (green$period * 12) - green$minutes_remaining
durant$minute = (durant$period * 12) - durant$minutes_remaining
thompson$minute = (thompson$period * 12) - thompson$minutes_remaining

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

df <- rbind(curry, iguodala, durant, thompson, green)

write.csv(df, file = "../data/shots-data.csv",row.names=FALSE)

sink(file = '../output/shots-data-summary.txt')
summary(df)
sink()

