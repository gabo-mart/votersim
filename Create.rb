require './voter.rb'
def get
  gets.chomp.strip.capitalize
end
def border
  puts "##" * 40
end
def get_politician
  border
  puts "  What party does the politician represent? (D)emocratic or (R)epublican?"
  party = get
  until party == "D" || party == "R"
    "  Only (R)epublican or (D)emocrats are valid"
    party = get
  end
  if party == "R"
    party << "epublican"
  else
    party << "emocratic"
  end
  party
end
def get_voter
  border
  puts "  What party does the politician represent? \n\n
  (L)iberal, (C)onservative, (T)ea Party, (R)epublican, (D)emocrat, \n(S)ocialist, or (N)eutral\n"
  party = get
  case party
  when "R"
    party << "epublican"
  when "D"
    party << "emocratic"
  when "L"
    party << "iberal"
  when "C"
    party << "onservative"
  when "T"
    party << "ea Party"
  when "S"
    party << "ocialist"
  when "N"
    party << "eutral"
  else
    get_voter
  end
  party
end
def create
  puts "  Please enter the name of the New Politician you would like to nominate."
  pol = get
  if Politician.all_politicians[pol].nil?
    party = get_politician
  else
    puts "  Politician already exists. Please enter new."
    pol = get
    party = get_politician
  end
  newguy = Politician.new(pol, party)
end

def create_voter
  puts "  Please enter the name of the New Voter you would like to record."
  voters = get
  if Voter.all_voters[voters].nil?
    party = get_voter
  else
    puts "  Politician already exists. Please enter new."
    voters = get
    party = get_voter
  end
  newguy = Voter.new(voters, party)
end
