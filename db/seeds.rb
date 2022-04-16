5.times do |n|
  name = "ユーザー#{n}"
  email = "test#{n+1}@example.com"
  password = "password"
  User.create!(
    name: name,
    email: email,
    password: password
  )
end

5.times do |num|
  Post.create!(
    user_id: 1,
    body: "#{num}個目の投稿",
  )
end
