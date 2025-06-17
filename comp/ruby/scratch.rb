# num of cmds
input = gets.chomp
# pwd is output working dir
# start at root -> /
# cd ..
# cd /path/to/dir
# pwd each path has trailing slash
# /path/to/dir/
# can traverse /path/here -> cd ../a -> pwd /path/a/
#input = 3

map = [root = "/",location = ""]
cmds = []
input.to_i.times do
  # need to build command in here and execute out of loop
  cmd = gets.chomp
  cmds << cmd 
end

# .. are - build path minus cd and pwd is just prints
cmds.each do |cmd|
  cmd = cmd.split()
  if cmd[0] == "pwd"
    if map[1] != ""
      puts "#{root}#{map.flatten.join}"
    else
      puts map.flatten.join
    end
  elsif cmd[1][0] != "/" && cmd[1].include?('..') == false && cmd[1].include?('/') == false
    puts "here1"
    root = "/"
    map[1] += "/#{cmd[1]}"
  elsif map[1] == "/"
    puts "here2"
    map[1] = ""
  elsif cmd[1].split('')[0] == "/"
    puts "here3"
    root = ""
    map[0] = ""
    map[1] = cmd[1]
  elsif cmd[1] != "/"
    puts "here4"
    map[0] = ""
    if cmd[1].include?('..')
    puts "here5"
      dots = cmd[1].split(' ')
      loc = []
      # if nil then just .. backup 1
      if dots[0] == '..' && dots[0].split('..') == []
        loc = map[1].split('/')[0..-2]
        root = "/"
        map[1] = loc.join
        if map[1].size == 0
          map[0] = "/"
        end
      else
        loc << dots[0].split('..')[1]
        root = "/"
        map[1] += loc.join
      end
    else
      root = "/"
      map[1] += cmd[1]
    end
  end

end
