library(tidyverse)

# Create Twitter token
twitter_token <- rtweet::create_token(
  app = "twitter_bot",
  consumer_key =    Sys.getenv("TWITTER_CONSUMER_API_KEY"),
  consumer_secret = Sys.getenv("TWITTER_CONSUMER_API_SECRET"),
  access_token =    Sys.getenv("TWITTER_ACCESS_TOKEN"),
  access_secret =   Sys.getenv("TWITTER_ACCESS_TOKEN_SECRET")
)

# Import Covid figures
covid_data <- read.csv('https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv')

covid_data$date <- as.Date(covid_data$date)

glimpse(covid_data)

covid_data <- covid_data %>% 
  filter(location == "Turkey") %>%
  select(date, new_cases)

nrow <- nrow(covid_data)

last_week <- covid_data[(nrow-6):nrow,] %>% select(new_cases)

# Post the image to Twitter
rtweet::post_tweet(
  status = paste0("Türkiye'de son 1 haftadaki günlük Covid19 vaka sayıları: ", last_week),
  # media = temp_file,
  token = twitter_token
)
