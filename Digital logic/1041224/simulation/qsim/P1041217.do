onerror {quit -f}
vlib work
vlog -work work P1041217.vo
vlog -work work P1041217.vt
vsim -novopt -c -t 1ps -L maxii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.P1041217_vlg_vec_tst
vcd file -direction P1041217.msim.vcd
vcd add -internal P1041217_vlg_vec_tst/*
vcd add -internal P1041217_vlg_vec_tst/i1/*
add wave /*
run -all
