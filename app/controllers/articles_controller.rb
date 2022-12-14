class ArticlesController < ApplicationController

    # prevention from break the principal of DRY
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    
    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end

    def create
        # render plain:[:article].inspect
        @article = Article.new(article_params)
        if @article.save
            flash[:success] = "Article was successfully created"
            redirect_to article_path(@article)
            # render :new
        else 
            flash[:danger] = " #{@article.errors.full_messages.join(" | ")}"
            render "new"
        end
    end
    
    def show
        # @article = Article.find(params[:id])
    end

    def destroy
        @article.destroy
        flash[:danger] = "Article was successfully deleted"
        redirect_to articles_path
        
    end
    
    def edit
    end
    
    def update
        if @article.update(article_params)
            flash[:success] = "Article was successfully updated"
            redirect_to articles_path(@article)
        else
            render "articles/temp"
        end
    end

    

    private

    def set_article
        @article = Article.find(params[:id])
    end
    
    def article_params
        params.require(:article).permit(:title, :description)
    end

end
