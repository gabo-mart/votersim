# Voter

class Voter
  @@voter = {}
  attr_accessor :name
  attr_accessor :affiliation
  def initialize(name, affiliation)
    @name = name
    @affiliation = affiliation
    @@voter[name] = affiliation
  end
  def self.all_voters
    @@voter
  end

end


class Politician
  @@politicians = {}

  attr_accessor :name
  attr_accessor :affiliation

  def initialize(name, affiliation)
    @name = name
    @affiliation = affiliation
    @@politicians[name] = affiliation
  end

  def self.all_politicians
    @@politicians
  end
end

def list_pol
  Politician.all_politicians.each do |politician, party|
    puts "#{politician} -- #{party}"
  end
end
def list_voter
  Voter.all_voters.each do |voter, party|
    puts "#{voter} -- #{party}"
  end
end

trump = Politician.new("Donald", "Republican")
obama = Politician.new("Barack", "Democrat")
