class ArticlesController < ApplicationController
	def index
		if params[:tag]
			@articles = Article.tagged_with(params[:tag])
		else
			@articles = Article.all
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			flash[:success] = "Success post your article"
			redirect_to root_url
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
			flash[:success] = "Success update your article"
			redirect_to article_url(@article)
		else
			render :edit
		end
	end

	def destroy
		article = Article.find(params[:id])
		title = article.title
		article.delete
		flash[:success] = "Success delete your article #{title}"
		redirect_to root_url
	end

	private

	def article_params
		params.require(:article).permit(:title, :content, :tag_list)
	end
end
