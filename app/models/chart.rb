class Chart < ActiveRecord::Base
    attr_accessible :number, :description, :date
    validates :number, :description, :date, :presence => true
    has_many :votes, :dependent => :destroy
    has_many :results, :dependent => :destroy
    
    #TODO: niech zwraca nila jesli dla tego notowani  juz sa podliczone wyniki
    def self.last_chart
        if Chart.last and (not Chart.last.results.any?)
          return Chart.last
        else
          return nil
        end
    end
end
