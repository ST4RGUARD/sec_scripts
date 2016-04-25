#!/usr/bin/env python
__author__ = 'm4lefic'

# this is the User run script that finds all clsids for newly installed software

import sys, subprocess, os, comfuncs
from comfuncs import *

root            = 'C:\\fuzzer\\'
axman_path      = 'C:\\fuzzer\\axman\\bin'
save_dir        = 'C:\\fuzzer\\html\\conf'
js_file_folder1 = 'C:\\fuzzer\\axman\\bin\\js_folder1'
js_file_folder2 = 'C:\\fuzzer\\axman\\bin\\js_folder2'


def create_files():
	
	try:
		if sys.argv[1] == "BASELINE":
			baseline_generate(axman_path, js_file_folder1)
			print "[+] completed - reboot"
			exit(0)
		elif sys.argv[1] == "-f":
			pass
		elif sys.argv[1] == "TARGET":
			diff_generate(axman_path, js_file_folder1, js_file_folder2, save_dir)
			print "[+] completed - reboot"
			exit(0)
	except:
		print "-------------------------"
		print "[1] comfuzz.py BASELINE  "
		print "-------------------------"
		print "[2] comfuzz.py TARGET    "
		print "-------------------------"
		print "[3] comfuzz.py -f        "
		print "-------------------------"
		exit(0)

def execute():
	clsid=""
	create_files()	
	subprocess.Popen(['python',root+'tcpserver.py'])

	for files in os.listdir(save_dir):
		if match_clsid_pattern(files):
			clsid = files[0:-3]

		print "[+] Fuzzing ", clsid
		subprocess.call(['python',root+'html\\pydbg_script.py', 'C:\\Program Files\\Internet Explorer\\iexplore.exe',root+'html\\index.html', root+'log', '600', 'Fuzzing Media Player', clsid])
		#remove clsid from list in objects.js so we skip for next fuzzing iteration 
		#revisit to blacklist ID - better solution
		f = open("conf/objects.js",'r')
		filedata = f.read()
		f.close()
		newdata = filedata.replace(",\n'"+clsid+"'","")
		f = open("conf/objects.js",'w')
		f.write(newdata)
		f.close()

execute()