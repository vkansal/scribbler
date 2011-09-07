Scribbler
=================
Scribbler is a starter Rails project designed to consume the [Twitter Streaming API](http://dev.twitter.com/docs/streaming-api) and display realtime information in the browser. There is basic functionality in place for a user to define an arbitrary message filter and view the stream of matching messages. Realtime updates are achieved via websockets using [Pusher](http://pusher.com).

### Getting Started ###
In order to run Scribbler, you will need to register both a new Twitter app and a free Pusher account. Once registered, you will need to update both `config/initializers/twitter.rb` and `config/initializers/pusher.rb` with the API keys for the services. You can request a Twitter access token from the control panel page for your app after registration.

Once the keys are configured, it should just be a matter of running `bundle install` to get all the necessary gems and `rake db:setup` to prepare the local database. To run the app, a `Procfile` is provided so you can just run `RACK_ENV=development foreman start`. The `RACK_ENV` is needed for running on Heroku, but you could also create another `Procfile` for development and remove it.

The application consists of the Rails webapp and a long-running Rake task that continually consumes the Twitter stream and pushes tweets to Pusher.

### Troubleshooting ###
OAuth errors will show up in the console. Usually it will be an HTTP status code from Twitter which you can reference [here](http://dev.twitter.com/docs/error-codes-responses). Make sure your consumer and access keys are all configured properly.

If Twitter is working and you are not receiving updates, you can also use the Pusher debug console to verify that the app is sending updates.

### Running on Heroku ###
First, register an account on [Heroku](http://heroku.com) if you don't have one already. The `heroku` and `heroku-rails` gems are already included in the bundle so you should be able to follow Heroku's [instructions](http://devcenter.heroku.com/articles/rails3) on setting up a new Rails 3 app on their Cedar stack to get everything running.

Note that the webapp and Rake task run on two separate dynos and that Heroku's free plan only allows for a single dyno/month of operation per app. So both processes combined can only run for free for about 2 weeks.