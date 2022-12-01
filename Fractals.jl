module Fractals

import Base.show

export FractalView, iterate, leavingNumber, inMandelbrot

struct FractalView
    # min and max of fractals
    min::Complex
    max::Complex
    # width and height in pixels, (resolution?)
    width::Integer
    height::Integer
end

#iterate ( increment by c )

#leavingNumber ( how many iterations until number is more than 2 -> goes to infinity )

#inMandelbrot (iterate number a ton, and if not more than 2, then it is bounded)

end