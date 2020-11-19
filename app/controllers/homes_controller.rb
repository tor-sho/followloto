class HomesController < ApplicationController

  def follower
    client = twitter_client
    @followers = client.followers("@yoneapp", { :count => 200 })
    @followers.each do |follower|
      Follower.create(:name => follower.name, :screen_name => follower.screen_name)
    end
    @followers = Follower.all
    @winners = Follower.order("RAND()").limit(4)
  end

  def top

  end

end
