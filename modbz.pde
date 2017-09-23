float [][][] a;
float [][][] b;
float [][][] c;

float c_a = random(1);
float c_b = random(1);
float c_c = random(1);

int r = 0, q = 1;

void setup()
{

  size(1920, 1080, OPENGL);
  colorMode(RGB, 1.0, 1.0, 1.0);
  frameRate(60);
  a = new float [width][height][2];
  b = new float [width][height][2];
  c = new float [width][height][2];
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      a[x][y][r] = random(0, (1));
      b[x][y][r] = random(0, (1));
      c[x][y][r] = random(0, (1));
    }
  }
}
void draw()
{      


  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {

      for (int i = x - 1; i <= x+1; i++) {
        for (int j = y - 1; j <= y+1; j++) {
          c_a += a[(i+width)%width][(j+height)%height][r];
          c_b += b[(i+width)%width][(j+height)%height][r];
          c_c += c[(i+width)%width][(j+height)%height][r];
        }
      }
      c_a /= 9;
      c_b /= 9;
      c_c /= 9;

      a[x][y][q] = constrain((c_a) + (c_a) * (c_b  - c_c), 0, (c_c));
      b[x][y][q] = constrain((c_b) + (c_b) * (c_c  - c_a), 0, (c_a));
      c[x][y][q] = constrain((c_c) + (c_c) * (c_a  - c_b), 0, (c_b));

      set(x, y, color(a[x][y][q], b[x][y][q], c[x][y][q]));

      ;
    }
  }
  if (r == 0) {
    r = 1;
    q = 0;
  } else {
    r = 0; 
    q = 1;
  }
  println(frameCount);
  saveFrame("movie/######.png");
  if (frameCount%600 == 0) {
    setup();
  }
}