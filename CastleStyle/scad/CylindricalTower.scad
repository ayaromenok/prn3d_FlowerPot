height = 100;
radius = 50;
tk_wall = 5;

num_of_grdb = 8;
radius_grdb = 15;
height_grdb = radius_grdb*3;
tk_grdb = 2;
offset_grdb_bottom = height/4;
offset_grdb_layer = height/4;

module garderobe(){
	difference(){
		cylinder(height_grdb,radius_grdb,radius_grdb);
		translate([0,0,tk_grdb])
			cylinder(height_grdb,radius_grdb-tk_grdb,radius_grdb-tk_grdb);
		translate([-radius_grdb,-radius_grdb,0])
			cube([radius_grdb*2,radius_grdb,height_grdb]);
	}
}
 
difference(){
cylinder(height, radius, radius, $fn=4*radius);
translate([0,0,3])
	cylinder(height, radius-tk_wall, radius-tk_wall, $fn=4*radius);
}

for (angle=[0:(360/num_of_grdb):180]){
	rnd = rands(0,offset_grdb_layer,1)[0];
	translate([sin(angle)*(radius-tk_wall), cos(angle)*(radius-tk_wall), offset_grdb_bottom+rnd])
		rotate([-10,0,-angle])
			garderobe();
}//for angle
