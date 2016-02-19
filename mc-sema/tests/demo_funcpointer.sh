#!/bin/bash

source env.sh

rm -f demo_funcpointer.cfg  demo_funcpointer.cfg demo_funcpointer_opt.bc demo_funcpointer.bc demo_fp_driver.o demo_fp_driver.o demo_funcpointer_exe

${CC} -ggdb -m32 -c -o demo_funcpointer.o demo_funcpointer.c

echo "Using bin_descend to recover CFG"
${BIN_DESCEND_PATH}/bin_descend -d -march=x86 -func-map="demo_funcp_map.txt" -entry-symbol=fp_test -i=demo_funcpointer.o

${CFG_TO_BC_PATH}/cfg_to_bc -mtriple=i686-pc-linux-gnu -i demo_funcpointer.cfg  -driver=demofp_entry,fp_test,0,return,C -o demo_funcpointer.bc

${LLVM_PATH}/opt -O3 -o demo_funcpointer_opt.bc demo_funcpointer.bc
${LLVM_PATH}/llc -filetype=obj -o demo_funcpointer_opt.o demo_funcpointer_opt.bc
${CC} -ggdb -m32 -o demo_fp_driver.o -c demo_fp_driver.c
${CC} -ggdb -m32 -o demo_funcpointer_exe demo_funcpointer_opt.o demo_fp_driver.o
./demo_funcpointer_exe
