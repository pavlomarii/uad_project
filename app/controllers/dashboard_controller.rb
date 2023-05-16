class DashboardController < ApplicationController
  def index
    @top_articles = Article.order(:title).limit(3)
    @top_authors = User.order(:name).limit(3)
  end
end
