module Fractals

import Base: show#, iterate

export FractalView, iterate, leavingNumber, inMandelbrot

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
end

#iterate ( function, inital point, number of increments)
```
This is a helpful comment
```
function iterateFunction(f::Function, initial::Complex, i::Integer)
    
end

#leavingNumber ( how many iterations until number is more than 2 -> goes to infinity )
# optional parameter = number of iterations to test
# optional paramter = initial point, default 0 + 0im
```
This is a helpful comment
```
function leavingNumber(i::Integer = 100, inital::Complex = 0 + 0im)
    if (initial += 0 + 1im) < 2
        # recursive? 
        leavingNumber(i-=1, inital)
    end
    
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