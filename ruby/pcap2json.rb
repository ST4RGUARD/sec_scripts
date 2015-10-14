require 'JSON'
require 'cobravsmongoose'
require 'awesome_print'
require 'nokogiri'

if ARGV[0] == "-h" || ARGV[0] == "--help" || ARGV[0] == nil
  puts "  | ruby pcap2json.rb INPUT OUTPUT"
  puts "  | ruby pcap2json.rb /Users/BOB/Desktop/pcap.pcapng /Users/BOB/Desktop/json"
  exit
else
  #change ARGV[1] to xml to convert to json
  `tshark -r "#{ARGV[0]}" -T pdml > xml`
end

# 1 method
xml = File.open("xml").read
#json = CobraVsMongoose.xml_to_json(xml)
#pretty_json = JSON.pretty_generate(JSON.parse json)
#output = ap pretty_json
File.open("#{ARGV[1]}", "w") { |file| file.write(xml) }


# 2 method
#File.foreach("xml") do |xml|
 # json = CobraVsMongoose.xml_to_json(xml)
  #File.open("#{ARGV[1]}","a"){|file|file.write(json)}
#end

# 3 method
#xml = []
#File.foreach("xml"){|line|xml << line}

#xml = xml.join
#json = CobraVsMongoose.xml_to_json(xml)
#File.open("#{ARGV[1]}","a"){|file|file.write(json)}

#`rm xml`

#f = File.open("#{ARGV[1]}")
#doc = Nokogiri::XML(f)

#puts doc.xpath('//proto/name/@showname')

#f.close
