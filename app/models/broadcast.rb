class Broadcast < ActiveRecord::Base
    attr_accessible :name, :description, :is_active, :day, :hour_start, :hour_end
    validates :name, :description, :day, :hour_start, :hour_end, :presence => true
    validates :day, :inclusion => { :in => 0..6 }
    has_many :presenters
    has_many :users, :through => :presenters
    
    has_many :broadcast_playlists, :dependent => :destroy
end
