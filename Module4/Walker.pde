public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float scale;
  public float velocityLimit = 10;
  
  color walkerColor;
  
  public Walker()
  {
    position = new PVector();
  }
  
  public Walker(PVector position)
  {
    this.position = position; 
  }
  
  public void update()
  {
    PVector mouse = mousePos();
    PVector direction = PVector.sub(mouse, this.position);
 
    this.acceleration.mult(0.2);
      
    this.velocity.add(acceleration);
    this.velocity.limit(velocityLimit);
    
    direction.normalize();
    this.acceleration.add(direction);
      
    this.position.add(velocity);
  }
  
  void setGaussianPosition()
  {
    float x = (Window.widthPx / 4) * randomGaussian();
    float y = (Window.heightPx / 4) * randomGaussian();
    position = new PVector(x, y);
  }
  
  void setRandomColor()
  {
    walkerColor = color(random(256), random(256), random(256));
  }
  
  void setRandomScale()
  {
    scale = random(51);
  }
  
  public void render()
  {
    noStroke();
    fill(walkerColor);
    circle(position.x, position.y, scale);
  }
  
  PVector mousePos()
  {
    float x = mouseX - Window.windowWidth;
    float y = -(mouseY - Window.windowHeight);
  
    return new PVector(x, y);
  }
}
