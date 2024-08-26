
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name ALU4 -dir "D:/Vedant_42209/ALU4/planAhead_run_1" -part xc3s250epq208-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Vedant_42209/ALU4/ALU4.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Vedant_42209/ALU4} }
set_property target_constrs_file "ALU4.ucf" [current_fileset -constrset]
add_files [list {ALU4.ucf}] -fileset [get_property constrset [current_run]]
link_design
