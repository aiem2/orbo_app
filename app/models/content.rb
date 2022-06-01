class Content < ApplicationRecord
    paginates_per 15
    has_one_attached :logo

    validates :area, presence: true
    validates :title, presence: true
    validates :date, presence: true
    validates :download, presence: true
    validates :state, presence: true
end
