PVector vector = new PVector(1, 2);
float[][] transformingMatrix = {{1, 0}, {1, 1}};


float[][] matrix = {{1,0},{0, 1}};  // matrix for animation
float[] animationCon = {0, 0, 0, 0}; // storing animation controls
int animationSteps = 100;  // length of animation

PVector vectorAfterMatrix;

float scalar = 60;  // size of squares
 
int lineLength = 15; // length of lines

int animationCurStep = 0; // loop variable


void setup() {
  size(960, 960);
  
  //------------------------------------------------------------------------------ setup animation
  
  animationCon[0] = (matrix[0][0] - transformingMatrix[0][0]) / animationSteps * -1;
  animationCon[1] = (matrix[0][1] - transformingMatrix[0][1]) / animationSteps * -1;
  animationCon[2] = (matrix[1][0] - transformingMatrix[1][0]) / animationSteps * -1;
  animationCon[3] = (matrix[1][1] - transformingMatrix[1][1]) / animationSteps * -1;
}



void draw() {
 background(0);
 translate(height/2, width/2);
 
 
 
 //------------------------------------------------------------------------------ animation
 
 if (animationCurStep < animationSteps) {
   matrix[0][0] += animationCon[0];
   matrix[0][1] += animationCon[1];
   matrix[1][0] += animationCon[2];
   matrix[1][1] += animationCon[3];
   
   animationCurStep++;
   
   vectorAfterMatrix = new PVector(matrix[0][0] * vector.x + matrix[1][0] * vector.y, matrix[0][1] * vector.x + matrix[1][1] * vector.y);
 }
 
 //------------------------------------------------------------------------------ change y axis
   matrix[1][1] *= -1;
   matrix[0][1] *= -1;
   vector.y *= -1;
  
   vectorAfterMatrix.y *= -1;
 
 //--------------------------------------------------------------------------------- draw lines in background
 stroke(100);
 strokeWeight(1);
 for (int i = -height / 2; i <= height/2; i += scalar) {
   line(-width/2, i, width/2, i);
 }
 for (int i = -width / 2; i <= width/2; i += scalar) {
   line(i, -height/2, i, height/2);
 }
 
 //------------------------------------------------------------------------------- draw new lines in background
 
 stroke(0, 0, 200);
 strokeWeight(1);
 
 for(float i = -lineLength, xOffset = -matrix[0][0] * scalar * lineLength, yOffset = -matrix[0][1] * scalar * lineLength; i <= lineLength; i++, xOffset += matrix[0][0] * scalar, yOffset += matrix[0][1] * scalar) {
   line(matrix[1][0] * scalar * lineLength + xOffset, matrix[1][1] * scalar * lineLength + yOffset, matrix[1][0] * scalar * -1 * lineLength + xOffset, matrix[1][1] * scalar * -1 * lineLength + yOffset);
 }
 
 for(float i = -lineLength, xOffset = -matrix[1][0] * scalar * lineLength, yOffset = -matrix[1][1] * scalar * lineLength; i <= lineLength; i++, xOffset += matrix[1][0] * scalar, yOffset += matrix[1][1] * scalar) {
   line(matrix[0][0] * scalar * lineLength + xOffset, matrix[0][1] * scalar * lineLength + yOffset, matrix[0][0] * scalar * -1 * lineLength + xOffset, matrix[0][1] * scalar * -1 * lineLength + yOffset);
 }
 
 //------------------------------------------------------------------------------- draw x and y lines
 
 strokeWeight(2);
 stroke(255);
 
 line(0, height/2, 0, -height/2);
 
 line(width/2, 0, -width/2, 0);
 
 //-------------------------------------------------------------------------------- draw i hat and j hat
 
 stroke(0, 255, 0);
 strokeWeight(3);
 line(0, 0, matrix[0][0] * scalar, matrix[0][1] * scalar);
 
 stroke(255, 0, 0);
 line(0, 0, matrix[1][0] * scalar, matrix[1][1] * scalar);
 
 //------------------------------------------------------------------------------ draw vector
 
 stroke(0, 0, 255);
 strokeWeight(3);
 line(0, 0, vectorAfterMatrix.x * scalar, vectorAfterMatrix.y * scalar);
 
 //------------------------------------------------------------------------------change y axis back
 
  matrix[1][1] *= -1;
  matrix[0][1] *= -1;
  vector.y *= -1;
  
  vectorAfterMatrix.y *= -1;
 
}
