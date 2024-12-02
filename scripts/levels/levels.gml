// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


global.levels = {
	test: {
		size: [10, 10],
		player: [0,0],
		wall: [[2,2], [2,3], [3,3]],
		warp: [[[4,5], [3,0]]],
		box_stasis: [[1,1], [6, 7]],
		box_normal: [[5,6]],
		hole:[[5,5]],
		switches: [[[6,6], [7,7]]]
	},
	
	mockup: {
		size: [7, 6],
		player: [0,5],
		wall: [[1,0], [1,1], [1,2], [2,2], [2,3], [2,5], [3,2], [3,1], [3,0], [4,2], [5,2], [6,2]],
		warp: [[[0,0], [4,0]]],
		box_stasis: [[1,4]],
		box_normal: [],
		hole:[[2,4]],
		switches: [[[6,4], [0,2]]],
		stairs: [6,0]
	},
	
	seafloor_cavern: {
		size: [5, 7],
		player: [2,6],
		wall: [],
		warp: [],
		box_stasis: [[0,1], [1,1], [3,1], [4,1], [1,2], [2,2], [3,2], [0,3], [4,3], [1,4], [2,4], [3,4]],
		box_normal: [],
		hole:[],
		switches: [],
		stairs: [2,0]
	},
	
	push_tutorial: {
		size: [5,3],
		player: [0,1],
		wall: [],
		warp: [],
		box_stasis: [[3,0], [3,1], [3,2]],
		box_normal: [],
		hole:[],
		switches: [],
		stairs: [4,1]
		
	},
	
	switch_room: {
		size: [7,7],
		player: [2,3],
		wall: [[4,0], [4,1], [4,2], [4,4], [4,5], [4,6]],
		warp: [],
		box_stasis: [[1,3], [3,3], [2,2], [2,4]],
		box_normal: [],
		hole:[],
		switches: [[[2,3], [4,3]]],
		stairs: [6,3]
	},
	
	warp_snake: {
		size: [7,5],
		player: [3,0],
		wall: [[0,1], [0,2], [0,3], [1,1], [1,2], [1,3], [3,1], [3,2], [3,3], [4,1], [5,1], [6,1]],
		//wall: [[6,1], [5,1], [4,1], [3,3], [3,2], [3,1], [1,3], [1,2], [1,1], [0,3], [0,2], [0,1]],
		warp: [[[4,0], [0,4]]],
		box_stasis: [[1,4]],
		box_normal: [],
		hole:[[3,4]],
		switches: [],
		stairs: [6,0]
	},
	
	
	
}


global.warp_colors = [c_fuchsia, c_green];

global.switch_colors = [c_yellow];