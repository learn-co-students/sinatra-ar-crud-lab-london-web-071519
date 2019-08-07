
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  post '/' do

  end

  get '/articles/new' do
    erb :new
  end 

  post '/articles' do
    # binding.pry
    @article1 = Article.create(params)
    id = @article1.id
    redirect "/articles/#{id}"
  end

  get '/articles/:id' do 

    "content content content content content"
    @article = Article.find(params[:id])

    erb :show
    
  end

  get '/articles' do

    @articles = Article.all

    erb :index
  end

  get '/articles/:id/edit' do 
    # binding.pry
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    # binding.pry
    id = params[:id]
    @article = Article.find(id)
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save

  redirect "/articles/#{@article.id}"
  end


  delete '/articles/:id' do
    @article_object = Article.destroy(params[:id])
    redirect to("/articles")
  end




end
