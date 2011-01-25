class Song < ActiveRecord::Base
    attr_accessible :artist, :title, :is_active
    validates :artist, :title, :presence => true
    has_many :votes
    has_many :results
end
