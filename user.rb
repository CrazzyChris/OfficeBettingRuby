class User

#attr_reader
attr_accessor :username, :password, :loggedin

  def initialize(username)
    @username=username
    @points = 0
    @exact_scores = 0
    @loggedin = false
    @password = 'Qwerty123'
  end

  def log_in
    @loggedin = true
  end

  def log_out
    @loggedin = false
  end

  def change_password(new_password)
    @password = new_password
  end

end
