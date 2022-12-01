module Fractals

import Base.show

export FractalView, iterate, leavingNumber, inMandelbrot

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

#iterate ( increment by c )
```
This is a helpful comment
```
function iterate(c::Complex)
    
end

#leavingNumber ( how many iterations until number is more than 2 -> goes to infinity )
```
This is a helpful comment
```
function leavingNumber(i::Integer)
    
end

#inMandelbrot ( iterate number a ton, and if not more than 2, then it is bounded )
```
This is a helpful comment
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