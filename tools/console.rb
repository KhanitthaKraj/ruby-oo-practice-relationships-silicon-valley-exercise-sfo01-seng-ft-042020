require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
startup1 = Startup.new("abc123", "Khanittha KK", "123")
startup2 = Startup.new("Love my Live", "John Tom", "OKAY11")
startup3 = Startup.new("Goop", "Gwyneth Paltrow", "Goop-Py")
startup4 = Startup.new("Wild House", "Thorin Bus", "WildWest111")

venture1 = VentureCapitalist.new("Chase", 30000000000000000)
venture2 = VentureCapitalist.new("CapOne", 5000000000000)
venture3 = VentureCapitalist.new("America", 90000000000000000)
venture4 = VentureCapitalist.new("Wells", 8000000)
venture5 = VentureCapitalist.new("Golden Gate", 60000000)

funding1 = FundingRound.new(startup1, venture1, "Angel", 50000000.00)
funding2 = FundingRound.new(startup1, venture5, "Pre-Seed", 900000000.00)
funding3 = FundingRound.new(startup3, venture1, "Series A", 800000000000.00)
funding4 = FundingRound.new(startup2, venture4, "Series A", 750000000000.00)
funding5 = FundingRound.new(startup4, venture3, "Series C", 98800800000000000.00)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line