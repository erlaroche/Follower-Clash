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
        config.consumer_key       = ""
        config.consumer_secret    = ""
        config.access_token        = ""
        config.access_token_secret = ""
      end
      
      client.user(@username).followers_count
    end
  end

  class Comparer
    def initialize(user1, user2)
      @user1=user1
      @user2=user2
    end
  end
end

