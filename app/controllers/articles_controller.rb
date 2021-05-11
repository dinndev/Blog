class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  #  get the path of new article
  def show
    @article = Article.find(params[:id])
  end
  # render the article form from new view
  def new
    @article = Article.new
  end
  def create 
    # get the values from the form
    @article = Article.new(article_params)
    # attempt of saving the data, redirect to new article. else repeat process
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end
  
  def edit
     @article = Article.find(params[:id]) 
  end
   
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end
  # find the id and destroy the data
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
  # redirect to root path after destroy
    redirect_to root_path
  end
  # create require/permit to get the data from the form

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
