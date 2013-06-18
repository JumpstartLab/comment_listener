class CommentsController < ApplicationController
  def index
    render :json => Comment.where(:article_id => params[:article_id]).as_json
  end
end