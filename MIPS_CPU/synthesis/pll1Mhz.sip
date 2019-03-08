set_global_assignment -entity "pll1Mhz" -library "lib_pll1Mhz" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll1Mhz" -library "lib_pll1Mhz" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "pll1Mhz" -library "lib_pll1Mhz" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll1Mhz" -name SPD_FILE [file join $::quartus(sip_path) "pll1Mhz.spd"]

set_global_assignment -library "lib_pll1Mhz" -name MISC_FILE [file join $::quartus(sip_path) "pll1Mhz_sim/pll1Mhz.vho"]
