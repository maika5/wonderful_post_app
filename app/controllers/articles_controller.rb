class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles
  def index
    @articles = Article.all
  end

 # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

 # GET /articles/1/edit
  def edit
  end


  # POST /articles
  def create
    # インスタンスを model から作成する
    # article_params メソッドが呼ばれている
    @article = Article.new(article_params)

    # インスタンスを DB に保存する
      if @article.save
         redirect_to article_url(@article), notice: "Article was successfully created."
      else
         render :new, status: :unprocessable_entity
      end
    end


    # PATCH/articles/1/
    def update
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end

    # DELETE /articles/1
  def destroy
    @article.destroy
      redirect_to articles_url, notice: "Article was successfully destroyed."
    end


    private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params #ストロングパラメータ
      params.require(:article).permit(:title, :content) #パラメーターのキー
  end
end
