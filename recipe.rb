def recipe(name)

  def method(&block)
    if block_given? 
      yield
    else
      return super
    end
  end

  yield
  $recipes << { name: name, ingredients: $ingredients,  method_steps: $method_steps }
  $ingredients = []
  $method_steps = []
end

def ingredient(text)
  $ingredients << text
end

def step(text)
  $method_steps << text
end

class Recipe
  attr_accessor :name
  attr_accessor :ingredients
  attr_accessor :method_steps

  def initialize(recipe)
    @name = recipe[:name]
    @ingredients = recipe[:ingredients]
    @method_steps = recipe[:method_steps]
  end

  def self.for(name)
    recipe = $recipes.find{ |r| r[:name] == name }
    self.new(recipe)
  end

  def self.clear
    $recipes = []
    $ingredients = []
    $method_steps = []
  end

  def self.describe
    yield
  end
end