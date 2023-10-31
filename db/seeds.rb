# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |n|
  email = "user#{sprintf('%03d', n+1)}@test.com"
  user = User.find_or_create_by!(email: email) do |u|
  u.password = "test1234"
  end

50.times do |s|
  title = "No.#{s + 1}:user#{sprintf('%03d', n+1)}の記事"
  content = "No.#{s + 1}:user#{sprintf('%03d', n+1)}の本文"
  user.articles.find_or_create_by!(title: title, content: content)
  end
end
