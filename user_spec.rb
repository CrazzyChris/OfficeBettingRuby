require '.\user.rb'

RSpec.describe User do

  before :each do
    @users = []
    @user1 = User.new('test_user_1')
    @user2 = User.new('test_user_2')
  end

  describe 'create' do
  end

  describe 'log_in' do

    it 'should log user in if he is not' do
      @user1.log_in
      expect(@user1.logged_in).to eq(true)
    end

    it 'should inform that user is already logged in' do
      @user1.logged_in = true
      expect { @user1.log_in }.to raise_error('User is already logged in')
    end
  end

  describe 'log_out' do

    it 'should log user out if he is logged in' do
      @user1.logged_in = true
      @user1.log_out
      expect(@user1.logged_in).to eq(false)
    end

    it 'should inform that user is not already logged on' do
      @user1.logged_in = false
      expect { @user1.log_out }.to raise_error('User is not logged in')
    end

  end

  describe 'change_password' do

    it 'should change password for the first time' do
      @user1.change_password('test_pass')
      expect(@user1.password).to eq('test_pass')
    end

  end

  describe 'printuserinfo' do
  end

  describe 'placebet' do
  end

end
