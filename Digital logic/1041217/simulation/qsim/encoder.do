onerror {quit -f}
vlib work
vlog -work work encoder.vo
vlog -work work encoder.vt
vsim -novopt -c -t 1ps -L maxii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.encoder_vlg_vec_tst
vcd file -direction encoder.msim.vcd
vcd add -internal encoder_vlg_vec_tst/*
vcd add -internal encoder_vlg_vec_tst/i1/*
add wave /*
run -all
