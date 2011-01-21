class BroadcastPlaylist < ActiveRecord::Base
    attr_accessible :date, :description, :playlist
    validates :description, :playlist, :date, :presence => true
    belongs_to :broadcast
    
    has_many :playlist_comments
    has_many :comments, :through => :playlist_comments
    
end
