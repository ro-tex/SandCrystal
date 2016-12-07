require "json"

module Scan
  # returns a hash: {floorRefId: {date: number_of_records}}
  def self.parse_one(infile_name)
    unless File.exists? infile_name
      p "The file doesn't exist"
      return
    end

    return if File.directory?(infile_name)
    stats = Hash(String, Hash(String, Int32)).new
    File.open(infile_name).each_line do |line|
      json = JSON.parse line
      id = json["floorRefId"].to_s
      day = json["time"].to_s[0, 10]

      stats[id] = Hash(String, Int32).new unless stats.has_key? id
      stats[id][day] = (stats[id].has_key? day) ? stats[id][day] + 1 : 1
    end
    stats
  end

  def parse_all(dir)
    return unless Dir.exists?(dir)
    
    stats_all = Hash(String, Hash(String, Int32)).new
    
    Dir.entries(dir).each do |file|
      stats = parse_one(file)
    end
    
  end

  p parse_one("/Users/inovakov/Downloads/bb/Cassandra-cmx-rtp5-1-a.cisco.com-2016_07_10.json")

  # parse_csv(ARGV[0]) unless ARGV.empty?
end
