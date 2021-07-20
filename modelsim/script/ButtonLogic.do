# Reading C:/intelFPGA_lite/18.1/modelsim_ase/tcl/vsim/pref.tcl
# Loading project requestRandom
# reading C:/intelFPGA_lite/18.1/modelsim_ase/win32aloem/../modelsim.ini
# Loading project DiceControl
# Compile of DiceControl_entity.vhdl failed with 3 errors.
# Compile of gamecontrol_behavior.vhdl failed with 2 errors.
# 2 compiles, 2 failed with 5 errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of gamecontrol_behavior.vhdl failed with 2 errors.
# 2 compiles, 1 failed with 2 errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl failed with 18 errors.
# 2 compiles, 1 failed with 18 errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl failed with 17 errors.
# 2 compiles, 1 failed with 17 errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl failed with 16 errors.
# 2 compiles, 1 failed with 16 errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl failed with 16 errors.
# 2 compiles, 1 failed with 16 errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl failed with 16 errors.
# 2 compiles, 1 failed with 16 errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl failed with 13 errors.
# 2 compiles, 1 failed with 13 errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl failed with 12 errors.
# 2 compiles, 1 failed with 12 errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl failed with 12 errors.
# 2 compiles, 1 failed with 12 errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl failed with 12 errors.
# 2 compiles, 1 failed with 12 errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl failed with 11 errors.
# 2 compiles, 1 failed with 11 errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl failed with 11 errors.
# 2 compiles, 1 failed with 11 errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl failed with 11 errors.
# 2 compiles, 1 failed with 11 errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl failed with 10 errors.
# 2 compiles, 1 failed with 10 errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl failed with 10 errors.
# 2 compiles, 1 failed with 10 errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl was successful with warnings.
# 2 compiles, 0 failed with no errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl was successful with warnings.
# 2 compiles, 0 failed with no errors.
vsim -t ps DiceControl
# vsim -t ps DiceControl 
# Start time: 02:22:13 on Jun 04,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.dicecontrol(behavior)
add wave *
force clock 1 0, 0 1 -repeat 2
force Tick 0 0, 1 4, 0 6 -repeat 6
force RollDiceIn 0 0, 1 6, 0 8
force Done 0 0, 1 20, 0 22, 1 34, 0 36
force ShiftValue 0011 0, 1011 17, 0001 31
force Reset 1 0, 0 2 
run 44
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl failed with 3 errors.
# 2 compiles, 1 failed with 3 errors.
# Compile of DiceControl_entity.vhdl was successful.
# Compile of DiceControl_behavior.vhdl was successful with warnings.
# 2 compiles, 0 failed with no errors.
