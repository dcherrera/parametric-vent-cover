//Parametric Vent Cover
//Designed by David Herrera
//If you find anything I produce useful. Consider sending some love.
//venmo @davidherrera55
//shib 0xA7315166a9ccC2682e8c25D66EA7c5e3d7563c40
//eth 0xA7315166a9ccC2682e8c25D66EA7c5e3d7563c40
//btc bc1qvaehlavm6w3tygf8rfmkea9keumv3mzt4y8and


mesh();
tube();

//All you need to do is change the size variable bellow and render. I suggest rounding up. IE if the pipe is 89.56mm,
//Round the size up to 90. you dont have to but if your printers not tuned correctly you will very quickly experince it. ;)
//size of pipe in MM
size=90;
//find the amount of mesh holes to make
wh=size/4+1;
//hole module is literaly just making a 4mm square and removing the center of it. for the mesh.
module hole(){
difference(){linear_extrude(1)square(4,4);
            translate([1,1,0])linear_extrude(1)square(2,2);}}
//holemaker makes a circle that can be used to cut a circle in the mesh that is made from the hole module.
module holemaker(){
difference(){linear_extrude(1)square(size+4,size+4);
            translate([size/2,size/2,0])linear_extrude(1)circle(d=size,$fn=360);}}
//square_mesh is as it sounds. use a for loop starting at zero and using wh variable to set the range, it makes a square mesh out of the hole module 
module square_mesh(){for (x=[0:wh-1],y=[0:wh-1]) {translate([4*x,4*y,0])hole();}}
//mesh is the final round circle mesh cut out of the square_mesh module.
module mesh(){difference(){square_mesh();
                           holemaker();}}
//tube is to make the cylandar that will have an inner diameter equal to the outer diameter of your pipe which is the size variable. the od is only 3mm greater than the id.
module tube(){difference(){
translate([size/2,size/2,0])linear_extrude(20)circle(d=size+3, $fn=360);
translate([size/2,size/2,0])linear_extrude(20)circle(d=size, $fn=360);}}
