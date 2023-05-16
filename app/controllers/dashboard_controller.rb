class DashboardController < ApplicationController
  def index
    @top_articles = Article.order(created_at: :desc).limit(20)
    @top_authors = User.order(created_at: :desc).limit(20)
  end
end
