class Comment < ActiveRecord::Base
    belongs_to :user
    
    has_many :playlist_comments
    has_many :broadcast_playlists, :through => :playlist_comments
    
end
