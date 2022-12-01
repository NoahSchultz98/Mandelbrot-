module Fractals

import Base: show#, iterate

export FractalView, iterateFunction, leavingNumber, inMandelbrot

# has a max and min coplex number, and integers for dimensions 
```
This is a helpful comment
```
struct FractalView
    # min and max of fractals
    min::Complex
    max::Complex
    # width and height in pixels, (resolution?)
    width::Integer
    height::Integer
    #add test to make sure that width and height are positive in constructors
end

#iterate ( function, inital point, number of increments)
```
This is a helpful comment
```
function iterateFunction(f::Function, initial::Complex, i::Integer)
    
    v = zeros(Complex, i+1)
    
    v[1] = initial 
    
    for j in 2:(i+1)
        v[j] = f(inital)
        initial = v[j]
    end
    
    return v
    
end

#leavingNumber ( how many iterations until number is more than 2 -> goes to infinity )
# optional parameter = number of iterations to test
# optional paramter = initial point, default 0 + 0im
```
This is a helpful comment
```
function leavingNumber(i::Integer = 100, inital::Complex = 0 + 0im)
    
    f
    
    iterateFunction()
    
end

#inMandelbrot ( iterate number a ton, and if not more than 2, then it is bounded )
# by default iterate a 100 times
```
This is a helpful comment
```
function inMandelbrot(c::Complex, j::Integer = 100)
    #j = 100

    #for i in 1:j
       #if iterate(c) > 2
            #print( "Leaves the Mandelbrot set after ", i, " iterations" )
            #return false
        #end
    #end
    
    leavingNumber(j, c)
    
    #return true
end

end