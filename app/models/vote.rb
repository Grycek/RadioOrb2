class Vote < ActiveRecord::Base
    belongs_to :user
    belongs_to :chart
    belongs_to :song
    validates_uniqueness_of :user_id, :scope => [:id, :chart_id, :song_id]
end
