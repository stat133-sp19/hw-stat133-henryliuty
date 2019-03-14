#title: make-shots-charts
#description: this script visualizes the shots of five players
#input(s): shots-data.csv, nba-court.jpg
#output(s): gsw-shot-charts.png, gsw-shot-charts.pdf

coltypes = c("character", "character", "integer","integer","integer","integer","character","factor","factor","integer","character","integer","integer", "character","integer")
df <- read.csv("../data/shots-data.csv", stringsAsFactors = FALSE, header=TRUE, colClasses = coltypes)

library(dplyr)
iguodala = filter(df, name=="Andre Iguodala")
green = filter(df, name=="Draymond Green")
durant = filter(df, name=="Kevin Durant")
thompson = filter(df, name=="Klay Thompson")
curry = filter(df, name=="Stephen Curry")

library(ggplot2)
library(jpeg)
library(grid)
# court image (to be used as background of plot)
court_file <- "../images/nba-court.jpg"
# create raste object
court_image <- rasterGrob(readJPEG(court_file),
                          width = unit(1, "npc"), 
                          height = unit(1, "npc"))

pdf(file= "../images/andre-iguodala-shot-chart.pdf", width=6.5, height=5)
# shot chart with court background
iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
iguodala_shot_chart
dev.off()


pdf(file= "../images/draymond-green-shot-chart.pdf", width=6.5, height=5)
# shot chart with court background
green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
green_shot_chart
dev.off()

pdf(file= "../images/kevin-durant-shot-chart.pdf", width=6.5, height=5)
# shot chart with court background
durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
durant_shot_chart
dev.off()

pdf(file= "../images/klay-thompson-shot-chart.pdf", width=6.5, height=5)
# shot chart with court background
thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
thompson_shot_chart
dev.off()

pdf(file= "../images/stephen-curry-shot-chart.pdf", width=6.5, height=5)
# shot chart with court background
curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
curry_shot_chart
dev.off()

final_shot_chart <- ggplot(data = df) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Summary (2016 season)') +
  facet_wrap(~name)
  theme_minimal()
  
png(file= "../images/gsw-shot-charts.png", width=8, height=7, units="in", res=200)
final_shot_chart
dev.off()

pdf(file= "../images/gsw-shot-charts.pdf", width=8, height=7)
final_shot_chart
dev.off()
