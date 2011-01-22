class Comment < ActiveRecord::Base
    belongs_to :user
    
    has_many :playlist_comments
    has_many :broadcast_playlists, :through => :playlist_comments
    
    has_many :article_comments
    has_many :articles, :through => :article_comments
    
end
