# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

["飯テロ", "海外旅行", "国内旅行"].each do |tag_name|
  tag = Tag.find_or_create_by!(name: tag_name)

  3.times do |n|
    email = "user#{sprintf('%03d', n+1)}@test.com"
    user = User.find_or_create_by!(email: email) do |u|
      u.password = "test1234"
    end

    50.times do |s|
      title = "No.#{s + 1}:user#{sprintf('%03d', n+1)}の記事"
      content = "No.#{s + 1}:user#{sprintf('%03d', n+1)}の本文"
      article = user.articles.find_or_create_by!(title: title, content: content)  # ここでarticleを定義

      article.tags << tag  # 記事とタグを紐付ける
    end
  end
end
