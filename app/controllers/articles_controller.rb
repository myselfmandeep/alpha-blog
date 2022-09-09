class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end

    def create
        # render plain:[:article].inspect
        @article = Article.new(article_params)
        @article.save
        redirect_to article_show(@article)
    end

    end

    private
    def article_params
        params.require(:article).permit(:title, :description)
    end

end
