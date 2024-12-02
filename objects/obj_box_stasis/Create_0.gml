/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

sprite=spr_test_box_stasis;
moved=false;

stored_movement=[];

push = function(_hmove, _vmove){
	moved=false;
	if(position[0]+_hmove>=0&&position[0]+_hmove<obj_grid_manager.grid_size[0] && position[1]+_vmove>=0&&position[1]+_vmove<obj_grid_manager.grid_size[1]){
		if(!obj_grid_manager.grid[position[0]+_hmove][position[1]+_vmove].wall && !obj_grid_manager.grid[position[0]+_hmove][position[1]+_vmove].box && obj_grid_manager.grid[position[0]+_hmove][position[1]+_vmove].door_open){
			obj_grid_manager.grid[position[0]][position[1]].box=false;
			obj_grid_manager.grid[position[0]][position[1]].box_obj=pointer_null;
			position[0]+=_hmove;
			position[1]+=_vmove;
			if(!obj_game_manager.time_stop){
				switch_control(_hmove,_vmove);
			}
			if(obj_grid_manager.grid[position[0]][position[1]].hole){
				obj_grid_manager.grid[position[0]][position[1]].hole=false;
				draw_color=c_gray;
			}else{
				obj_grid_manager.grid[position[0]][position[1]].box=true;
				obj_grid_manager.grid[position[0]][position[1]].box_obj=self;
			}
			return true;
		}else{
			return false;	
		}
	}else{
		return false;	
	}
	
}

resume_time  = function(_hmove, _vmove){
	moved=false;
	if(position[0]+_hmove>=0&&position[0]+_hmove<obj_grid_manager.grid_size[0] && position[1]+_vmove>=0&&position[1]+_vmove<obj_grid_manager.grid_size[1]){
		if(!obj_grid_manager.grid[position[0]+_hmove][position[1]+_vmove].wall && !obj_grid_manager.grid[position[0]+_hmove][position[1]+_vmove].box && obj_grid_manager.grid[position[0]+_hmove][position[1]+_vmove].door_open){
			obj_grid_manager.grid[position[0]][position[1]].box=false;
			obj_grid_manager.grid[position[0]][position[1]].box_obj=pointer_null;
			position[0]+=_hmove;
			position[1]+=_vmove;
			obj_grid_manager.grid[position[0]][position[1]].box=true;
			obj_grid_manager.grid[position[0]][position[1]].box_obj=self;
			return true;
		}else{
			return false;	
		}
	}else{
		return false;	
	}
	
}

final_resume = function(){
	if(obj_grid_manager.grid[position[0]][position[1]].hole){
		obj_grid_manager.grid[position[0]][position[1]].box=false;
		obj_grid_manager.grid[position[0]][position[1]].box_obj=pointer_null;
		obj_grid_manager.grid[position[0]][position[1]].hole=false;
		
		draw_color=c_gray;
	}else if(draw_color!=c_gray){
		obj_grid_manager.grid[position[0]][position[1]].box=true;
		obj_grid_manager.grid[position[0]][position[1]].box_obj=self;
	}
}

switch_control = function(_hmove, _vmove){
	//if(obj_grid_manager.grid[position[0]-_hmove][position[1]-_vmove].switch_tile!=pointer_invalid){
		
	//	obj_grid_manager.grid[obj_grid_manager.grid[position[0]-_hmove][position[1]-_vmove].switch_tile[0]][obj_grid_manager.grid[position[0]-_hmove][position[1]-_vmove].switch_tile[1]].door_open=false;
	//	show_debug_message(obj_grid_manager.grid[obj_grid_manager.grid[position[0]-_hmove][position[1]-_vmove].switch_tile[0]][obj_grid_manager.grid[position[0]-_hmove][position[1]-_vmove].switch_tile[1]])
	//	obj_grid_manager.grid[obj_grid_manager.grid[position[0]-_hmove][position[1]-_vmove].switch_tile[0]][obj_grid_manager.grid[position[0]-_hmove][position[1]-_vmove].switch_tile[1]].door_obj.draw_color=obj_grid_manager.grid[obj_grid_manager.grid[position[0]-_hmove][position[1]-_vmove].switch_tile[0]][obj_grid_manager.grid[position[0]-_hmove][position[1]-_vmove].switch_tile[1]].door_obj.draw_color_original;
	//	if(obj_grid_manager.grid[obj_grid_manager.grid[position[0]-_hmove][position[1]-_vmove].switch_tile[0]][obj_grid_manager.grid[position[0]-_hmove][position[1]-_vmove].switch_tile[1]].box){
	//		if(!array_equals([position[0]-_hmove, position[1]-_vmove], [obj_player.position[0]+_hmove, obj_player.position[1]+_vmove])){
				
	//			obj_grid_manager.grid[obj_grid_manager.grid[position[0]-_hmove][position[1]-_vmove].switch_tile[0]][obj_grid_manager.grid[position[0]-_hmove][position[1]-_vmove].switch_tile[1]].box=false;
	//			instance_destroy(obj_grid_manager.grid[obj_grid_manager.grid[position[0]-_hmove][position[1]-_vmove].switch_tile[0]][obj_grid_manager.grid[position[0]-_hmove][position[1]-_vmove].switch_tile[1]].box_obj)
	//			obj_grid_manager.grid[obj_grid_manager.grid[position[0]-_hmove][position[1]-_vmove].switch_tile[0]][obj_grid_manager.grid[position[0]-_hmove][position[1]-_vmove].switch_tile[1]].box_obj=pointer_null
	//		}
	//	}
	//}
	//if(obj_grid_manager.grid[position[0]][position[1]].switch_tile!=pointer_invalid){
	//	obj_grid_manager.grid[obj_grid_manager.grid[position[0]][position[1]].switch_tile[0]][obj_grid_manager.grid[position[0]][position[1]].switch_tile[1]].door_open=true;
	//	obj_grid_manager.grid[obj_grid_manager.grid[position[0]][position[1]].switch_tile[0]][obj_grid_manager.grid[position[0]][position[1]].switch_tile[1]].door_obj.draw_color=merge_color(obj_grid_manager.grid[obj_grid_manager.grid[position[0]][position[1]].switch_tile[0]][obj_grid_manager.grid[position[0]][position[1]].switch_tile[1]].door_obj.draw_color_original,c_black,0.5);
	//}	
}


find_empty_space = function(){
	var _distance = 1;	
	while(_distance<max(obj_grid_manager.grid_size[0],obj_grid_manager.grid_size[1])){
		for(var i = -_distance; i <= _distance; i++){
			for(var j = -(_distance-abs(i)); j <= _distance - abs(i); j++){
				//show_debug_message("Checking ("+string(position[0]+i)+", "+string(position[1]+j)+") which is ("+string(battle_grid[position[0]+i][position[1]+j]._x_coord)+", "+string(battle_grid[position[0]+i][position[1]+j]._y_coord)+")");
				if(position[0]+i>=0 && position[0]+i<obj_grid_manager.grid_size[0] && position[1]+j>=0 && position[1]+j<obj_grid_manager.grid_size[1]){
					if(obj_grid_manager.grid[position[0]+i][position[1]+j].door_open && !obj_grid_manager.grid[position[0]+i][position[1]+j].wall && !obj_grid_manager.grid[position[0]+i][position[1]+j].box && !obj_grid_manager.grid[position[0]+i][position[1]+j].stairs){
						return [position[0]+i, position[1]+j];
					}
				
					//show_debug_message(string(position[0]+i)+", "+string(position[1]+j));
				}
			}
		}
	}
	return 
	
}