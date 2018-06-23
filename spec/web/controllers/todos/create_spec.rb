RSpec.describe Web::Controllers::Todos::Create, type: :action do
  let(:action) { Web::Controllers::Todos::Create.new }
  let(:params) { Hash[todo: { title: 'New todo' }] }

  let(:user_repository) { UserRepository.new }
  let(:user) { user_repository.create({}) }

  let(:todo_repository) { TodoRepository.new }

  before do
    todo_repository.clear
    user
  end

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
