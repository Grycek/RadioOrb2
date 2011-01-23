class Song < ActiveRecord::Base
    attr_accessible :artist, :title, :is_active
    has_many :votes
    has_many :results
end
