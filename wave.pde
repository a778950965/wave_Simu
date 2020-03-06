int col, row;
int scal = 20;
int w = 1200;
int h = 900;

float angle = radians(60);
float rate = 0;

void setup() {
  size(640, 640, P3D);
  col = w /scal;
  row = h /scal;
  stroke(255);
  fill(0);
  frameRate(30);
}

void draw() {
  background(0);
  float xoff = 0;
  float yoff = rate += 0.1;
  float[][] terrain = new float[col][row+1];

  for (int i = 0; i < row+1; i++) {
    xoff = 0;
    for (int j = 0; j < col; j++) {
      xoff += 0.1;
      terrain[j][i] = map(noise(xoff, yoff), 0, 1, -100, 200);
    }
    yoff += 0.1;
  }

  translate(width/2, height/2);
  rotateX(angle);
  translate(-w/2, -h/2);
  for (int i = 0; i < row; i++) {
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < col; j++) {
      vertex(j*scal, i*scal, terrain[j][i]*sin( map(j, 0, col, 0, 2*PI)  + map(frameCount%60, 0, 60, 0, TWO_PI)));
      vertex(j*scal, (i+1)*scal, terrain[j][i+1]*sin( map(j, 0, col, 0, 2*PI)  + map(frameCount%60, 0, 60, 0, TWO_PI)));
    }
    endShape();
  }
}
