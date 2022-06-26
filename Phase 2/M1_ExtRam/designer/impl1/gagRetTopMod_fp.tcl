new_project \
    -name {gagRetTopMod} \
    -location {G:\omsai\intern_ezusbcard\M1_ExtRam\designer\impl1\gagRetTopMod_fp} \
    -mode {single}
set_programming_file -file {G:\omsai\intern_ezusbcard\M1_ExtRam\designer\impl1\gagRetTopMod.pdb}
set_programming_action -action {PROGRAM}
run_selected_actions
save_project
close_project
