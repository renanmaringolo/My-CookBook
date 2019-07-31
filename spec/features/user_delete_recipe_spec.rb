require 'rails_helper'  

feature 'User delete recipe' do 
    scenario 'sucessfuly' do  

    user = login 
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                           user: user)


    visit root_path
    click_on 'Bolo de cenoura'
    click_on 'Excluir'
    visit root_path

    expect(page).not_to have_content(recipe.title)

    end
end