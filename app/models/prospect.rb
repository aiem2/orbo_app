class Prospect < ApplicationRecord
    paginates_per 15
    has_one_attached :logo

    validates :name, presence: true
    validates :email, presence: true
    validates :email, email: true
    validates :area, presence: true
    validates :description, presence: true
    validates :state, presence: true
    validates :liason_name, presence: true
    validates :liason_mail, presence: true
    validates :liason_mail, email: true
    
   
  
    
end
