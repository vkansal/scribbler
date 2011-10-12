task :stream => :environment do
  EM.run do
    streams = {}

    EM.add_periodic_timer(1) do
      # Deactivate stopped streams
      Scribble.where(:streaming => false).each do |scribble|
        stream = streams.delete(scribble.id)
        if stream
          stream.stop
          p "Stopped scribbling: #{scribble.filters}"
        end
      end

      # Activate started streams
      Scribble.where(:streaming => true).each do |scribble|
        if !streams.has_key?(scribble.id)
          p "Scribbling: #{scribble.filters}"
          stream = scribble.create_stream
          stream.each_item do |tweet|
            #p tweet[0..20]
            if scribble.enable_translate

              t = Microsoft::Translate.new(MS_APPID)
              tweets=ActiveSupport::JSON.decode(tweet)

              tweets['text']+=  "<br></br>"+ t.translate(tweets['text'], {:to => scribble.select_language, :from => :en})
              tweet=tweets.to_json
            end
            Pusher[PUSHER_CHANNEL].trigger_async(scribble.id, tweet)
          end
          stream.on_error do |e|
            p e
            Rails.logger.error("Streaming error", e)
          end
          streams[scribble.id] = stream
        end
      end
    end
  end
end
