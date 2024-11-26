/// @description Insert description here
// You can write your code in this editor

hmove=input_check_pressed("right")-input_check_pressed("left")
vmove=input_check_pressed("down")-input_check_pressed("up")



if(actionable){
	if(hmove!=0 || vmove!=0){
		warped=false;	
	}
	move()
	
}



//if(position[0]+hmove>=0&&position[0]+hmove<obj_grid_manager.grid_size[0] && position[1]+vmove>=0&&position[1]+vmove<obj_grid_manager.grid_size[1]){
//	show_debug_message(position[0]+hmove<obj_grid_manager.grid_size[0])
//	if(hmove!=0 && !obj_grid_manager.grid[position[0]+hmove][position[1]+vmove].wall && !obj_grid_manager.grid[position[0]+hmove][position[1]+vmove].hole){
//		position[0]+=hmove;
//		return;
//	}
	
//	if(vmove!=0 && !obj_grid_manager.grid[position[0]+hmove][position[1]+vmove].wall && !obj_grid_manager.grid[position[0]+hmove][position[1]+vmove].hole){
//		position[1]+=vmove;
//		return;
//	}
//}

