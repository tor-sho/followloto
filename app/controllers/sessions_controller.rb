class SessionsController < ApplicationController

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


  def create
    unless request.env['omniauth.auth'][:uid]
      flash[:danger] = '連携に失敗しました'
    end

    user_data = request.env['omniauth.auth']
    user = User.find_by(uid: user_data[:uid])
    if user
      log_in(user)
      flash[:success] = 'ログインしました'
    else
      new_user = User.new(
        uid: user_data[:uid],
        nickname: user_data[:info][:nickname],
        name: user_data[:info][:name],
        image: user_data[:info][:image],
      )
      if new_user.save
        log_in(new_user)
        flash[:success] = 'ユーザー登録成功'
      else
        flash[:danger] = '予期せぬエラーが発生しました'
      end
    end

    friendship

  end

  def destroy
    log_out
    flash[:success] = 'ログアウトしました'
  end

  def finish
  end

  def again
  end


  def friendship
    current_user
    client = twitter_client
    result = client.friendship(@current_user.nickname, "@yoneapp")
    if result.source.following?
      redirect_to action: :finish
    else
      redirect_to action: :again
    end
  end

end
