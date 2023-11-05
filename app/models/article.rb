class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  #articlesテーブルから中間テーブルに対する関連付け
  has_many :tag_articles, dependent: :destroy
  #articlesテーブルから中間テーブルを介してtagsテーブルへの関連付け
  has_many :tags, through: :tag_articles, dependent: :destroy


  belongs_to :user
end
