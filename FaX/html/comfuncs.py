#!/usr/bin/env python
from _winreg import *
import os, subprocess, shutil, filecmp, re
from shutil import copy
from filecmp import dircmp

# def get_clsids():
    # #read all clsids from registry
    # areg = ConnectRegistry(None,HKEY_CLASSES_ROOT)
    # akey = OpenKey(areg, r"CLSID")
    # i = 1
    # clsids = []
    # while True:
    	# try:
    		# tmp = EnumKey(akey, i)
    		# clsids.append(tmp)
    		# i +=1
    	# except WindowsError as e:
    		# print "[+] Finish reading all CLSIDs..."
    		# break

    # return clsids		
 

# def save_clsids_file(file_name):
	# #save the clisid to a file
	# clsids = get_clsids()
	# try:
		# f = open(file_name, 'w')
	# except IOError:
		# print "Error: File %s open error" % file_name
		# return 0	

	# for item in clsids:
		# print >>f, item
		

# def diff_clsid_files(baseline_clsids, new_clsids, diff_result):
	# #diff two clsid files and save to diff_result js file
	# #all clsids are saved in an array in js file
	# clsids = []
	# if filecmp.cmp(baseline_clsids, new_clsids):
		# print "[-] No new clsid found..."
		# return 0

	# try:
		# f_base = open(baseline_clsids, 'r')
	# except IOError:
		# print "Error: File %s open error" % baseline_clsids
		# return 0	

	# try:
		# f_new = open(new_clsids, 'r')
	# except IOError:
		# print "Error: File %s open error" % new_clsids
		# return 0

	# try:
		# f_diff = open(diff_result, 'w')	
	# except IOError:
		# print "Error: File %s open error" % file_name
		# return 0

	# base_lines = f_base.readlines()
	# new_lines = f_new.readlines()

	# global CID
	# CID = clsids
	# #read clsid diff
	# for item in new_lines:
		# if item not in base_lines:
			# clsids.append(item.rstrip('\n'))
		
    # # create object.js file
	# f_diff.write("var ax_objects = new Array(\n")
	# f_diff.write("'CLSID',\n")	
	# for item in clsids[0:-1]:
		# f_diff.write("'%s',\n" % item)

	# #no , follow last clsid	
	# f_diff.write("'%s'\n" % clsids[-1])	
	# f_diff.write("};")

#match clsid pattern with a string
def match_clsid_pattern(line):
	if re.match(r'\{\w{8}-\w{4}-\w{4}-\w{4}-\w{12}\}.js', line):
		line = line.rstrip('\n').rstrip(',').replace("'","")	
		return line


#generate js file for each clsid	
# def generate_clsid_js_file(diff_result):
	# clsids = []
	# try:
		# f_diff = open(diff_result, 'r')	
	# except IOError:
		# print "Error: File %s open error" % file_name
		# return 0

	# lines = f_diff.readlines()

	# for line in lines:
		# item = match_clsid_pattern(line)
		# if item is not None:
			# clsids.append(item)


	# #read registry to find entry match the clsid
	# try:
		# areg = ConnectRegistry(None,HKEY_CLASSES_ROOT)
	# except WindowsError as e:
		# print "[-] ConnectRegistry failed ..."
		# exit(0)

	# try:
		# akey = OpenKey(areg, r"CLSID")
	# except WindowsError as e:
		# print "[-] OpenKey CLSID failed ..."
		# exit(0)

	# i = 1
	# while True:
		# try:
			# tmp = EnumKey(akey, i)
			# if tmp in clsids:
				# try:
					# subkey = OpenKey(akey, tmp)
				# except WindowsError as e:
					# print "[-] OpenKey %s failed ..." % tmp
					# continue
				# try:	 	
					# subsubkey = OpenKey(subkey, r"InprocServer32")
				# except WindowsError as e:
					# print "[-] OpenKey InprocServer32 failed ..."
					# continue	
				# try:
					# server = QueryValue(subsubkey, "")
				# except WindowsError as e:
					# print "[-] QueryValue InprocServer32 failed ..."
					# continue
				# #create js file now...
				# create_clsid_js(server, tmp)		
			# i +=1
		# except WindowsError as e:
			# print "[+] Finish reading all CLSIDs..."
			# break


