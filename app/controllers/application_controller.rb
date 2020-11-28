class ApplicationController < ActionController::Base

  def twitter_client
    return client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end

  def log_in(user)
    session[:uid] = user.uid
  end

  def current_user
    if session[:uid]
      @current_user ||= User.find_by(uid: session[:uid])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:uid)
    @current_user = nil
  end

end
