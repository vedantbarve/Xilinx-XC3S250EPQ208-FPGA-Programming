
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name MOD_N -dir "D:/Vedant_42209/MOD_N/planAhead_run_5" -part xc3s250epq208-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Vedant_42209/MOD_N/MOD_N.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Vedant_42209/MOD_N} }
set_property target_constrs_file "MOD_N.ucf" [current_fileset -constrset]
add_files [list {MOD_N.ucf}] -fileset [get_property constrset [current_run]]
link_design
