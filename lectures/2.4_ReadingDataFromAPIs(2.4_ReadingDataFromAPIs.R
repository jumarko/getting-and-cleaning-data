# E.g. Twitter
# https://dev.twitter.com/apps
# -> create app "Simply Statistics Blog"
# Check the documentation as well https://dev.twitter.com/docs/api/1.1/overview

# Accessing Twitter - OAuth
myapp = oauth_app("twitter", key="yourConsumerKeyHere", secret="yourConsumerSecretHere")
sig = sign_oauth1.0(myapp, token="yourTokenHere",
                    token_secret="yourTokenSecretHere")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

# Converting the json object
json1 = content(homeTL)
# format json (toJSON) and convert it to the data frame (fromJSON)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]
