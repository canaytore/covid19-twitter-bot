# Create Twitter token
twitter_token <- rtweet::create_token(
  app = "twitter_bot",
  consumer_key =    Sys.getenv("TWITTER_CONSUMER_API_KEY"),
  consumer_secret = Sys.getenv("TWITTER_CONSUMER_API_SECRET"),
  access_token =    Sys.getenv("TWITTER_ACCESS_TOKEN"),
  access_secret =   Sys.getenv("TWITTER_ACCESS_TOKEN_SECRET")
)

# Import Covid figures


# Post the image to Twitter
rtweet::post_tweet(
  status = "Today Covid19 numbers: ..",
  # media = temp_file,
  token = twitter_token
)
