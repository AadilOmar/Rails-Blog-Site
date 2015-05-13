class ArticlesController < ApplicationController


	def new
		puts "in new"
		@article = Article.new
		@user = User.find(params[:user_id])
		@article.user = @user
		puts @user.id		
	end

	def show
		puts "in show"
		puts params[:user_id]
		puts "ASDF"
		@user = User.find(params[:user_id])
		@article = @user.articles.find(params[:id])
	end	

	def edit
		puts 'in edit'	
		@user = User.find(params[:user_id])
		@article = @user.articles.find(params[:id])
	end	

	def index
		puts 'in index......'
		@user = User.find(params[:user_id])
		puts @user.id
		@articles = @user.articles.all.reverse
	end

	def destroy
		puts 'in destroy'
		@user = User.find(params[:user_id])
		@article = @user.articles.find(params[:id])
		@article.destroy
		redirect_to user_articles_path(@user.id)
	end

	def update
		puts 'in update'
	  @article = Article.find(params[:id])
	  if @article.update(article_params)
	    redirect_to user_articles_path(@article.user.id)
	  else
	    render 'edit'
	  end
	end

	def create
		puts 'in create'
		puts params
		@user = User.find(params[:user_id])
		@article = @user.articles.create(article_params)
		if @article.save
			redirect_to user_article_path(@user, @article)
		else
			render 'new'
		end
	end

	private 
		def article_params
			params.require(:article).permit(:title, :text)
		end

end
