require 'features_helper'

RSpec.describe 'delete todo' do
  context 'when there are todo' do
    let(:user_repository) { UserRepository.new }
    let(:user) { user_repository.create({}) }

    let(:todo_repository) { TodoRepository.new }
    let(:todo) { todo_repository.create(user_id: user.id, title: 'todo_1') }

    before do
      user_repository.clear
      todo_repository.clear

      user
      todo
    end

    it do
      visit '/'

      within 'form#todo-form' do
        click_button 'Delete'
      end

      expect(todo_repository.find(todo.id)).to eq nil
    end
  end
end
