# Delete a voter or politician
def get
  gets.chomp.strip.capitalize
end
def border
  puts "##" * 40
end
def delete
  d_choice = get
  if d_choice == "P"
    list_pol
    puts "Who would you like to delete?"
    delete_pol = get
    until Politician.all_politicians.include? delete_pol
      puts "Please select a politician in the above directory"
      delete_pol = get
    end
    Politician.all_politicians.delete(delete_pol)
  elsif d_choice == "V"
    list_voter
    puts "\nWho would you like to delete?"
    delete_voter = get
    until Voter.all_voters.include? delete_voter do
      puts "Please select a voter in our records"
      delete_voter = get
    end
    Voter.all_voters.delete(delete_voter)
  else
    puts "Please select a (P)olitician or a (V)oter"
    delete
  end
end
