class ArticlesController < ApplicationController
  def index
    @artilcles = Article.all
  end
end
