/// @description Insert description here
// You can write your code in this editor

grid_size=[10,10]

grid=[];

level="test"

grid_start=[50,50]
tile_size=64


function gridTile(_gridX, _gridY, _wall = false, _box = false, _warp = -1, _hole = false, _stairs = false) constructor{
	gridX =_gridX;
	gridY =_gridY;
	wall =_wall;
	box =_box;
	warp = _warp;
	hole = _hole;
	stairs = _stairs;
	
}

for (i=0;i<grid_size[0];i++){
	for(j=0;j<grid_size[1];j++){
		grid[i][j]= {
            wall: false,
			box: false,
			box_obj: pointer_null,
			warp: -1,
			hole: false,
			stairs: false,
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
	_box.position=global.levels[$level].box[i];
	_box.x_draw=grid_start[0]+tile_size*_box.position[0];
	_box.y_draw=grid_start[1]+tile_size*_box.position[1];
	grid[global.levels[$level].box[i][0]][global.levels[$level].box[i][1]].box_obj = _box;
}