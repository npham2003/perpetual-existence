/// @description Insert description here
// You can write your code in this editor

grid_size=[10,10]

grid=[];


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
			warp: -1,
			hole: false,
			stairs: false,
        }
		show_debug_message(grid[i][j])
	}
}