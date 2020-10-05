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

end
