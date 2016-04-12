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
  until choice == "V" || choice == "P" do
    puts "  Would you like to update a (V)oter or a (P)olitician?"
    choice = get
  end
  case choice
  when "P"
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
  when "V"
    border
    list_voter
    if Voter.all_voters.empty?
      puts "No voters currently in register"
    elsif Voter.all_voters.key? voter
      puts "  Please select voter from above list."
      voter = get
    else
      puts "  What Voter would you like to update?"
      voter = get
      Voter.all_voters.delete voter
    end
    create_voter
  end
end
