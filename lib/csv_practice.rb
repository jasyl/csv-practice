require 'csv'
require 'awesome_print'

def get_all_olympic_athletes(filename)
  olympic_athlete_subset = []
  CSV.read("#{filename}", headers: true).map { |row| row.to_h }.each do |athlete|
    olympic_athlete_subset << athlete.select do |key, value|
      %w[ID Name Height Team Year City Sport Event Medal].include?(key)
    end
  end
  return olympic_athlete_subset
end

def total_medals_per_team(olympic_data)
  total_medals = Hash.new(0)
  olympic_data.each do |athlete|
    if athlete["Medal"] != "NA"
      total_medals[athlete["Team"]] += 1
    end
  end

  return total_medals
end


def get_all_gold_medalists(olympic_data)
  olympic_data.select do |hash|
    hash["Medal"] == "Gold"
  end
end
