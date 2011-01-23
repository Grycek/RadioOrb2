class Song < ActiveRecord::Base
    attr_accessible :artist, :title, :is_active
end
