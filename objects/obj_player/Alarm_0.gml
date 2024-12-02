/// @description warp timer
// You can write your code in this editor
actionable=true;

array_copy(position,0,obj_grid_manager.grid[position[0]][position[1]].warp,0,2)
hmove=move_prev[0]
vmove=move_prev[1]
x_draw=obj_grid_manager.grid_start[0]+obj_grid_manager.tile_size*position[0]
y_draw=obj_grid_manager.grid_start[1]+obj_grid_manager.tile_size*position[1]
move();

