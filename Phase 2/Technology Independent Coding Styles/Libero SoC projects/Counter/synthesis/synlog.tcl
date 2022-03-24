history clear
run_tcl -fg bit8register_syn.tcl
set_option -reporting_filter "-from {1} -to {500}"
set_option -num_startend_points 5
set_option -reporting_margin -1.0
set_option -reporting_filename bit8register_syn.ta
set_option -reporting_output_srm 0
project -run timing 
project -close "C:/Users/Yash Umale/Documents/8th Sem/Final Year Project/Phase 2/Source Code/USB-SuperSpeed-Data-Acquisition/Phase 2/Technology Independent Coding Styles/Libero SoC projects/Counter/synthesis/bit8register_syn.prj"
