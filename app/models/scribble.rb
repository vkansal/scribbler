class Scribble < ActiveRecord::Base
  serialize :filters, Array
  serialize :params, Hash

  def filter_str
    self.filters && self.filters.join(',')
  end

  def filter_str=(f)
    self.filters = f.split(',').map(&:strip)
  end

  def param_str
    self.params && self.params.to_s
  end

  def param_str=(p)
    if h = Hash[*p.split(',').map(&:strip)]
      self.params = h
    end
  end

  def create_stream
    #twitter = OmniAuth::Strategies::Twitter.new(nil, CONSUMER_KEY, CONSUMER_SECRET)
    consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET,
                { :site => "http://stream.twitter.com", :scheme => :header })
    token = OAuth::AccessToken.from_hash(consumer,
      :oauth_token => ACCESS_TOKEN, :oauth_token_secret => ACCESS_SECRET)
    oauth = {
      :consumer_key => CONSUMER_KEY,
      :consumer_secret => CONSUMER_SECRET,
      :access_key => token.token,
      :access_secret => token.secret
    }
    Twitter::JSONStream.connect(
      #:filter => self.filters,
      :filters => self.filters,
      :oauth => oauth,
      :method => 'POST'
      #:params => self.params,
    )
  end
end
