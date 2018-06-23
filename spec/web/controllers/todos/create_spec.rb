RSpec.describe Web::Controllers::Todos::Create, type: :action do
  let(:action) { Web::Controllers::Todos::Create.new }

  let(:user_repository) { UserRepository.new }
  let(:user) { user_repository.create({}) }

  let(:todo_repository) { TodoRepository.new }

  before do
    todo_repository.clear
    user
  end

  describe 'with valid params' do
    let(:params) { Hash[todo: { title: 'New todo' }] }

    it 'creates a new todo' do
      action.call(params)
      todo = todo_repository.last

      expect(todo.id).not_to eq nil
      expect(todo.title).to eq params.dig(:todo, :title)
    end

    it 'redirects the user to home' do
      response = action.call(params)

      expect(response[0]).to eq 302
      expect(response[1]['Location']).to eq '/'
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[todo: {}] }

    it 'returns HTTP client error' do
      response = action.call(params)

      expect(response[0]).to eq 422
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      expect(errors.dig(:todo, :title)).to eq ['is missing']
    end
  end
end
