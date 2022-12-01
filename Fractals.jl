module Fractals

import Base.show

export FractalView, iterate, leavingNumber, inMandelbrot

```
```
struct FractalView
    # min and max of fractals
    min::Complex
    max::Complex
    # width and height in pixels, (resolution?)
    width::Integer
    height::Integer
end

#iterate ( increment by c )
```
This is a comment
```
function iterate(c::Complex)
    
end

#leavingNumber ( how many iterations until number is more than 2 -> goes to infinity )
```
```
function leavingNumber(i::Integer)
    
end

#inMandelbrot ( iterate number a ton, and if not more than 2, then it is bounded )
```
```
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