class MypageController < ApplicationController

  # ログインユーザーの記事を取得
  def index
    @articles = current_user.articles.page params[:page].per(10)
  end
end
