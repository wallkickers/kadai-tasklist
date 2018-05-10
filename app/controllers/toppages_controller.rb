class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @taskpost = current_user.taskposts.build
      @taskposts = current_user.taskposts.order("created_at desc").page(params[:page])
    end
  end
end
