class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|venture_capitalist| venture_capitalist.total_worth > 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|funding_round| funding_round.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map {|funding_round| funding_round.startup}.uniq
    end

    def biggest_investment
        investment = []
        funding_rounds.each do |funding|
            investment << funding.investment
        end
        investment.max
    end

    def invested(domain)
        funding_rounds.each do |funding|
            if funding.startup.domain == domain
                return funding.investment
            else
                return nil
            end
        end
    end
    
end
