require 'features_helper'

RSpec.describe 'Visit home' do
  it 'is successful' do
    visit '/'

    expect(page.body).to include('Todo App')
  end

  context 'when there are todo' do
    it do

      expect(page).to have_css('.todo', count: 2), 'Expected to find 2 todos'

    end
  end
end
