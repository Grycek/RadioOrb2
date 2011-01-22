class Article < ActiveRecord::Base
    attr_accessible :title, :shortcontent, :content, :user_id, :start, :end
    belongs_to :user
end
