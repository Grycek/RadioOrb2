class Chart < ActiveRecord::Base
    attr_accessible :number, :description, :date
    has_many :votes
    has_many :results
    
    def self.last_chart
        return Chart.last
    end
end
