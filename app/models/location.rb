class Location < ApplicationRecord
    has_many :photoshoots
    has_many :clients, through: :photoshoots 
end 