# def create_clsid_js(server, clsid):
	# file_name = "html//conf//" + clsid + ".js"
	# try:
		# clsid_js = open(file_name, 'w')	
	# except IOError:
		# print "Error: File %s open error" % clsid
		# return 0
	# #start to write the content to the file	
	# clsid_js.write("var ax_name = '%s';\n" % clsid)
	# clsid_js.write("ax[ax_name] = new Array();\n")
	# clsid_js.write("ax[ax_name]['Server'] = '%s';\n" % server)
	
# diff_clsid_files("clisid.txt", "new.txt", "diff_result.js")
# generate_clsid_js_file("diff_result.js")


def create_objects_js(save_dir):
	file_name = save_dir + "\\objects.js"

	try:
		objects = open(file_name, 'w')
	except IOError:
		print "Error: File %s open error" % file_name
		return 0

	#write objects.js content:
	objects.write("var ax_objects = new Array(\n")
	objects.write("'CLSID',\n")
	
	for files in os.listdir(save_dir):
		if match_clsid_pattern(files):
			objects.write("'" + files[0:-3] + "'," + "\n")

	#remove last item's ,
	objects.seek(-3, os.SEEK_END)
	objects.truncate()		
	objects.write("\n);")	


def run_axman(axman_path, js_file_folder):
	#change the axman.exe path
	axman = axman_path +"\\" + "axman.exe"
	subprocess.call([axman, js_file_folder])


# def copy_diff_files(dcmp, save_dir):
	# for name in dcmp.diff_files:
		# subprocess.call(["copy", dcmp.right,name, save_dir])
		# #os.system('copy %s\\%s %s' %(dcmp.right,name, save_dir))
		# print "diff_file %s found in %s and %s" % (name, dcmp.left, dcmp.right)


#run axman first time, get baseline
def baseline_generate(axman_path, js_file_folder1):
	print "[+] running axman"
	print "[+] generating baseline"
	run_axman(axman_path, js_file_folder1)
	

#diff js files 
def diff_js_files(js_file_folder1, js_file_folder2):
	dir1_list = []
	dir2_list = []

	for files in os.listdir(js_file_folder1):
		if match_clsid_pattern(files):
			dir1_list.append(files)

	for files in os.listdir(js_file_folder2):
		if match_clsid_pattern(files):
			dir2_list.append(files)	

	result = set(dir1_list) ^ set(dir2_list)

	return result	

#run axman second time, get all objects, diff 
def diff_generate(axman_path, js_file_folder1, js_file_folder2, save_dir):
	if not os.path.exists(axman_path):
		print "axman path error"
		exit(1)
	if not os.path.exists(js_file_folder1):
		print "baseline js file folder error"
		exit(1)
	if not os.path.exists(js_file_folder2):
		os.mkdir(js_file_folder2)
	if not os.path.exists(save_dir):
		os.mkdir(save_dir)	

	print "[+] running axman"
	print "[+] generating target files"
	run_axman(axman_path, js_file_folder2)

	#diff js files here
	diff = diff_js_files(js_file_folder1, js_file_folder2)
	
	for files in diff:
		src = js_file_folder2 + "\\" + files	
		dst = save_dir
		print "[+] copying " + files + "\n    - to " + dst
		copy(src,dst)
		#os.system('copy %s\\%s %s\\%s' %(js_file_folder2, files, save_dir,files))

	#create new objects.js
	create_objects_js(save_dir)

	#copy CLSID.js to save_dir
	src_clsid = js_file_folder2 + "\\" + "CLSID.js"
	dst_clsid = save_dir
	print "[+] copying " + src_clsid + "\n    - to " + dst_clsid
	copy(src_clsid,dst_clsid)
	#os.system('copy %s\\CLSID.js %s\\CLSID.js' %(js_file_folder2, save_dir))
