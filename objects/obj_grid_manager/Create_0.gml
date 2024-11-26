/// @description Insert description here
// You can write your code in this editor



grid=[];

level="test";

grid_start=[50,50];
tile_size=64;
grid_size=[];
array_copy(grid_size,0,global.levels[$level].size,0,2);


for (i=0;i<grid_size[0];i++){
	for(j=0;j<grid_size[1];j++){
		grid[i][j]= {
            wall: false,
			box: false,
			box_obj: pointer_null,
			warp: pointer_invalid,
			hole: false,
			stairs: false,
			switch_tile: pointer_invalid,
			door_open: true,
			door_obj: pointer_null
        }
		show_debug_message(grid[i][j])
	}
}

var player = instance_create_layer(grid_start[0]+tile_size*global.levels[$level].player[0],grid_start[1]+tile_size*global.levels[$level].player[1],"Instances",obj_player)
player.position=global.levels[$level].player;
player.x_draw=grid_start[0]+tile_size*player.position[0];
player.y_draw=grid_start[1]+tile_size*player.position[1];

for (i=0;i<array_length(global.levels[$level].wall);i++){
	grid[global.levels[$level].wall[i][0]][global.levels[$level].wall[i][1]].wall=true;
	var _wall = instance_create_layer(grid_start[0]+tile_size*global.levels[$level].wall[i][0],grid_start[1]+tile_size*global.levels[$level].wall[i][1],"Instances",obj_wall)
	_wall.position=global.levels[$level].wall[i];
	_wall.x_draw=grid_start[0]+tile_size*_wall.position[0];
	_wall.y_draw=grid_start[1]+tile_size*_wall.position[1];
}

for (i=0;i<array_length(global.levels[$level].box);i++){
	grid[global.levels[$level].box[i][0]][global.levels[$level].box[i][1]].box=true;
	var _box = instance_create_layer(grid_start[0]+tile_size*global.levels[$level].box[i][0],grid_start[1]+tile_size*global.levels[$level].box[i][1],"Instances",obj_box)
	
	array_copy(_box.position,0,global.levels[$level].box[i],0,2);
	_box.x_draw=grid_start[0]+tile_size*_box.position[0];
	_box.y_draw=grid_start[1]+tile_size*_box.position[1];
	grid[global.levels[$level].box[i][0]][global.levels[$level].box[i][1]].box_obj = _box;
}

for (i=0;i<array_length(global.levels[$level].warp);i++){
	grid[global.levels[$level].warp[i][0][0]][global.levels[$level].warp[i][0][1]].warp=global.levels[$level].warp[i][1];
	grid[global.levels[$level].warp[i][1][0]][global.levels[$level].warp[i][1][1]].warp=global.levels[$level].warp[i][0];
	var _warp = instance_create_layer(grid_start[0]+tile_size*global.levels[$level].warp[i][0][0],grid_start[1]+tile_size*global.levels[$level].warp[i][0][1],"Instances",obj_warp_tile);
	_warp.position=global.levels[$level].warp[i][0];
	_warp.x_draw=grid_start[0]+tile_size*_warp.position[0];
	_warp.y_draw=grid_start[1]+tile_size*_warp.position[1];
	_warp.draw_color=global.warp_colors[i];
	_warp = instance_create_layer(grid_start[0]+tile_size*global.levels[$level].warp[i][1][0],grid_start[1]+tile_size*global.levels[$level].warp[i][1][1],"Instances",obj_warp_tile);
	_warp.position=global.levels[$level].warp[i][1];
	_warp.x_draw=grid_start[0]+tile_size*_warp.position[0];
	_warp.y_draw=grid_start[1]+tile_size*_warp.position[1];
	_warp.draw_color=global.warp_colors[i];
	
}

for (i=0;i<array_length(global.levels[$level].hole);i++){
	grid[global.levels[$level].hole[i][0]][global.levels[$level].hole[i][1]].hole=true;
	var _hole = instance_create_layer(grid_start[0]+tile_size*global.levels[$level].hole[i][0],grid_start[1]+tile_size*global.levels[$level].hole[i][1],"Instances",obj_hole)
	_hole.position=global.levels[$level].hole[i];
	_hole.x_draw=grid_start[0]+tile_size*_hole.position[0];
	_hole.y_draw=grid_start[1]+tile_size*_hole.position[1];
}

for (i=0;i<array_length(global.levels[$level].switches);i++){
	grid[global.levels[$level].switches[i][0][0]][global.levels[$level].switches[i][0][1]].switch_tile=global.levels[$level].switches[i][1];
	grid[global.levels[$level].switches[i][1][0]][global.levels[$level].switches[i][1][1]].door_open=false;
	var _switch = instance_create_layer(grid_start[0]+tile_size*global.levels[$level].switches[i][0][0],grid_start[1]+tile_size*global.levels[$level].switches[i][0][1],"Instances",obj_switch);
	_switch.position=global.levels[$level].switches[i][0];
	_switch.x_draw=grid_start[0]+tile_size*_switch.position[0];
	_switch.y_draw=grid_start[1]+tile_size*_switch.position[1];
	_switch.draw_color=global.switch_colors[i];
	var _door = instance_create_layer(grid_start[0]+tile_size*global.levels[$level].switches[i][1][0],grid_start[1]+tile_size*global.levels[$level].switches[i][1][1],"Instances",obj_door);
	_door.position=global.levels[$level].switches[i][1];
	_door.x_draw=grid_start[0]+tile_size*_door.position[0];
	_door.y_draw=grid_start[1]+tile_size*_door.position[1];
	_door.draw_color=global.switch_colors[i];
	_door.draw_color_original=global.switch_colors[i];
	grid[global.levels[$level].switches[i][1][0]][global.levels[$level].switches[i][1][1]].door_obj=_door;
}
