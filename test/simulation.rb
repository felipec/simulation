require 'test/unit'

require_relative '../lib/simulation'

class SimulationTests < Test::Unit::TestCase

  def test_once
    v = Simulation.new { 1 }.first
    assert_equal(1.0, v)
  end

  def test_basic
    v = Simulation.new { 1 }.run(10)
    assert_equal(1.0, v)
  end

  def test_odd
    v = Simulation.new { |n| n.odd? }.run(10)
    assert_equal(0.5, v)
  end

  def test_quantiles
    s = Simulation.new { |n| n / 10.0 }
    s.run(11)
    probs = [0.05, 0.25, 0.50, 0.75, 0.95]
    q = s.quantiles(probs)
    [probs, q].transpose.each do |e|
      assert_in_delta(*e)
    end
  end

end
