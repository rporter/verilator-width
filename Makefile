OBJ_DIR=width

# --trace 
VL_FLAGS= --trace +1800-2005ext+.v --cc width.v --top-module width -DEXM_USE_DPI --exe -o widthx -no-l2name --Mdir $(OBJ_DIR)

.PHONY : all run verilate compile clean

all : run

include $(VERILATOR_HOME)/include/verilated.mk

run : compile
	width/widthx

compile : verilate
	cd $(OBJ_DIR); $(MAKE) -f ../Makefile_obj

verilate : 
	-$(VERILATOR_HOME)/bin/verilator $(VL_FLAGS) width.cpp

clean :
	-@rm -rf $(OBJ_DIR) *~
