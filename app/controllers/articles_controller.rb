class ArticlesController < ApplicationController
	
	include ArticlesHelper
	before_action :authenticate_author!, except: [:index, :show, :profile]
	before_action :signed_in_author,only:[:edit,:update,:destroy]

	
	def index
		@articles = Article.all
	end	

	def show
		@articles = Article.all
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end
 


	def new
         @article = Article.new
	end

	def create
		
		@article = Article.new(article_params)
		@article.author_id = current_author.id
		
		if @article.save

       flash.notice = "Article '#{@article.title}' Created Successfully"

		redirect_to article_path(@article)
	else
		render :new
	
	end
	end
	def destroy
		@article = Article.find(params[:id])
		@article.destroy 

		flash.notice = "Article '#{@article.title}' Deleted Successfully"

redirect_to articles_path
	end

	def edit
		@article= Article.find(params[:id])
	end

	def update

		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' Updated Successfully"

		redirect_to article_path(@article)
	end

	def profile
 
  @author=Author.find(params[:id])
  end
  def signed_in_author
  	@article = Article.find(params[:id])
  	if current_author.id != @article.author_id
  		flash[:notice] = "Sorry Sir, You are not eligible"
  		redirect_to article_path(@article)
  	end
  end
end
	


