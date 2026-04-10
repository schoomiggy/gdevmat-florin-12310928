public class Walker
{
  public PVector position;
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
 
  public color walkerColor;
  
  public float velocityLimit = 10;
  public float scale;
  
  public float mass;
  
  public Walker()
  {
    this.position = new PVector(-500, 200);
    this.mass = mass++;
    this.scale = this.mass * 15;
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); // A = F 
  }
  
  public void update()
  {
    this.velocity.add(this.acceleration); // velocity accumulation
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0); // resets acceleration every frame
  }
    
  void setRandomColor()
  {
    walkerColor = color(random(256), random(256), random(256));
  }
  
  public void render()
  {
    noStroke();
    fill(walkerColor);
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges()
  {
    if (this.position.y < Window.bottom)
    {
      this.velocity.y *= -1;
    }
    else if (this.position.y > Window.top)
    {
      this.velocity.y *= -1;
    }
    else if (this.position.x < Window.left)
    {
     this.velocity.x *= -1;
    }
    else if (this.position.x > Window.right)
    {
     this.velocity.x *= -1;
    }
  }
}
