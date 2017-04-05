use <BezierScad.scad>;
x = 25;
myc = [ [-x,-90],  [-x, x], [-2*x, x], [-3*x, x], [3*x, x], [3*x, x], [0, 0],  [0,-90],];


module reticule() {
  wstart = 2;
   l = len(myc)-1;
   for (i = [0:l]) {
        translate([myc[i][0], myc[i][1], -20]) 
          cube([wstart+3*i,wstart+3*i,wstart+3*i],center=true);

   }
}



BezWall( myc,  
              width = 5, height = 24, steps = 32, centered = true );
reticule();


