onerror {quit -f}
vlib work
vlog -work work decoder.vo
vlog -work work decoder.vt
vsim -novopt -c -t 1ps -L maxii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.decoder_vlg_vec_tst
vcd file -direction decoder.msim.vcd
vcd add -internal decoder_vlg_vec_tst/*
vcd add -internal decoder_vlg_vec_tst/i1/*
add wave /*
run -all
