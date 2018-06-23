require_relative '../../../spec_helper'

describe Web::Views::Home::Index do
  let(:exposures) { Hash[todos: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/home/index.html.erb') }
  let(:view)      { Web::Views::Home::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  let(:placeholder_message) { '<p class="placeholder">There are no todos yet.</p>' }

  it 'exposes #todo' do
    expect(view.todos).to eq exposures.fetch(:todos)
  end

  describe 'when there are no todo' do
    it 'shows a placeholder message' do
      expect(rendered).to include(placeholder_message)
    end
  end

  describe 'when there are todos' do
    let(:user) { UserRepository.new.create({})}
    let(:todo_repository) { TodoRepository.new }
    let(:todo1) { todo_repository.create(user_id: user.id, title: 'todo_1')}
    let(:todo2) { todo_repository.create(user_id: user.id, title: 'todo_2')}
    let(:exposures) { Hash[todos: [todo1, todo2]] }

    before do
      UserRepository.new.clear
      TodoRepository.new.clear
    end

    it 'lists them all' do
      expect(rendered.scan(/class="todo"/).count).to eq 2
      expect(rendered).to include('todo_1')
      expect(rendered).to include('todo_2')
    end

    it 'hides the placeholder message' do
      expect(rendered).not_to include(placeholder_message)
    end
  end
end
