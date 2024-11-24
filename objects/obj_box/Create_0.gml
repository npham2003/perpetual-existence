/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

sprite=spr_test_box;



push = function(_hmove, _vmove){
	if(position[0]+_hmove>=0&&position[0]+_hmove<obj_grid_manager.grid_size[0] && position[1]+_vmove>=0&&position[1]+_vmove<obj_grid_manager.grid_size[1]){
		if(!obj_grid_manager.grid[position[0]+_hmove][position[1]+_vmove].wall && !obj_grid_manager.grid[position[0]+_hmove][position[1]+_vmove].box){
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