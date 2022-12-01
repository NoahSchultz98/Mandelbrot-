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
    # defualt constuctor takes no arguments
    FractalView(min::Complex,max::Complex) = new(min,max,800,600)
    # takes the max and min as arugments, default dimensions
    FractalView(min::Complex,max::Complex, width::Integer, height::Integer) = width > 0 && height > 0 ? new(min,max,width, height) : throw(ArgumentError("The size of the window must be a positive Integer"))
    # throws argument error if the width or height is negative
    
end

#<<<<<<< FractalsTestBranch
#iterate ( increment by c )
"""
This is the iterate function that takes a compelx function and iterates it a certain number of times.

returns a vector of complex numbers for each iteration including the initial
"""
function iterateFunction(f::Function, initial::Complex, i::Integer)
    
    v = zeros(Complex, i+1)
    # make a vector of zeros 
    v[1] = initial 
    # the first element is our initial value
    for j in 2:(i+1)
        #for each element in the array
        v[j] = f(initial)
        # run the function on the initial variable
        initial = v[j]
        # increment the initial variable
    end
    
    return v
    #return the vector of complex numbers now with each element one increment of the function
    
end

#leavingNumber ( how many iterations until number is more than 2 -> goes to infinity )

"""
This function takes a complex number and returns the number of iterations. 

if the number does not leave than it returns the input iterations + 1
"""
function leavingNumber(i::Integer = 100, initial::Complex = 0 + 0im)
    
    f(x) = (x^2) + im
    # function of mandlebrot??? I am not confident that this is the function we should be using
    
    v = iterateFunction(f, initial, i)
    # use the iterateFunction meathod to get a vector of complex numbers where each element is 
    # the complex function increment of the last
    
    z = 1
    # while we are not at the end of the list, if the element's distance is more than 2 
    # then the index of that element is the leaving number
    while abs(v[z]) < 2 && z < length(v)
        z+=1
    end
    # if we get here then that means that there was no element that had a distance larger than 2
    # this means that z is equal to the length of the vector 
    # the length of the vector is always i + 1 
    z
end

#inMandelbrot ( iterate number a ton, and if not more than 2, then it is bounded )
"""
This function takes a complex number and returns true or false based on if the number input is in the Mandelbrot set or not.
"""
function inMandelbrot(c::Complex, j::Integer = 100)
    # in this function j is the number of iterations
    
    z = leavingNumber(j, c) # call the function we made to get the index of the leaving number
    
    # as stated before, if z is equal to the size of the vector then we did not find a leavingNumber
    # if we did not find a leaving number, then this complex number is in the mandlebrot set
    if z == (j+1)
        return true
    end
    false

end

end