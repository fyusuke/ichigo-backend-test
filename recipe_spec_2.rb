#coding utf-8

require 'bundler/setup'
Bundler.require

require_relative 'recipe_2'

describe Recipe do
  before do
    # pancake_recipe attributes set
    pancake_recipe.send(:ingredient, 'Store-bought pancake mix')
    pancake_recipe.send(:ingredient, 'Water')
    pancake_recipe.send(:step, 'Mix the ingredients')
    pancake_recipe.send(:step, 'Cook them in a pan')

    # soup_recipe attributes set
    soup_recipe.send(:ingredient, 'Tofu')
    soup_recipe.send(:ingredient, 'White miso paste')
    soup_recipe.send(:step, 'Mix miso paste into boiling water')
    soup_recipe.send(:step, 'Add tofu and serve')
  end

  # pancake_recipe instance
  let(:pancake_recipe) { Recipe.for('Pancake') }

  # soup_recipe instance
  let(:soup_recipe) { Recipe.for('Miso Soup') }

  it 'records the ingredients and method of each recipe' do
    # pancake_recipe test
    expect(pancake_recipe.name).to eq 'Pancake'
    expect(pancake_recipe.ingredients).to eq ['Store-bought pancake mix', 'Water']
    expect(pancake_recipe.method_steps).to eq ['Mix the ingredients', 'Cook them in a pan']

    # soup_recipe test
    expect(soup_recipe.name).to eq 'Miso Soup'
    expect(soup_recipe.ingredients).to eq ['Tofu', 'White miso paste']
    expect(soup_recipe.method_steps).to eq ['Mix miso paste into boiling water', 'Add tofu and serve']
  end
end