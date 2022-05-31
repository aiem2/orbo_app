class Partner < ApplicationRecord
    has_many :ratings
    
    paginates_per 15
    validates :name, presence: true
    validates :email, presence: true
    validates :area, presence: true
    validates :logo_url, presence: true
    validates :description, presence: true
    validates :state, presence: true
    validates :liason_name, presence: true
    validates :liason_mail, presence: true
end
