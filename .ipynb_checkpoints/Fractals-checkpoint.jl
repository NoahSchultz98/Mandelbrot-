module Fractals

import Base: show#, iterate

export FractalView, iterateFunction, leavingNumber, inMandelbrot


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
    #add test to make sure that width and height are positive in constructors
end

#<<<<<<< FractalsTestBranch
#iterate ( increment by c )
"""
This is the iterate function that takes a compelx function and iterates it a certain number of times.
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
"""
function leavingNumber(i::Integer = 100, initial::Complex = 0 + 0im)
    
    f(x) = (x^2) + im
    
    v = iterateFunction(f, initial, i)# use abs() to see if its bigger than 2
    
    for j in 1:i
        if abs(v[j]) > 2
           break
        end
    end
    
    if j == i 
        return true #the number of iterations that it takes to leave 2
    else
       return j
    end
    
end

#inMandelbrot ( iterate number a ton, and if not more than 2, then it is bounded )
"""
This function takes a complex number and returns true or false based on if the number input is in the Mandelbrot set or not.
"""
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