onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal /testbench/coreahbtoapb3_0/haddr
add wave -noupdate -format Logic /testbench/coreahbtoapb3_0/hclk
add wave -noupdate -format Literal /testbench/coreahbtoapb3_0/hrdata
add wave -noupdate -format Logic /testbench/coreahbtoapb3_0/hready
add wave -noupdate -format Logic /testbench/coreahbtoapb3_0/hreadyout
add wave -noupdate -format Logic /testbench/coreahbtoapb3_0/hresetn
add wave -noupdate -format Literal /testbench/coreahbtoapb3_0/hresp
add wave -noupdate -format Logic /testbench/coreahbtoapb3_0/hsel
add wave -noupdate -format Logic /testbench/coreahbtoapb3_0/htrans
add wave -noupdate -format Literal /testbench/coreahbtoapb3_0/hwdata
add wave -noupdate -format Logic /testbench/coreahbtoapb3_0/hwrite
add wave -noupdate -format Literal /testbench/coreahbtoapb3_0/paddr
add wave -noupdate -format Logic /testbench/coreahbtoapb3_0/penable
add wave -noupdate -format Literal /testbench/coreahbtoapb3_0/prdata
add wave -noupdate -format Logic /testbench/coreahbtoapb3_0/pready
add wave -noupdate -format Logic /testbench/coreahbtoapb3_0/psel
add wave -noupdate -format Logic /testbench/coreahbtoapb3_0/pslverr
add wave -noupdate -format Literal /testbench/coreahbtoapb3_0/pwdata
add wave -noupdate -format Logic /testbench/coreahbtoapb3_0/pwrite
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20000 ps} 0}
configure wave -namecolwidth 267
configure wave -valuecolwidth 242
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {79542 ps}
