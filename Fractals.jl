module Fractals

import Base.show

export FractalView, iterate, leavingNumber, inMandelbrot

"""
The Fractal View contains the min and max of the plot of the Mandelbrot Set. 
"""
struct FractalView
    # min and max of fractals
    min::Complex
    max::Complex
    # width and height in pixels, (resolution?)
    width::Integer
    height::Integer
end

#iterate ( increment by c )
"""
This is the iterate function that takes a compelx function and iterates it a certain number of times.
"""
function iterate(c::Complex)
    
end

#leavingNumber ( how many iterations until number is more than 2 -> goes to infinity )
"""

"""
function leavingNumber(i::Integer)
    
end

#inMandelbrot ( iterate number a ton, and if not more than 2, then it is bounded )
"""
This is a helpful comment
"""
function inMandelbrot()
    j = 1000

    for i in 1:j
       #if iterate() > 2
            #return false
        #end
    end
    
    return true
end

end