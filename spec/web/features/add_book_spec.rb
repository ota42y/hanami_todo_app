require 'features_helper'

describe 'Add a todo' do
  after do
    UserRepository.new.clear
    TodoRepository.new.clear
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
end
