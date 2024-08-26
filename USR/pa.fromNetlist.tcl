
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name USR -dir "D:/Vedant_42209/USR/planAhead_run_3" -part xc3s250epq208-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Vedant_42209/USR/USR.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Vedant_42209/USR} }
set_property target_constrs_file "USR.ucf" [current_fileset -constrset]
add_files [list {USR.ucf}] -fileset [get_property constrset [current_run]]
link_design
