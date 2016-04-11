require './voter.rb'
require './Create.rb'
require './Update.rb'
require './Delete.rb'

def get
  gets.chomp.strip.capitalize
end
def border
  puts "##" * 40
end
loop do
  class VotingSimulation
    puts "\n\nWelcome to the Voting Simulation! The fate of our country is in your hands!
    \nWhat would you like to do? (C)reate, (L)ist, (U)pdate, or (D)elete a politician?"
    action = get
    until action == "C" || action == "L" || action == "U" || action == "D"
      puts "  Invalid choice"
      action = get
    end

    case action
    when "C"
      border
      puts "  Would you like to create a (V)oter or a (P)olitician?"
      c_choice = get
      border
      until c_choice == "P" || c_choice == "V" do
        puts "  You must choose a (V)oter or a (P)olitician"
        c_choice = get
      end
      if c_choice == "V"
        puts "  You have chosen to Create a new Voter"
        create_voter
      else
        puts "  You have chosen to Create a new Politician"
        create
      end
    when "L"
      border
      puts "  Would you like to list (V)oters or (P)oliticians?"
      lists = get
      until lists == "P" || lists == "V" do
        puts "  Please choose (V)oters or (P)oliticians"
        lists = get
      end
      if lists == "P"
        puts  "__________Politicians__________"
        list_pol
      else
        "__________Voters__________"
        list_voter
      end
    when "U"
      border
      update
    else "D"
      border
      puts "What would you like to delete (V)oter or (P)olitician?"
      delete
    end

  end
end
