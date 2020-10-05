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

  def run(trials)
    @results = first(trials)
    average
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

end
