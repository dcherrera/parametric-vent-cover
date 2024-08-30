mesh();
tube();

//All you need to do is change the size variable bellow and render. i sugest rounding up. IE if the pipe is 89.56mm,
//Round the size up to 90. you dont have to but if your printers not tuned correctly you will very quickly experince it. ;)
//size of pipe in MM
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
