class Article < ActiveRecord::Base
    attr_accessible :title, :shortcontent, :content, :user_id, :start_date, :end_date
    belongs_to :user
    
    has_many :article_comments
    has_many :comments, :through => :article_comments
end
