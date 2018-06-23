require 'features_helper'

describe 'Add a todo' do
  after do
    UserRepository.new.clear
    TodoRepository.new.clear

    UserRepository.new.create({})
  end

  it 'can create a new todo' do
    visit '/todos/new'

    within 'form#todo-form' do
      fill_in 'Title',  with: 'New Todo'

      click_button 'Create'
    end

    expect(current_path).to eq('/')
    expect(page).to have_content('New Todo')
  end

  it 'displays list of errors when params contains errors' do
    visit '/todos/new'

    within 'form#todo-form' do
      click_button 'Create'
    end

    expect(current_path).to eq('/todos')

    expect(page).to have_content('There was a problem with your submission')
    expect(page).to have_content('Title must be filled')
  end
end
