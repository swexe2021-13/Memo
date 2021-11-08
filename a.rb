require 'bcrypt'
signup_password = BCrypt::Password.create("b")
print(signup_password)
puts
login_password = BCrypt::Password.new(signup_password)
print(login_password)
puts
if login_password == "sanriko"
    p "seikou"
end