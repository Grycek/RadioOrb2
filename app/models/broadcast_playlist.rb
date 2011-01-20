class BroadcastPlaylist < ActiveRecord::Base
    attr_accessible :date, :description, :playlist
    validates :description, :playlist, :date, :presence => true
    belongs_to :broadcast
end
