class HomesController < ApplicationController

  def top
    current_user
    if @current_user
      client = twitter_client
      @result = client.friendship(@current_user.nickname, "@yoneapp")
    end
  end

  def create
    user_data = request.env['omniauth.auth']
    user = User.find_by(uid: user_data[:uid])
    if user
      log_in(user)
    else
      new_user = User.new(
        uid: user_data[:uid],
        nickname: user_data[:info][:nickname],
        name: user_data[:info][:name],
        image: user_data[:info][:image],
      )
      new_user.save
      log_in(new_user)
    end

    redirect_to action: :top

  end

  def destroy
    log_out
    redirect_to action: :top
  end


end
