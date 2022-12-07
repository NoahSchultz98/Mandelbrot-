module Fractals

using Plots

export FractalView, iterateFunction, leavingNumber, inMandelbrot, mandelbrotViewer

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
    FractalView() = new(0im,2+2im, 800,600)
    # defualt constuctor takes no arguments
    FractalView(min::Complex,max::Complex) = real(min) < real(max) && imag(min) < imag(max) ? new(min,max,800,600) : throw(ArgumentError("The mininum complex number must be smaller than the maximun"))
    # takes the max and min as arugments, default dimensions
    #FractalView(min::Complex,max::Complex, width::Integer, height::Integer) = width > 0 && height > 0 ? new(min,max,width, height) : throw(ArgumentError("The size of the window must be a positive Integer larger than 0"))
    function FractalView(min::Complex,max::Complex, width::Integer, height::Integer)
        if !(real(min) < real(max) && imag(min) < imag(max))
            throw(ArgumentError("The mininum complex number must be smaller than the maximun"))
        elseif !(width > 0 && height > 0)
            throw(ArgumentError("The size of the window must be a positive Integer larger than 0"))
        else
            new(min,max,width, height)
        end
    end
    # throws argument error if the width or height is negative
        
end

function mandelbrotViewer(fractal::FractalView)
    
    m = zeros(Complex,  fractal.height, fractal.width)

    xVector = LinRange(real(fractal.min), real(fractal.max), fractal.width)
    yVector = reverse(LinRange(imag(fractal.min), imag(fractal.max), fractal.height))

    for x in 1:fractal.width
        for y in 1:fractal.height
            #print("(", xVector[x],", " ,yVector[y], "im), ")
            m[y,x] = complex(xVector[x], yVector[y])#xVector[x] + yVector[y]
        end
    end
    
    #map(x->leavingNumber(x), m)
    
    heatmap(1:fractal.width, 1:fractal.height, map(x->leavingNumber(x), m))
    
end
    

"""
This is the iterate function that takes a compelx function and iterates it a certain number of times.

returns a vector of complex numbers for each iteration including the initial
"""
function iterateFunction(f::Function, initial::Complex, i::Integer)
    # i is the number of times we will iterate this function
    
    if i < 1
        throw(ArgumentError("The number of iterations must be positive"))
    end
    
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

"""
This function takes a complex number and returns the number of iterations. 

if the number does not leave than it returns the input iterations + 1
"""
function leavingNumber(c::Complex, initial::Complex = 0 + 0im, i::Integer = 100)
    # i is the maximum times we will iterate the function
    
    if i < 1
        throw(ArgumentError("The maximum number of iterations must be positive"))
    end
    
    f(x) = (x^2) + c
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

"""
This function takes a complex number and returns true or false based on if the number input is in the Mandelbrot set or not.
"""
function inMandelbrot(c::Complex, j::Integer = 100)
    # in this function j is the number of iterations to find if the number is larger than 2
    
    if j < 1
        throw(ArgumentError("The maximum number of iterations must be positive"))
    end    
    
    z = leavingNumber(c, j)  # call the function we made to get the index of the leaving number
    
    # as stated before, if z is equal to the size of the vector then we did not find a leavingNumber
    # if we did not find a leaving number, then this complex number is in the mandlebrot set
    if z == (j+1)
        return true
    end
    false

end

end