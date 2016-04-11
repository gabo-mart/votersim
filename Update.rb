require './voter.rb'
require './Create.rb'

def border
  puts "#" * 80
end
def get
  gets.chomp.strip.capitalize
end
def update
  border
  puts "  Would you like to update a (V)oter or a (P)olitician?"
  choice = get
  until get == "V" || get == "P" do
    puts "  Would you like to update a (V)oter or a (P)olitician?"
    choice = get
  end
  if choice == "P"
    list_pol
    puts "  Which politician would you like to update?"
    politician = get
    if Politician.all_politicians[politician].nil?
      border
      "  Politician has not yet been added to the ballot"
    else
      puts "Are you sure you want to delete #{politician}? (Y/N)"
      answer = get
      if answer == "Y"
        Politician.all_politicians.delete(politician)
        border
        create
      else
        update
      end
    end
  else
    border
    list_voter

    puts "  What Voter would you like to update?"
    voter = get
    until Voter.all_voters.key? voter do
      puts "  Please select voter from above list."
      voter = get
    end
    Voter.all_voters.delete voter
  end
end
