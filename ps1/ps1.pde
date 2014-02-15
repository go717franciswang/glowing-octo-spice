// This is an attempt to recreate the sample image.
// It is greyscaled because the artist cannot tell the sample image's color.

size(700, 400);
background(#BBBFB1);
smooth();

for (int i = 0; i < 10; i = i+1) {
  if (i % 2 == 0) {
    fill(0);
  } else {
    fill(#FFFFFF);
  }
  
  rect(100+i*10, 100+i*10, 200-i*20, 200-i*20);
  ellipse(500+i*10, 200+i*10, 200-i*20, 200-i*20);
}
