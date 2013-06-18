class CommentRecorder
  def self.record(data)
    Comment.create(data)
  end

  def self.run
    puts "Listening for new comments"
    Channel.subscribe(:add_article_comment)
  end
end

class Channel
  def self.host
    @host ||= Redis.new
  end

  def self.subscribe(channel_name)
    host.subscribe(:add_article_comment) do |event|
      event.message do |channel, data|
        puts "Writing a comment with data: #{data}"
        CommentRecorder.record(JSON.parse(data))
      end
    end
  end
end

