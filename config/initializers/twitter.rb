require 'oauth'
require 'twitter/json_stream'
require 'em-http/middleware/oauth'

# Configure all four here for Twitter single user auth
# http://dev.twitter.com/docs/auth/oauth/single-user-with-examples
warn "To get a Twitter key, register your app at http://dev.twitter.com"
CONSUMER_KEY = 'd4AuSbenGicwDugfMyuGGA'
CONSUMER_SECRET = 'EKAPPR3NH8H9AOBAA8zpQI0xYj0HtKkOpEB2ig3ddrw'
ACCESS_TOKEN = '19686293-Bpd7tR6Q1xxBhsPOsDjTwfc5IOvub44VI0eaPow'
ACCESS_SECRET = 'GrrYkG74UvhZ8zipZ7iKrUFSECt19dPTklQrD7vSA'

# Uncomment if you want Twitter per-user authentication
# Callback URL must be configured on the Twitter side
#  e.g. http://127.0.0.1/auth/twitter/callback
# https://dev.twitter.com/docs/auth/sign-in-with-twitter
#Rails.application.config.middleware.use OmniAuth::Builder do
#  use OmniAuth::Strategies::Twitter, CONSUMER_KEY, CONSUMER_SECRET
#end
