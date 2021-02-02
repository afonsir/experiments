class Post
  attr_accessor :state

  def failure
    self.state = :failure
  end

  def error
    self.state = :error
  end
end
