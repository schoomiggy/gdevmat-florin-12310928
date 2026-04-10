public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public PVector direction = new PVector();

  public float scale;
  public float velocityLimit = 5;

  public color walkerColor;

  Walker()
  {
    position = new PVector();
  }

  Walker(PVector position)
  {
    this.position = position;
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
    scale = random(5, 40);
  }

  void move(PVector direction)
  {
    this.velocity.add(acceleration);
    this.velocity.limit(velocityLimit);
      
    direction.normalize();
    this.velocity.add(direction);
    this.position.add(velocity);
  }

  void render()
  {
    noStroke();
    fill(walkerColor);
    circle(position.x, position.y, scale);
  }
}
