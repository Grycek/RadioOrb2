class Chart < ActiveRecord::Base
    attr_accessible :number, :description, :date
    has_many :votes
    has_many :results
end
