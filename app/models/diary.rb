class Diary < ApplicationRecord
    belongs_to :user
    validates :title , :message ,presence: true
    validates :title, length: { maximum: 20 }
end
