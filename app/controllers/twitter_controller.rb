class TwitterController < ApplicationController

  def lottery
    current_user

    Follower.destroy_all
    FinalApplicant.destroy_all
    Winner.destroy_all
    client = twitter_client
    @followers = client.followers("@yoneapp", { :count => 200 })
    @followers.each do |follower|
      Follower.create(:name => follower.name, :screen_name => follower.screen_name)
    end
    @followers = Follower.all
    @applicants = Applicant.all
    @applicants.each do |applicant|
      if Follower.find_by(screen_name: applicant.screen_name)
        FinalApplicant.create(:number => applicant.id, :name => applicant.name, :screen_name => applicant.screen_name)
      end
    end
    rand = Rails.env.production? ? "RANDOM()" : "rand()"
    @winners = FinalApplicant.order(rand).limit(1)
    @winners.each do |winner|
      Winner.create(:number => winner.number, :name => winner.name, :screen_name => winner.screen_name)
    end
=begin
    @result = 'はずれ'
    @winners.each do |winner|
      if @current_user.nickname == winner.screen_name
        return @result = 'あたり'
      end
    end
=end

  end

  def management
    lottery
    @applicants = Applicant.all
    @winners = Winner.all
  end

end
