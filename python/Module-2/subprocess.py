#!/usr/bin/env python
import subprocess

__author__ = 'ma11ock'

# subprocess example

files = subprocess.checkout(['ls']).split('\n')
