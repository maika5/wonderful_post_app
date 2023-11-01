class Tag < ApplicationRecord
  validates :name, presence: true
  #tagsテーブルから中間テーブルに対する関連付け
  has_many :tag_articles, dependent: :destroy
  #tagsテーブルから中間テーブルを介してarticlesテーブルへの関連付け
  has_many :articles, through: :tag_article, dependent: :destroy
end
