/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hmove=0;
vmove=0;

actionable=true;
warped=false;

/*
0 - up
1 - left
2 - down
3 - right
*/

move = function(){
	if(position[0]+hmove>=0&&position[0]+hmove<obj_grid_manager.grid_size[0] && position[1]+vmove>=0&&position[1]+vmove<obj_grid_manager.grid_size[1]){
		if(obj_grid_manager.grid[position[0]+hmove][position[1]+vmove].box){
			if(obj_grid_manager.grid[position[0]+hmove][position[1]+vmove].box_obj.push(hmove, vmove)){
				position[0]+=hmove;
			position[1]+=vmove;	
			}
		
		}else if(obj_grid_manager.grid[position[0]+hmove][position[1]+vmove].warp!=pointer_invalid && !warped){
			
			position[0]+=hmove;
			position[1]+=vmove;
			if(!obj_grid_manager.grid[obj_grid_manager.grid[position[0]][position[1]].warp[0]][obj_grid_manager.grid[position[0]][position[1]].warp[1]].box){
				actionable=false;
				warped=true;
				alarm[0]=60;
			}
			
		}else if(!obj_grid_manager.grid[position[0]+hmove][position[1]+vmove].wall && !obj_grid_manager.grid[position[0]+hmove][position[1]+vmove].hole){
			position[0]+=hmove;
			position[1]+=vmove;
		}
	}
	
}