require 'rubygems'
require 'bundler/setup'
require 'twitter'

module UserComparer
  class User
    attr_reader :username
    
    def initialize(username)
      @username=username
    end

    def followers
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['CONSUMER_KEY']
        config.consumer_secret     = ENV['CONSUMER_SECRET']
        config.access_token         = ENV['OAUTH_TOKEN']
        config.access_token_secret  = ENV['OAUTH_TOKEN_SECRET']
      end
      client.user(@username).followers_count
    end

    def friends
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['CONSUMER_KEY']
        config.consumer_secret     = ENV['CONSUMER_SECRET']
        config.access_token         = ENV['OAUTH_TOKEN']
        config.access_token_secret  = ENV['OAUTH_TOKEN_SECRET']
      end
      client.user(@username).friends_count
    end
  

    def tweets
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['CONSUMER_KEY']
        config.consumer_secret     = ENV['CONSUMER_SECRET']
        config.access_token         = ENV['OAUTH_TOKEN']
        config.access_token_secret  = ENV['OAUTH_TOKEN_SECRET']
      end
      client.user(@username).tweets_count
    end
  end

  class Comparer
    # you will also need a compare method
    def initialize(user1, user2)
      @user1 = user1
      @user2 = user2
    end
  
    def compare
      if (@user1.followers) == (@user2.followers)
        return "#{user1.username} and #{user2.username} have a tie in followers!"
      elsif (@user1.followers) > (@user2.followers)
        return "#{@user1.username} has more followers than #{@user2.username}."
      else (@user1.followers) < (@user2.followers)
        return "#{@user2.username} has more followers."
      end
    end

    def friend_count
      if (@user1.friends) == (@user2.friends)
        return "#{user1.username} and #{user2.username} have a tie in followers!"
      elsif (@user1.friends) > (@user2.friends)
        return "#{@user1.username} has more friends than #{@user2.username}."
      else (@user1.friends) < (@user2.friends)
        return "#{@user2.username} has more followers than #{@user1.username}."
      end
    end

    def tweet_count
      if (@user1.tweets) == (@user2.tweets)
        return "#{@user1.tweets} and #{@user2.tweets} have a tie in followers!"
      elsif (@user1.tweets) > (@user2.tweets)
        return "#{@user1.username} has more friends than #{@user2.username}."
      else (@user1.tweets) < (@user2.tweets)
        return "#{@user2.username} has more followers than #{@user1.username}."
      end
    end
  end
end

