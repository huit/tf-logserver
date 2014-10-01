#!/bin/bash
#
# Simple script to visualize the dependencies in the example
#
# Need terraform in your PATH, and dot from graphviz installed as well.

rm -f logserver.pdf
terraform graph | dot -Tpdf > logserver.pdf 

