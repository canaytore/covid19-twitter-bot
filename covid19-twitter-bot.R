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

covid_data$date = as.Date(covid_data$date)




# Post the image to Twitter
rtweet::post_tweet(
  status = "Today Covid19 numbers: ..",
  # media = temp_file,
  token = twitter_token
)
