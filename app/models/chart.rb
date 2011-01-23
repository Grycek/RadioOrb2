class Chart < ActiveRecord::Base
    attr_accessible :number, :description, :date
    has_many :votes
    has_many :results
    
    #TODO: niech zwraca nila jesli dla tego notowani  juz sa podliczone wyniki
    def self.last_chart
        return Chart.last
    end
end
