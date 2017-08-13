gem 'minitest'
require 'minitest/autorun'
require_relative 'pidgey'

class PidgeyTest < Minitest::Test
  # Test a single evolution with 1 pidgeys and 12 candies.
  # Since this leaves us with 1 candy, it only takes single loop
  def test_evolutions_1_12
    result = Pidgey.calc(1,12)["evolutions"]
    assert_equal 1, result
  end

  def test_pidgeys_1_12
    result = Pidgey.calc(1,12)["pidgeys"]
    assert_equal 0, result
  end

  def test_candy_1_12
    result = Pidgey.calc(1,12)["candy"]
    assert_equal 1, result
  end

  # Test with 2 pidgeys and 23 candies.
  # This will take two loops since initially we can only evolve 1 pidgey
  # We gain a candy from the evolution so it loops again. We're left with 1 candy.
  def test_evolutions_2_23
    result = Pidgey.calc(2,23)["evolutions"]
    assert_equal 2, result
  end

  def test_pidgeys_2_23
    result = Pidgey.calc(2,23)["pidgeys"]
    assert_equal 0, result
  end

  def test_candy_2_23
    result = Pidgey.calc(2,23)["candy"]
    assert_equal 1, result
  end

  # Test with a large enough number of evolutions to for a second loop
  def test_evolutions_15_144
    result = Pidgey.calc(15,144)["evolutions"]
    assert_equal 13, result
  end

  def test_pidgeys_15_144
    result = Pidgey.calc(15,144)["pidgeys"]
    assert_equal 2, result
  end

  def test_candy_15_144
    result = Pidgey.calc(15,144)["candy"]
    assert_equal 1, result
  end

  # Test with pigeottos and pidgeys being traded in for candy
  def test_evolutions_13_99
    result = Pidgey.calc(13,99,true)["evolutions"]
    assert_equal 10, result
  end

  def test_pidgeys_13_99
    result = Pidgey.calc(13,99,true)["pidgeys"]
    assert_equal 0, result
  end

  def test_candy_13_99
    result = Pidgey.calc(13,99,true)["candy"]
    assert_equal 2, result
  end

  # Test with a larger number of pidgeys and aggressive trading turned OFF
  def test_evolutions_16_120_no_trade
    result = Pidgey.calc(16,120,false)["evolutions"]
    assert_equal 10, result
  end

  def test_pidgeys_16_120_no_trade
    result = Pidgey.calc(16,120,false)["pidgeys"]
    assert_equal 6, result
  end

  def test_candy_16_120_no_trade
    result = Pidgey.calc(16,120,false)["candy"]
    assert_equal 10, result
  end
  # Test with a larger number of pidgeys and aggressive trading turnd ON
  def test_evolutions_16_120
    result = Pidgey.calc(16,120,true)["evolutions"]
    assert_equal 12, result
  end

  def test_pidgeys_16_120
    result = Pidgey.calc(16,120,true)["pidgeys"]
    assert_equal 2, result
  end

  def test_candy_16_120
    result = Pidgey.calc(16,120,true)["candy"]
    assert_equal 2, result
  end


end
