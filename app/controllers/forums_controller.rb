class ForumsController < ApplicationController
  def index
    @forums = Forum.all
    @topics = Topic.all
  end

  def show
    @forums = Forum.all
    @forum = Forum.find_by_name(params[:id])
  end
end
