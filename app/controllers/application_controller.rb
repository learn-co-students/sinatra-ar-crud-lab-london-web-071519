
require_relative "../../config/environment"

class ApplicationController < Sinatra::Base
  set :method_override, true
  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end

  get "/" do
    redirect "/articles"
  end

  # -----------------------------------------------------
  # READ
  # -----------------------------------------------------

  get "/articles/?" do
    @articles = Article.all
    erb :index
  end

  get "/articles/new" do
  erb :new
  end

  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end
  # -----------------------------------------------------
  # CREATE
  # -----------------------------------------------------
 

  post "/articles" do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end

  # -----------------------------------------------------
  # UPDATE
  # -----------------------------------------------------

  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end

  # -----------------------------------------------------
  # DELETE
  # -----------------------------------------------------

  delete "/articles/:id/delete" do
    Article.destroy(params[:id])
    
    redirect '/articles'
  end
end
