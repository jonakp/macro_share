require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: 'Test', email: 'test@me.com', password: 'testtest')
  end

  it 'is valid with a name, email, password' do
    expect(@user).to be_valid
  end
end
