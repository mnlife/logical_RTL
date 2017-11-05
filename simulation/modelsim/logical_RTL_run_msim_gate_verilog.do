transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {logical_RTL.vo}

vlog -vlog01compat -work work +incdir+G:/verlog/logical_RTL/simulation/modelsim {G:/verlog/logical_RTL/simulation/modelsim/logical_RTL.vt}

vsim -t 1ps -L altera_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L gate_work -L work -voptargs="+acc"  logical_RTL_simulation

#add wave *
#view structure
#view signals
run 1 us
quit -f
