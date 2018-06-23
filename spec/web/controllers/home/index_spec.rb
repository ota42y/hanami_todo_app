describe Web::Controllers::Home::Index do
  let(:action) { Web::Controllers::Home::Index.new }
  let(:params) { Hash[] }

  let(:user_repository) { UserRepository.new }
  let(:user) { user_repository.create({}) }

  let(:todo_repository) { TodoRepository.new }

  let(:book_1) { todo_repository.create(user_id: user.id, title: 'todo_1') }

  before do
    todo_repository.clear
    user_repository.clear

    book_1
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq  200
  end

  it 'exposes all books' do
    action.call(params)

    expect(action.exposures[:todos]).to eq [book_1]
  end
end