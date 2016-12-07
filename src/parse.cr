require "json"

module Parse
  def self.parse_csv(infile_name)
    unless File.exists? infile_name
      p "CSV file doesn't exist."
      return
    end

    return if File.directory?(infile_name)

    # This regex will extract the JSON part of the line, removing the rest of the data, as it's useless to us.
    # We need to use regex because the JSON is not escaped in any way in the CSV file, making it impossible
    # to use normal CSV-parsing tools. I have no idea how they use these dumps, tbh.
    regex = /^"[\d\/]+",".*","\d+","\d+","(?<json>.*)"$/

    infile = File.open(infile_name)
    outfile = infile_name.includes?("csv") ? File.open(infile_name.gsub(".csv", ".json"), "w") : File.open(infile_name + ".json", "w")

    infile.each_line do |line|
      line =~ regex
      json = JSON.parse $~["json"]

      j = {} of String => String # this is awkward...
      j["floorRefId"] = json["floorAesUId"].to_s
      j["mac"] = json["macAddress"].to_s
      j["time"] = Time.epoch(json["sourceTimestamp"].to_s.to_i64 / 1000).to_s("%FT%T.%L%:z")
      j["x"] = json["x"].to_s
      j["y"] = json["y"].to_s
      j["z"] = json["z"].to_s
      j["lat"] = json["latitude"].to_s
      j["lon"] = json["longitude"].to_s
      j["confidenceFactor"] = json["confidenceFactor"].to_s
      j["mapHierarchyString"] = "" # we don't have that and we probably don't need it either
      j["dot11Status"] = ""        # don't have that either... we have 'networkStatus' but Darryl refused to tell me what that is
      j["manufacturer"] = ""
      outfile.write((j.to_json.to_s + "\n").to_slice)
    end

    infile.close
    outfile.close
  end

  parse_csv(ARGV[0]) unless ARGV.empty?
end
