class Recorder
  def play_for(obj)
    @record.messages.inject(obj) do |result, message|
      result.send message.first, *message.last
    end
  end

  def record
    @record ||= MessageCollector.new
  end

  def to_s
    @record.messages.inject([]) do |result, message|
      result << "#{message.first}(args: #{message.last.inspect})"
    end.join('.')
  end
end
