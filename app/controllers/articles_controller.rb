class ArticlesController < ApplicationController

	def new
		puts "in new"
		@article = Article.new
	end

	def show
		puts "in show"
		@article = Article.find(params[:id])
	end	

	def edit
		puts 'in edit'	
		@article = Article.find(params[:id])
	end	

	def index
		puts 'in index'
		@articles = Article.all
	end

	def destroy
		puts 'in destroy'
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	def update
		puts 'in update'
	  @article = Article.find(params[:id])
	  if @article.update(article_params)
	    redirect_to @article
	  else
	    render 'edit'
	  end
	end

	def create
		puts 'in create'
		@article = Article.new(article_params)
		#article.save returns the validation output. If passes, save. Else, do nothing
		if @article.save
			redirect_to @article
		else
			#render apparently calls the controller's action
			render 'new'
		end
	end

	private 
		def article_params
			params.require(:article).permit(:title, :text)
		end

end
