# db/seeds.rb
User.find_or_create_by!(email: "admin@festavip.com") do |user|
  user.phone = "41999999999"
  user.state = "PR"
  user.city = "Curitiba"
  user.role = :admin
  user.password = "admin123"
end
