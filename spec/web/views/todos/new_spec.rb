RSpec.describe Web::Views::Todos::New, type: :view do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/todos/new.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end

  context 'when error' do
    let(:params) { OpenStruct.new(valid?: false, error_messages: ['Title must be filled']) }
    let(:exposures) { Hash[params: params] }

    it 'displays list of errors when params contains errors' do
      expect(rendered).to include('There was a problem with your submission')
      expect(rendered).to include('Title must be filled')
    end
  end
end
