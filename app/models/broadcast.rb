class Broadcast < ActiveRecord::Base
    attr_accessible :name, :description, :is_active, :day, :hour_start, :hour_end
end
