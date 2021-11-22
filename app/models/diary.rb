class Diary < ApplicationRecord
    validates :title , :message ,presence: true
    validates :title, length: { maximum: 20 }
end
