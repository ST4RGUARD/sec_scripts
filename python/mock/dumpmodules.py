#!/usr/bin/python

import sys,pefile

print "./script path/to/file"

# not pretty just has to work!
file=sys.argv[1]
pe=pefile.PE(file)

print '[+] Imported DLLs [+]'
for dlls in pe.DIRECTORY_ENTRY_IMPORT:
    print '[+] ' , dlls.dll, ' [+]'
