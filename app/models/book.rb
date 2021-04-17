class Book < ApplicationRecord
    belongs_to :user, optional: true
    enum status: [:abled, :reserved, :payed] 
end
