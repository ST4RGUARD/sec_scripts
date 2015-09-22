require 'JSON'             # => true
require 'cobravsmongoose'  # => true
require 'awesome_print'    # => true
require 'nokogiri'         # => true

if ARGV[0] == "-h" || ARGV[0] == "--help" || ARGV[0] == nil                            # => true
  puts "  | ruby pcap2json.rb INPUT OUTPUT"                                            # => nil
  puts "  | ruby pcap2json.rb /Users/BOB/Desktop/pcap.pcapng /Users/BOB/Desktop/json"  # => nil
  exit                                                                                 # ~> SystemExit: exit
else
  #change ARGV[1] to xml to convert to json
  `tshark -r "#{ARGV[0]}" -T pdml > "#{ARGV[1]}"`
end

# 1 method
#xml = File.open("xml").read
#json = CobraVsMongoose.xml_to_json(xml)
#pretty_json = JSON.pretty_generate(JSON.parse json)
#output = ap pretty_json
#File.open("#{ARGV[1]}", "w") { |file| file.write(json) }


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

f = File.open("#{ARGV[1]}")
doc = Nokogiri::XML(f)

puts doc.xpath('//proto/name/@showname')

f.close

# >>   | ruby pcap2json.rb INPUT OUTPUT
# >>   | ruby pcap2json.rb /Users/BOB/Desktop/pcap.pcapng /Users/BOB/Desktop/json

# ~> SystemExit
# ~> exit
# ~>
# ~> /var/folders/qj/6ctp06sn5r379j9nz81gz_xc0000gp/T/seeing_is_believing_temp_dir20150727-85109-1ulumsk/program.rb:9:in `exit'
# ~> /var/folders/qj/6ctp06sn5r379j9nz81gz_xc0000gp/T/seeing_is_believing_temp_dir20150727-85109-1ulumsk/program.rb:9:in `<main>'
