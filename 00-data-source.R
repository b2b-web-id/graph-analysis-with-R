library(readr)

url <- "https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-02-26/small_trains.csv"
small_trains <- read_csv(url)
head(small_trains)

write_rds(small_trains, "trains.rds",
          compress = "xz")
