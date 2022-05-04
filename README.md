# VHDL-timing-experiment

---
## Work with Vivado
1. We don't ship Vivado project files with the repo
2. This repo contains a `.tcl` script, source it, and it will automatically help you create a Vivado project according to your Vivado version.

```
git clone https://github.com/SuperChange001/VHDL-timing-experiment.git
cd VHDL-timing-experiment

# start vivado on threadmachine
source /tools/Xilinx/Vivado/2019.2/settings64.sh
vivado

# in the tcl command line interface exercuse
source timing_proj.tcl
```
3. Generating the project only need to be done once, have fun.