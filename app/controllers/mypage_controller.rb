class MypageController < ApplicationController

  # ログインユーザーの記事を取得
  def index
    articles = current_user.articles
    articles = articles.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?
    @articles = articles.page params[:page]
  end
end
