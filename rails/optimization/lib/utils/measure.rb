class Measure
  class << self
    def run(gc: :enable, &block)
      case gc
      when :enable
        # collect memory allocated during library loading
        # and our own code before the measurement
        GC.start
      when :disable
        GC.disable
      end

      memory_before  = `ps -o rss= -p #{Process.pid}`.to_i / 1024
      gc_stat_before = GC.stat

      time = Benchmark.realtime(&block)

      gc_stat_after = GC.stat

      GC.start if gc == :enable

      memory_after = `ps -o rss= -p #{Process.pid}`.to_i / 1024
      gc_count     = gc_stat_after[:count] - gc_stat_before[:count]
      memory       = memory_after - memory_before
      time         = time.round(2)

      result = {
        ruby_version: RUBY_VERSION,
        gc: gc,
        time: time,
        gc_count: gc_count,
        memory: format('%d MB', memory)
      }

      Rails.logger.info result.to_json
    end
  end
end
