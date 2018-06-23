require 'features_helper'

RSpec.describe 'Visit home' do
  it 'is successful' do
    visit '/'

    expect(page.body).to include('Todo App')
  end

  context 'when there are todo' do
    let(:user_repository) { UserRepository.new }
    let(:user) { user_repository.create({}) }

    let(:todo_repository) { TodoRepository.new }

    before do
      todo_repository.clear

      todo_repository.create(user_id: user.id, title: 'todo_1')
      todo_repository.create(user_id: user.id, title: 'todo_2')
    end

    it do
      visit '/'

      expect(page).to have_css('.todo', count: 2), 'Expected to find 2 todos'
    end
  end
end
