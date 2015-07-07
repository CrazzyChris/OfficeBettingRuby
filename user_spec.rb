require '.\user.rb'

RSpec.describe User do

  before :each do
    @users = []
    @user1 = User.new('test_user_1')
  end

  describe 'create' do

    it 'should assign user default password' do
      expect(@user1.password).to eq('Qwerty123')
    end

    it 'should not log user in' do
      expect(@user1.logged_in).to eq(false)
    end

    it 'should assign 0 points for user' do
      expect(@user1.points).to eq(0)
    end

    it 'should assing 0 exact scores for user' do
      expect(@user1.exact_scores).to eq(0)
    end

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

    it 'should show user points' do
      expect(@user1.printuserinfo('points')).to eq('test_user_1 has 0 points')
    end

    it 'should show how many exact scores user hit' do
      expect(@user1.printuserinfo('exact scores')).to eq('test_user_1 had hit 0 exact scores')
    end

    it 'should show how many exact scores and points user has if needed' do
      expect(@user1.printuserinfo('exact scores, points')).to eq('test_user_1 has 0 points and had hit 0 exact scores')
    end

    it 'should raise error when user chosen not supported option' do
      expect { @user1.printuserinfo('test') }.to raise_error('test option is not supported for printuserinfo method')
    end
  end

  describe 'placebet' do

  end

end
