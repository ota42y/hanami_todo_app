RSpec.describe User, type: :entity do
  it 'can initialize' do
    user = User.new
    expect(user).not_to eq nil
  end
end
