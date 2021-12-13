class User < ApplicationRecord
    has_many :diaries, dependent: :destroy
    validates :name , :password, :email ,presence: true
 
end


