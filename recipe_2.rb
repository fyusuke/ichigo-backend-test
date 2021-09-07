class Recipe
  attr_accessor :name
  attr_accessor :ingredients
  attr_accessor :method_steps

  def initialize(name = nil)
    @name = name
    @ingredients = []
    @method_steps = []
  end

  def self.for(name)
    self.new(name)
  end

  private
  def ingredient(text)
    @ingredients << text
  end

  def step(text)
    @method_steps << text
  end
end