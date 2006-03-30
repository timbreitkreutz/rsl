

module Rsl
  # Linear fit--least squares regression
  # Fits the data in xes and ys to Y = b + a X
  # returns (a, b)
  def Rsl.least_squares_fit( xes, ys )
    raise "input vectors must not be nil" if xes == nil || ys == nil
    raise "input vectors must be larger" if xes.size < 3 || ys.size < 3
    raise "input vectors must be of equal size" if xes.size != ys.size

    run_x = 0.0
    run_y = 0.0

    count = 1.0

    xes.to_a.each { |x| 
      raise "X vector contains a nil" if x == nil
      run_x += ( x - run_x ) / count 
      count += 1.0 
    }
    count = 1.0
    ys.to_a.each { |y| 
      raise "Y vector contains a nil" if y == nil
      run_y += ( ( y ) - run_y ) / count
      count += 1.0 
    }

    dx2, dxdy = 0.0, 0.0

    (1..xes.size).each do |count|
      dx = xes[count-1] - run_x
      dy = ( ys[count-1] ) - run_y
      dx2 += ( dx * dx - dx2 ) / count.to_f
      dxdy += ( dx * dy - dxdy ) / count.to_f
    end
  
    b = dxdy / dx2 if dx2 != 0.0
    a = run_y - run_x * b
   
    return a, b
  end
end
