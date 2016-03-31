class CommentsController < ApplicationController
	before_action :authenticate_author!, except: [:index, :show]
	before_action :signed_in_author,only:[:edit,:update,:destroy]
	def create
		@article = Article.find(params[:article_id])
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]
		@comment.save
		respond_to do |format|
		flash.notice = " Commented successfully !"	
		format.js
		 
end
end

def edit
		
		@article = Article.find(params[:article_id])
		@comment = Comment.find(params[:id])
		respond_to do |format|
	    format.js
	end
	end

def comment_params
  params.require(:comment).permit(:author_name, :body, :author_id)
end
def update
		@article = Article.find(params[:article_id])
		@comment = Comment.find(params[:id])
		@comment.update(comment_params)
		respond_to do |format|
		   
			   
			   flash.notice = " Comment updated successfully !"	
			   	#format.html {redirect_to article_path(@article)}
			   format.js	
			 
		   
		end
	end
	def destroy
		
		@comment = Comment.find(params[:id])
		
		@comment.destroy
		@article = Article.find(params[:article_id])
		respond_to do |format|
		   flash.notice = " comment deleted successfully !"	
		 # format.html {redirect_to article_path(@article)}
		  format.js
		end
	end
	def signed_in_author
  	@article = Article.find(params[:article_id])
		@comment = Comment.find(params[:id])
  	if current_author.username != @comment.author_name
  		flash[:notice] = "Sorry Sir, You are not eligible"
  		redirect_to article_path(@article)
  	end
  end
end
