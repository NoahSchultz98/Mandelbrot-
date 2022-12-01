module Fractals

import Base: show#, iterate

export FractalView, iterateFunction, leavingNumber, inMandelbrot


"""
The Fractal View contains the min and max of the plot of the Mandelbrot Set. 

Constructors:
defualt
two complex numbers
two complex numbers, two integers for width and height
"""
struct FractalView
    # min and max of fractals
    min::Complex
    max::Complex
    # width and height in pixels, (resolution?)
    width::Integer
    height::Integer
    #add test to make sure that width and height are positive in constructors
    FractalView() = new(0im,2im, 800,600)
    FractalView(min::Complex,max::Complex) = new(min,max,800,600)
    FractalView(min::Complex,max::Complex, width::Integer, height::Integer) = width > 0 && height > 0 ? new(min,max,width, height) : throw(ArgumentError("The size of the window must be a positive Integer"))
    
end

#<<<<<<< FractalsTestBranch
#iterate ( increment by c )
"""
This is the iterate function that takes a compelx function and iterates it a certain number of times.

returns a vector of complex numbers for each iteration including the initial
"""
function iterateFunction(f::Function, initial::Complex, i::Integer)
    
    v = zeros(Complex, i+1)
    
    v[1] = initial 
    
    for j in 2:(i+1)
        v[j] = f(initial)
        initial = v[j]
    end
    
    return v
    
end

#leavingNumber ( how many iterations until number is more than 2 -> goes to infinity )

"""
This function takes a complex number and returns the number of iterations. 

if the number does not leave than it returns the input iterations + 1
"""
function leavingNumber(i::Integer = 100, initial::Complex = 0 + 0im)
    
    f(x) = (x^2) + im
    
    v = iterateFunction(f, initial, i)# use abs() to see if its bigger than 2
    
    z = 1
    
    while abs(v[z]) < 2 && z < length(v)
        z+=1
    end
    
    z
end

#inMandelbrot ( iterate number a ton, and if not more than 2, then it is bounded )
"""
This function takes a complex number and returns true or false based on if the number input is in the Mandelbrot set or not.
"""
function inMandelbrot(c::Complex, j::Integer = 100)
    
    z = leavingNumber(j, c)
    
    if z == (j+1)
        return true
    end
    false

end

end