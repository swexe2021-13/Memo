class User < ApplicationRecord
    validates :name , :password, :email ,presence: true
 
end


