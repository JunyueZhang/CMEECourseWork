#!/usr/bin/env python3

""" This script creates a simple program to illustrate running R from Python easily. """

__appname__ = '[TestR.py]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"


import subprocess # import
# run R from Python
subprocess.Popen("Rscript --verbose TestR.R > ../results/TestR.Rout 2> ../results/TestR_errFile.Rout", shell=True).wait()