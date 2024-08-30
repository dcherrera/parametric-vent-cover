//hole();
mesh();
tube();
//square_mesh();



//size of pipe in mm must be divisable by 4
size=90;
//find the amount of mesh holes to make
wh=size/4+1;

module hole(){
difference(){
linear_extrude(1)square(4,4);
    translate([1,1,0])linear_extrude(1)square(2,2);
}
}
module holemaker(){
    difference(){
linear_extrude(1)square(size+4,size+4);
translate([size/2,size/2,0])linear_extrude(1)circle(d=size,$fn=360);
    }}
module square_mesh(){
for (x=[0:wh-1],y=[0:wh-1]) {
translate([4*x,4*y,0])hole();
}
}

module mesh(){
    difference(){
    square_mesh();
    holemaker();
    }
}


module tube(){
    difference(){
translate([size/2,size/2,0])linear_extrude(20)circle(d=size+3, $fn=360);
translate([size/2,size/2,0])linear_extrude(20)circle(d=size, $fn=360);

    }
}