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

if (hmove == 1){
	sprite = spr_walk_right;
	image_speed = 1;
	if (input_check_released("right")){
		image_speed = 0;
	}
}else if (hmove = -1){
	sprite = spr_walk_left;
	image_speed = 1;
	if (input_check_released("left")){
		image_speed = 0;
	}
}

if (vmove = 1){
	sprite = spr_walk_down;
	image_speed = 1;
	if (input_check_released("down")){
		image_speed = 0;
	}
}else if (vmove = -1){
	sprite = spr_walk_up;
	image_speed = 1;
	if (input_check_released("right")){
		image_speed = 0;
	}
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

