RSpec.describe Web::Controllers::Todos::Destroy, type: :action do
  let(:action) { described_class.new }

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

  describe 'with valid params' do
    let(:params) { Hash[todo: { id: todo.id }] }

    it 'destroy a todo' do
      action.call(params)
      expect(todo_repository.find(todo.id)).to eq nil
    end

    it 'redirects the user to home' do
      response = action.call(params)

      expect(response[0]).to eq 302
      expect(response[1]['Location']).to eq '/'
    end
  end
end
