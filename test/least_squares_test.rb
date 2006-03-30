#!/usr/bin/env ruby

require 'test/unit'
require 'rsl'
require 'matrix'
require 'mathn'

class LinearFitTest < Test::Unit::TestCase

  def test_fit
    a, b = Rsl.least_squares_fit([1, 2, 3], [10, 11, 12 ])
    assert_equal(sprintf("%.2f", a), "9.00")
    assert_equal(sprintf("%.2f", b), "1.00")

    a, b = Rsl.least_squares_fit([1, 2, 3], [10, 10.5, 12 ])
    assert_equal(sprintf("%.2f", a), "8.83")
    assert_equal(sprintf("%.2f", b), "1.00")

    a, b = Rsl.least_squares_fit([1, 2, 3, 8, 11, 22], [10, 10.5, 12, 12.55, 13.55, 15.01 ])
    assert_equal(sprintf("%.2f", a), "10.53")
    assert_equal(sprintf("%.2f", b), "0.22")

    # Some simple boundaries, zeros and negative inputs 

    a, b = Rsl.least_squares_fit([1, 0, 3, 8, 11, 22], [10, 10.5, 12, 12.55, 13.55, 15.01 ])
    assert_equal(sprintf("%.2f", a), "10.65")
    assert_equal(sprintf("%.2f", b), "0.22")

    a, b = Rsl.least_squares_fit([1, 8, 3, 8, 11, 22], [10, 0, 12, 12.55, 13.55, 15.01 ])
    assert_equal(sprintf("%.2f", a), "8.33")
    assert_equal(sprintf("%.2f", b), "0.25")

    a, b = Rsl.least_squares_fit([-100, 8, 3, 8, 11, 22], [10, 0, -12, 12.55, 13.55, 15.01 ])
    assert_equal(sprintf("%.2f", a), "6.41")
    assert_equal(sprintf("%.2f", b), "-0.01")
  end

  def test_nil_vector
    assert_raise(RuntimeError) { a, b = Rsl.least_squares_fit(nil, nil) }
  end

  def test_nil_member
    assert_raise(RuntimeError) { a, b = Rsl.least_squares_fit([nil, 1, 2, 3], [2, 3, 4, 5]) }
  end

  def test_wrong_length
    assert_raise(RuntimeError) { a, b = Rsl.least_squares_fit([9, 1, 2, 3], [2, 3, 4, 5, 5]) }
  end

  def test_too_short
    assert_raise(RuntimeError) { a, b = Rsl.least_squares_fit([9], [2]) }
    assert_raise(RuntimeError) { a, b = Rsl.least_squares_fit([nil], [nil]) }
    assert_raise(RuntimeError) { a, b = Rsl.least_squares_fit([2,2], [3,3]) }
  end

  def test_vectors
    x = Vector[1, 2, 3]
    y = Vector[10, 11, 12]
    a, b = Rsl.least_squares_fit(x, y)
    assert_equal(sprintf("%.2f", a), "9.00")
    assert_equal(sprintf("%.2f", b), "1.00")
  end
end
