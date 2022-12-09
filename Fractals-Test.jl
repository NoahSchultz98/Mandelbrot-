using .Fractals
using Test

@testset "Constructor Test FractalView" begin

    @test isa(FractalView(), FractalView)
    @test isa(FractalView(0im, 0.1+1im, 1920, 1080), FractalView)
    
    @test_throws ArgumentError FractalView(0im, 1im, -100, 300)
    @test_throws ArgumentError FractalView(0im, 1im, 300, -100)
    @test_throws ArgumentError FractalView(0im, 1im)


end

f(x) = x^2
v = iterateFunction(f, 0im, 5)

@testset "IterateFunction tests" begin

    @test length(v) == 6
    
    @test (iterateFunction(f, 0im, 5))[6] == 0
    #@test (iterateFunction(f, -1im, 5))[6] > 0im
    @test (iterateFunction(f, .4+0im, 5))[1] == .4+0im  
    @test (iterateFunction(f, -.5+.5im, 5))[2] == (-.5+.5im)^2
    #@test (iterateFunction(f, .4im, 5))[]
    
end

max_num = 1000
init = 0+0im
stays = max_num + 1

@testset "leavingNumber tests" begin
    
    @test_throws ArgumentError leavingNumber(-1im,init, -max_num)

    @test leavingNumber(-1im, init, max_num) == stays
    @test leavingNumber(-1.01im, init, max_num) != stays
    @test leavingNumber(.4+0im, init, max_num) != stays
    @test leavingNumber(-.5+.5im, init, max_num) == stays
    @test leavingNumber(2im, init, max_num) != stays

end

@testset "inMandelbrot tests" begin

    @test_throws ArgumentError inMandelbrot(-1im, -max_num)

    @test inMandelbrot(-1im, max_num)
    @test !inMandelbrot(-1.01im, max_num)
    @test !inMandelbrot(.4+0im, max_num)
    @test inMandelbrot(-.5+.5im, max_num)
    @test !inMandelbrot(2im, max_num)

end