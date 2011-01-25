class Article < ActiveRecord::Base
    attr_accessible :title, :shortcontent, :content, :user_id, :start_date, :end_date
    validates :title, :shortcontent, :content, :user_id, :start_date, :end_date, :presence => true
    belongs_to :user
    
    has_many :article_comments, :dependent => :destroy
    has_many :comments, :through => :article_comments, :dependent => :destroy
end
