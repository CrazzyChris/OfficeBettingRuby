class User

#attr_reader
attr_accessor :username, :password, :logged_in

  def initialize(username)
    @username=username
    @points = 0
    @exact_scores = 0
    @logged_in = false
    @password = 'Qwerty123'
  end

  def log_in
    if logged_in
      raise 'User is already logged in'
    else
      @logged_in = true
    end
  end

  def log_out
    unless logged_in
      raise 'User is not logged in'
    else
      @logged_in = false
    end
  end

  def change_password(new_password)
    @password = new_password
  end

end
