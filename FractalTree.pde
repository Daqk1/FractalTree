private double fractionLength = .85; 
private int smallestBranch = 10; 
private double branchAngle = .2;  

public void setup() 
{   
  size(1000,1000);    
  noLoop(); 
} 
public void draw() 
{   
  background(0);   
   stroke((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));   
  //stroke(#FFC0CB);
  line(500,680,500,800);   
  drawBranches(500,680,100 ,-PI/2);  //will add later 
} 
public void mousePressed(){
  redraw();
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
    double angle1 = angle + branchAngle +.3;
    double angle2 = angle - branchAngle -.3;
    branchLength*=fractionLength;
    int endX1 = (int)(branchLength*Math.cos(angle1) + x);
    int endY1 = (int)(branchLength*Math.sin(angle1) + y);
    int endX2 = (int)(branchLength*Math.cos(angle2) + x);
    int endY2 = (int)(branchLength*Math.sin(angle2) + y);
    line(x,y,endX1,endY1);
    line(x,y,endX2,endY2);
    if(branchLength >= smallestBranch){
       drawBranches(endX1,endY1,branchLength, angle1);
       drawBranches(endX2,endY2,branchLength, angle2);
  }
} 
