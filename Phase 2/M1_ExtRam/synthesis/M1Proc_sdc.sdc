# Top Level Design Parameters

# Clocks

create_clock -name {M1Proc|TCK} -period 10.000000 -waveform {0.000000 5.000000} TCK
create_clock -name {M1Proc|SYSCLK} -period 10.000000 -waveform {0.000000 5.000000} SYSCLK

# False Paths Between Clocks


# False Path Constraints


# Maximum Delay Constraints


# Multicycle Constraints


# Virtual Clocks
# Output Load Constraints
# Driving Cell Constraints
# Wire Loads
# set_wire_load_mode top

# Other Constraints
