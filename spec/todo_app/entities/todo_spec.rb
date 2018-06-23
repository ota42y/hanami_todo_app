RSpec.describe Todo, type: :entity do
  it 'correct create with title' do
    todo_title = 'abcdefg'

    user = User.new
    todo = Todo.new(user: user, title: todo_title)
    expect(todo.title).to eq todo_title
  end
end
