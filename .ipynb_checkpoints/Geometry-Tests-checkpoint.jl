using .Geometry
using Test

pta = Point2D(0,0)
ptb = Point2D(0,2)
ptc = Point2D(2,0)

triangle = Polygon([pta, ptb, ptc]) 

ptd = Point2D(0,0)
pte = Point2D(0,2)
ptf = Point2D(2,2)
ptg = Point2D(2,0)

rectangle = Polygon([ptd, pte, ptf, ptg]) 

pth = Point2D(0,0)
pti = Point2D(1,2)
ptj = Point2D(3,2)
ptk = Point2D(2,0)

parallelogram = Polygon([pth, pti, ptj, ptk]) 

a = Polygon([3,0,11,6,8,10,0,4])
hex = Polygon([15,10,10,15,5,10,5,5,15,5])
oct = Polygon([0,20,5,25,10,25,15,20,15,15,10,10,5,10,0,15])

@testset "Check Type" begin
    @test isa(Point2D(0,0), Point2D)
    @test isa(Point2D(100,100), Point2D)
    @test isa(Point2D(0.0,0.0), Point2D)
    @test isa(Point2D(-100.1,5.5), Point2D)
    @test isa(Point3D(0,0,0), Point3D)
    @test isa(Point3D(0.0,1.0,2.0), Point3D)
    @test isa(triangle, Polygon)
    @test isa(rectangle, Polygon)
    @test isa(parallelogram, Polygon)
    @test isa(a,Polygon)
    @test isa(hex,Polygon)
    @test isa(oct,Polygon)
end

@testset "Check Distance" begin
    @test isapprox(distance(pta, ptb),2)
    @test isapprox(distance(pta, ptc),2)
    @test distance(pta, ptj) != 0
    @test distance(pta, pti) != 0
    @test isapprox(distance(Point3D(0,0,0), Point3D(2,0,0)),2)
    @test distance(Point3D(0,0,0), Point3D(2,2,2)) != 0
end

@testset "Illegal Constructors" begin
    @test_throws ArgumentError Polygon(1,2,3,4)
    @test_throws ArgumentError Polygon(1,2,3,4,5,6,7)
    @test_throws ArgumentError Polygon([1,2,3,4])
    @test_throws ArgumentError Polygon([1,2,3,4,5,6,7])
    @test_throws ArgumentError Circle(Point2D(0,0),0)
    @test_throws ArgumentError Circle(0)
end

@testset "Rectangle Test" begin
    @test isRectangular(rectangle)
    @test !isRectangular(triangle)
    @test isRectangular(a)
    @test !isRectangular(hex)
    @test !isRectangular(oct)
    @test !isRectangular(parallelogram)
end

@testset "Perimeter Test" begin
    @test isapprox(perimeter(rectangle), 8)
    @test isapprox(perimeter(triangle), 6.828427125) # calculated these on paper
    @test isapprox(perimeter(a), 30.0) 
    @test isapprox(perimeter(hex), 34.1421356)
    @test isapprox(perimeter(oct), 48.28427125)
    @test isapprox(perimeter(parallelogram), 8.472135955)
end

@testset "Circle Tests" begin
    @test isa(Circle(), Circle)
    @test isa(Circle(1), Circle)
    @test isa(Circle(Point2D(1,2)), Circle)
    @test isa(Circle(Point2D(2,1), 5), Circle)
    @test isapprox(area(Circle()), pi)
    @test isapprox(perimeter(Circle()),pi*2)
    @test_throws ArgumentError Circle(-1)
end
