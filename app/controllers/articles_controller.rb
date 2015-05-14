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

	def feed
		@user = User.find(params[:user_id])		
		@articles = Array.new
		@friendIds = @user.getAllFriends()
		puts "+++++++++"
		@friendIds.each do |id|
			User.find(id).articles.each do |article|
				@articles<<article
			end
		end
		puts @articles
		puts "1111111111111111111"
		render 'index'
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
		@article.datePosted = Time.now
		if @article.save
			# @article.date = Date.today()		
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
