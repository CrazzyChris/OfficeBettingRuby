class User

#attr_reader
attr_accessor :username, :password, :logged_in, :points, :exact_scores

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

  def printuserinfo(option)
    user_info = case option
    when 'points' then "#{@username} has #{@points} points"
    when 'exact scores' then "#{@username} had hit #{@exact_scores} exact scores"
    when 'exact scores, points' then "#{@username} has #{@points} points and had hit #{@exact_scores} exact scores"
    else raise "#{option} option is not supported for printuserinfo method"
    end
  end

end
