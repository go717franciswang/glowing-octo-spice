// set size of canvas
size(600, 400);

// set background color
background(#5F348B);

// no anti-aliasing
noSmooth();

// anti-aliasing
smooth();

// draw a point at [100 100] with thickness = 5 and some color
stroke(#BBE836);
strokeWeight(5);
point(100, 100);

// draw a line from [100 300] to [500 100]
strokeWeight(3);
line(100, 300, 500, 100);

// draw an ellipse with the same color as the line
fill(#BBE836);
ellipse(500, 300, 100, 100);

// draw an arc starting at 3.14 radian to 6.28 radian without fill
noFill();
arc(400, 300, 100, 100, 3.14, 6.28);

// draw 4 rectangles
rect(100, 200, 50, 50);
rect(200, 200, 50, 50);
rect(300, 200, 50, 50);
rect(400, 200, 50, 50);

// draw a quadragle by using all 4 vertices
quad(38, 31, 86, 20, 69, 63, 30, 76);

// draw a triangle by using all 3 vertices
triangle(150, 195, 178, 140, 206, 195);

// draw a polygon
beginShape();
vertex(230, 220);
vertex(285, 220);
vertex(385, 240);
vertex(285, 275);
vertex(230, 275);
endShape();
