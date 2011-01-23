class Result < ActiveRecord::Base
    belongs_to :song
    belongs_to :chart
end
