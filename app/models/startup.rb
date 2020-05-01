class Startup
    attr_accessor :name, :domain
    attr_reader :founder
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(new_domain, new_name)
        @domain = new_domain
        @name = new_name
    end

    def self.find_by_founder(founder)
        self.all.find {|startup| startup.founder == founder}
    end

    def self.domains
        self.all.map {|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.select {|funding_round| funding_round.startup == self}.count
    end

    def total_funds
        investment = []
        FundingRound.all.each do |funding_round|
            if funding_round.startup == self
                investment << funding_round.investment
            end     
        end
        investment.sum
    end

    def investors
        investers = []
        FundingRound.all.each do |funding_round|
            if funding_round.startup == self
                investers << funding_round.venture_capitalist
            end
        end
        investers.uniq
    end

    def big_investors
        investors.select {|invester| invester.total_worth > 1000000000}.uniq
    end

end
