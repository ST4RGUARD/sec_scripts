# pydbg_script.py

import sys
import os
from os import *
import pydbg
from pydbg import *
from pydbg.defines import *
import shutil
from threading import Timer

if len(sys.argv) < 6:
	print "USAGE: " + sys.argv[0] + " <prog> <file_to_open> <log_dir> <timeout> <info> <clsid>"
	sys.exit()

def create_crash_log(pydbg):
	context = pydbg.dump_context()
	eip = hex(pydbg.context.Eip)
	actual_log_dir = log_dir + "\\eip_" + eip
	if not os.path.exists(actual_log_dir):
		os.makedirs(actual_log_dir)
	log_name = clsid + ".crash"
	log = file(actual_log_dir + "\\" + log_name, "w")
	log.write("-------------------\n")
	log.write("        INFO\n")
	log.write("-------------------\n")
	log.write("\n\n")
	log.write(info + "\n")
	log.write("\n\n")
	log.write("-------------------\n")
	log.write("      CONTEXT\n")
	log.write("-------------------\n")
	log.write("\n\n")
	log.write(context)
	log.close
	shutil.copy(file_to_open, actual_log_dir + "\\" + os.path.basename(file_to_open))

def access_violation_handler(pydbg):
	print "[+] access violation! (CRASH)"
	timer.cancel()
	create_crash_log(pydbg)
	pydbg.terminate_process()
	f = open("blacklist.js",'r')
		filedata = f.read()
		f.close()
		if 'placeholder' in filedata:
			newdata = filedata.replace("placeholder",clsid)
		else
			newdata = filedata.replace(")","'"+clsid+"')")
		f = open("blacklist.js",'w')
		f.write(newdata)
		f.close()
	return DBG_CONTINUE

def process_quit_handler(pydbg):
	print "[+] program quit!"
	timer.cancel()
	return DBG_CONTINUE

def first_breakpoint(pydbg):
	if pydbg.first_breakpoint:
		pydbg.set_callback(EXCEPTION_ACCESS_VIOLATION, access_violation_handler)
		pydbg.set_callback(EXIT_PROCESS_DEBUG_EVENT, process_quit_handler)

	return DBG_CONTINUE

def timeout_handler():
	print "[+] " + os.path.basename(program) + " timedout!"
	dbg.terminate_process()


program = sys.argv[1]
file_to_open = sys.argv[2]
log_dir = sys.argv[3]
timeout = float(sys.argv[4])
info = sys.argv[5]
clsid = sys.argv[6]

if not os.path.exists(log_dir):
	os.makedirs(log_dir)

dbg = pydbg()
print "[+] setting initial breakpoint"
dbg.set_callback(EXCEPTION_BREAKPOINT, first_breakpoint)
print "[+] loading & attaching to program..."
dbg.load(program, file_to_open)
print "[+] starting timeout timer"
timer = Timer(timeout, timeout_handler)
timer.start()
print "[+] running..."
dbg.run()

print "[+] Done!"
