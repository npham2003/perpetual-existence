/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hmove=0;
vmove=0;

actionable=true;
warped=false;
moved=false;

stored_pushes=[];

sprite = spr_walk_down;
image_speed = 0;

/*
0 - up
1 - left
2 - down
3 - right
*/

move = function(){
	moved=false;
	// check if target is in the grid
	if(position[0]+hmove>=0&&position[0]+hmove<obj_grid_manager.grid_size[0] && position[1]+vmove>=0&&position[1]+vmove<obj_grid_manager.grid_size[1]){
		// is a box on the target space
		if(obj_grid_manager.grid[position[0]+hmove][position[1]+vmove].box){
			
			
			if(!obj_game_manager.time_stop || obj_grid_manager.grid[position[0]+hmove][position[1]+vmove].box_obj.object_index==obj_box_normal){
				if(obj_grid_manager.grid[position[0]+hmove][position[1]+vmove].box_obj.push(hmove, vmove)){
					position[0]+=hmove;
					position[1]+=vmove;	
					moved=true;
				
				}
			}else{
				array_push(stored_pushes,[obj_grid_manager.grid[position[0]+hmove][position[1]+vmove].box_obj, variable_clone(hmove), variable_clone(vmove)])
			}
		
		}else if(obj_grid_manager.grid[position[0]+hmove][position[1]+vmove].warp!=pointer_invalid && !warped){
			// is target a warp tile
			position[0]+=hmove;
			position[1]+=vmove;
			moved=true;
			
			// warp only if other warp spot doesnt have a box on it
			if(!obj_grid_manager.grid[obj_grid_manager.grid[position[0]][position[1]].warp[0]][obj_grid_manager.grid[position[0]][position[1]].warp[1]].box){
				actionable=false;
				warped=true;
				alarm[0]=60;
			}
			
		}else if(!obj_grid_manager.grid[position[0]+hmove][position[1]+vmove].wall && !obj_grid_manager.grid[position[0]+hmove][position[1]+vmove].hole && obj_grid_manager.grid[position[0]+hmove][position[1]+vmove].door_open){
			// target is not a hole or wall
			position[0]+=hmove;
			position[1]+=vmove;
			moved=true;
		}
	}
	if(hmove==0 && vmove==0){
		// reset moved variable
		moved=false;	
	}
	if(!obj_game_manager.time_stop){
	
		//if(obj_grid_manager.grid[position[0]-hmove][position[1]-vmove].switch_tile!=pointer_invalid && moved){
		
		//	obj_grid_manager.grid[obj_grid_manager.grid[position[0]-hmove][position[1]-vmove].switch_tile[0]][obj_grid_manager.grid[position[0]-hmove][position[1]-vmove].switch_tile[1]].door_open=false;
		//	//show_debug_message(obj_grid_manager.grid[obj_grid_manager.grid[position[0]-hmove][position[1]-vmove].switch_tile[0]][obj_grid_manager.grid[position[0]-hmove][position[1]-vmove].switch_tile[1]])
		//	obj_grid_manager.grid[obj_grid_manager.grid[position[0]-hmove][position[1]-vmove].switch_tile[0]][obj_grid_manager.grid[position[0]-hmove][position[1]-vmove].switch_tile[1]].door_obj.draw_color=obj_grid_manager.grid[obj_grid_manager.grid[position[0]-hmove][position[1]-vmove].switch_tile[0]][obj_grid_manager.grid[position[0]-hmove][position[1]-vmove].switch_tile[1]].door_obj.draw_color_original;
		//	if(obj_grid_manager.grid[obj_grid_manager.grid[position[0]-hmove][position[1]-vmove].switch_tile[0]][obj_grid_manager.grid[position[0]-hmove][position[1]-vmove].switch_tile[1]].box){
			
		//			obj_grid_manager.grid[obj_grid_manager.grid[position[0]-hmove][position[1]-vmove].switch_tile[0]][obj_grid_manager.grid[position[0]-hmove][position[1]-vmove].switch_tile[1]].box=false;
		//			instance_destroy(obj_grid_manager.grid[obj_grid_manager.grid[position[0]-hmove][position[1]-vmove].switch_tile[0]][obj_grid_manager.grid[position[0]-hmove][position[1]-vmove].switch_tile[1]].box_obj)
		//			obj_grid_manager.grid[obj_grid_manager.grid[position[0]-hmove][position[1]-vmove].switch_tile[0]][obj_grid_manager.grid[position[0]-hmove][position[1]-vmove].switch_tile[1]].box_obj=pointer_null
		//	}
		//}
		//if(obj_grid_manager.grid[position[0]][position[1]].switch_tile!=pointer_invalid){
		//	obj_grid_manager.grid[obj_grid_manager.grid[position[0]][position[1]].switch_tile[0]][obj_grid_manager.grid[position[0]][position[1]].switch_tile[1]].door_open=true;
		//	obj_grid_manager.grid[obj_grid_manager.grid[position[0]][position[1]].switch_tile[0]][obj_grid_manager.grid[position[0]][position[1]].switch_tile[1]].door_obj.draw_color=merge_color(obj_grid_manager.grid[obj_grid_manager.grid[position[0]][position[1]].switch_tile[0]][obj_grid_manager.grid[position[0]][position[1]].switch_tile[1]].door_obj.draw_color_original,c_black,0.5);
		//}
		
		obj_grid_manager.force_update_switches()
	}
	if(moved&& obj_game_manager.time_stop){
		// reduce time stop turns left if moved
		obj_game_manager.time_turns_left-=1;	
	}
	
	if(obj_grid_manager.grid[position[0]][position[1]].stairs){
		actionable=false;	
		alarm[2]=60;
	}
	
}

release_boxes = function(){
	for(var i=0;i<array_length(stored_pushes);i++){
		stored_pushes[i][0].resume_time(stored_pushes[i][1],stored_pushes[i][2]);
	}
	stored_pushes=[];
}