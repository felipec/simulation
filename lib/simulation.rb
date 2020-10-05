class Simulation

  include Enumerable

  attr_reader :results

  def initialize(&block)
    @block = block
    @results = []
  end

  def each
    (0...).each do |n|
      yield to_f(@block.call(n))
    end
  end

  def run(trials = nil)
    dynamic_run unless trials
    static_run(trials)
  end

  def average
    @results.instance_eval { sum.to_f / size }
  end

  private

  def to_f(v)
    return 1.0 if v === true
    return 0.0 if v === false
    v.to_f
  end

  def static_run(trials)
    @results = first(trials)
    average
  end

  def dynamic_run
    avg = 0.0
    each_with_index do |r, n|
      avg = (avg * n + r) / (n + 1)
      print "%0.08f (%i)\r" % [avg, n]
    end
  end

end
