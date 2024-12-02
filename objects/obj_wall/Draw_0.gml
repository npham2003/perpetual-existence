/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();


if(!checked && position[1]!=0){
	
	if(position[1]==-1){
		var wall_top = instance_create_layer(x,y,"wall_top",obj_wall_top)
		wall_top.x_draw=x_draw
		wall_top.y_draw=y_draw-obj_grid_manager.tile_size/2
	}
	
	else if(obj_grid_manager.grid[position[0]][position[1]-1].wall){
		var wall_top = instance_create_layer(x,y,"wall_top",obj_wall_top)
		wall_top.x_draw=x_draw
		wall_top.y_draw=y_draw-obj_grid_manager.tile_size/2
		//draw_sprite_ext(spr_wall_top,0,x_draw,y_draw-obj_grid_manager.tile_size/2,1,1,0,draw_color,1)
	}
	checked=true
}