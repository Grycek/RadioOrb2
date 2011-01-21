class PlaylistComment < ActiveRecord::Base
    belongs_to :comment
    belongs_to :broadcast_playlist
end
