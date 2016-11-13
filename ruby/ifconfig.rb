#!/usr/bin/ruby

# an easier to view interface display  
require 'paint'

# iterate through interfaces

def findInterfaces()
  if ARGV[0] == "-v"
    puts `ifconfig #{ARGV[1]} #{ARGV[2]}`
  else
    seq = 0..9
    en_container     = []
    vmnet_container  = []

    for num in seq
      en        = `ifconfig en#{num} 2>/dev/null|grep -Po '(inet\\s|status:\\s)\\K[^\\s]*'`
      vmnet     = `ifconfig vmnet#{num} 2>/dev/null|grep -Po '(inet\\s|status:\\s)\\K[^\\s]*'`
      str       = en.split(" ")
      status    = str.pop
      ip        = str.join("\n")
      newstatus = str.join(" ")

      if en.size > 0 && status == "active"
        en_container << Paint["en#{num} - #{status}", :green]
        en_container << Paint["#{ip}", :white]
      elsif en.size > 0 && status == "inactive"
        en_container << Paint["en#{num} - #{status}", "#404040"]
        en_container << ip if ip.size > 0
      end
      if vmnet.size > 0
        vmnet_container << Paint["vmnet#{num}", :red]
        vmnet_container << Paint["#{vmnet.strip}", :white]
      end
    end
      en_container.each{|interface|puts interface}
      vmnet_container.each{|interface| puts interface}
  end
end

findInterfaces()
