class Presenter < ActiveRecord::Base
    validates_uniqueness_of :user_id, :scope => :broadcast_id
    belongs_to :user
    belongs_to :broadcast
end
