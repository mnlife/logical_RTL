new_project -name logical_RTL -folder {G:/verlog/logical_RTL/precision_work}
new_impl -name logical_RTL_altera_impl
set_input_dir {G:/verlog/logical_RTL/precision_work}
setup_design -design=logical_RTL
add_input_file -format verilog {{G:/verlog/logical_RTL/SPI_Slaver.v}}
add_input_file -format verilog {{G:/verlog/logical_RTL/PWM_Process.v}}
add_input_file -format verilog {{G:/verlog/logical_RTL/logical_RTL.v}}
add_input_file -format verilog {{G:/verlog/logical_RTL/Verilog2.v}}
add_input_file -format verilog {{G:/verlog/logical_RTL/Verilog2.v}}
add_input_file -format verilog {{G:/verlog/logical_RTL/PWM_DeadTime_Produce.v}}
setup_design -manufacturer ALTERA -family {NO_FAMILY}  -part {} -speed {} 
setup_design -edif=TRUE
setup_design -addio=TRUE
setup_design -basename logical_RTL
setup_design -input_delay=0
if [catch {compile} err] {
	puts "Error: Errors found during compilation with Precision Synthesis tool"
	exit -force
} else {
	puts "report_status 20"
	puts "report_status 22"
	if [catch {synthesize} err] {
		puts "Error: Errors found during synthesis with Precision Synthesis tool"
		exit -force
	}
	puts "report_status 90"
	report_timing -all_clocks
	puts "report_status 92"
}
save_impl
puts "report_status 96"
close_project
