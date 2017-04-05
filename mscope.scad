use <BezierScad.scad>;
x = 25;
myc = [ [-x,-90],  
              [-x, x], 
             [-2*x, x], 
             [-2*x, x], 
              [3*x, x], 
              [3*x, x], 
              [0, -20], 
              [0,-120],
         //     [10,-100],
            ];


module reticule() {
  wstart = 2;
   l = len(myc)-1;
   for (i = [0:l]) {
        translate([myc[i][0], myc[i][1], -20]) 
          cube([wstart+3*i,wstart+3*i,wstart+3*i],center=true);

   }
}

module lens() {
  difference() {
      union() {
            BezWall( myc,  
              width = 6, height = 24, steps = 32, centered = true );
           translate([-x,-50,12]) cube([12,140,24],center=true);
           translate([2,12,12]) cube([72,14,24],center=true);
           translate([27.5,-4,12]) cube([8,34,24],center=true);
       }
           translate([-24,-110,12])
             rotate([0,90,0]) 
               cylinder(r=4,h=20,center=true, $fn=32);
           translate([-22,-110,12])
             rotate([0,90,0]) 
               sphere(r=5,center=true, $fn=32);
   }
}

lens();
//reticule();


