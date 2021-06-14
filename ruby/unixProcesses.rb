# # PROCESS ID - getpid(2)
# puts Process.pid
# # parent
# puts Process.ppid
#
# # ENV var
# ENV['MSG'] = 'wing it'
# system "echo $MSG"

# ARGUMENTS
# many lib for args like optparse
# if don't want to deal with overhead do something like
# ARGV.include?('--help')

# NAMING PROCESSES
# rename current process
# $PROGRAM_NAME  = "myproc"

# EXIT
# Kernel#exit - exit - status code 0
# at_exit {puts 'exiting'}
# exit

# Kernel#exit! - exit! - status code 1
# at_exit line never invoked

# Kernel#abort - generic unsuccessful exit - status code 1
# at_exit {puts "exited"}
# abort "Something went wrong"

# FORK

#CoW - copy on write
# delays copying of memory until needs to be written

# arr = [1,2,3]
# fork do
#   # child initialized
#   # if using CoW this proc doesn't need to copy arr var
#   # bc we don't modify arr it shares memory with parent
#   p arr
# end
#
# fork do
#   # arr var hasn't been copied bc of CoW
#   arr << 4
#   # modifies array, so copy needs to be made for this proc
#   # b4 it can be modified - array in parent remains un changed
# end

# fork do
#   5.times do
#     sleep 1
#     puts "I am an orphan"
#   end
# end
#
# Process.wait
# abort "Parent died"

# ceate 2 child proc
# 2.times do
#   fork do
#     # rand sleep for each child
#     sleep rand(5)
#   end
# end
#
# 2.times do
#   # wait for child proc to exit & print pid that gets returned
#   puts Process.wait
# end

# Process.wait2
## can set exit code

# 2.times do
#   fork do
#     if rand(5).even?
#       exit 110
#     else
#       exit 112
#     end
#   end
# end
#
# 2.times do
#   # wait for each of child procs to exit
#   pid, status = Process.wait2
#
#   # if proc exited with 110 we know even
#   if status.exitstatus == 110
#     puts "#{pid} even #"
#   else
#     puts "#{pid} odd #"
#   end
# end

# waitpid & waitpid2 wait for a specific child to exit determined by pid
# fav = fork do
#   exit 77
# end
#
# middle_child = fork do
#   abort "wait!"
# end
#
# pid, status = Process.waitpid2 fav
# puts status.exitstatus

# Babysitting
# parent forks childens then monitors them to ensure they are responsive

# RACE CONDITIONS
# create 2 childens - even if parent is slow at processing exited child it can always get exit child info
# 2.times do
#   fork do
#     # both procs exit immed
#     abort "finished"
#   end
# end
#
# # parent proc waits for the 1st proc then sleeps for 5 sec
# # meanwhile 2nd child proc has exited and is no longer running
# puts Process.wait
# sleep 5
#
# # parent prc asks to wait once again, & 2nd proc's exit info
# # has been queued up amazingly & is returned here
# puts Process.wait
#
# # calling Process.wait  when no child procs will raise Errno::ECHILD, KEEP TRACK of CHildens

