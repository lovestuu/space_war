require 'gosu'

class Screen < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Space War"

    @background_image = Gosu::Image.new("media/space.png", titlable: true)

    @player = Player.new
    @player.warp(295, 430)
  end

  def update
    if Gosu::button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @player.turn_left
    end
    if Gosu::button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @player.turn_right
    end
    @player.move
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0)
  end
end

class Player
  def initialize
    @image = Gosu::Image.new("media/starfighter.bmp")
    puts @image.height
    @x = @y = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @x > 0 ? @x -= 1 : @x = 0
  end

  def turn_right
    @x < 590 ? @x += 1 : @x = 590
  end

  def move
    @x %= 640
    @y %= 480
  end

  def draw
    @image.draw(@x, @y, 1)
  end
end
Screen.new.show