class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @taskpost = current_user.taskposts.build #form用
      @taskposts = current_user.taskposts.order("created_at desc").page(params[:page]) #一覧表示用
    end
  end
end
