class Comment < ActiveRecord::Base
    validates :content, :user_id, :presence => true
    belongs_to :user
    
    has_many :playlist_comments, :dependent => :destroy
    has_many :broadcast_playlists, :through => :playlist_comments
    
    has_many :article_comments, :dependent => :destroy
    has_many :articles, :through => :article_comments
    
end
