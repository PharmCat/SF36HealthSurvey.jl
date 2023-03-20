using SF36
using Test

@testset "SF36.jl" begin
    io = IOBuffer();

    v = [
#1
1,2,3,2,3,
#6
2,3,2,1,2,
#11
1,2,1,2,1,
#16
2,1,2,1,3,
#21
3,2,  #60, 75
3,2,1,
#26
2,1,2,1,2,
#31
3,2,1,1,2,3]


    sfr = SF36.sf36(v)
    @test_nowarn show(io, sfr)
    @test sfr.PCS ≈ 44.4027962318693 atol=atol=1E-6
    @test sfr.MCS ≈ 32.31104541346562 atol=atol=1E-6

    sfr = SF36.sf36(v, version = :v2)
    @test sfr.PCS ≈ 39.75756803330104 atol=atol=1E-6
    @test sfr.MCS ≈ 31.456314031411424 atol=atol=1E-6

    v2 = [1,3,3,2,2,2,2,1,1,1,6,5]
    sfr = SF36.sf12(v2)
    @test sfr.PCS ≈ 56.57706 atol=atol=1E-5
    @test sfr.MCS ≈ 60.75781 atol=atol=1E-5

    v2 = [2,2,2,1,1,1,1,2,2,2,5,4]
    sfr = SF36.sf12(v2)
    @test sfr.PCS ≈ 41.26173 atol=atol=1E-5
    @test sfr.MCS ≈ 47.51643 atol=atol=1E-5

    v2 = [3,2,2,1,1,1,1,3,3,3,4,3]
    sfr = SF36.sf12(v2)
    @test sfr.PCS ≈ 37.41071 atol=atol=1E-5
    @test sfr.MCS ≈ 40.19664 atol=atol=1E-5

    v2 = [4,2,2,1,1,1,1,4,4,4,3,2]
    sfr = SF36.sf12(v2)
    @test sfr.PCS ≈ 33.82458 atol=atol=1E-5
    @test sfr.MCS ≈ 30.270519 atol=atol=1E-5

    v2 = [5,2,2,1,1,1,1,5,5,5,2,1]
    sfr = SF36.sf12(v2)
    @test sfr.PCS ≈ 29.949119 atol=atol=1E-5
    @test sfr.MCS ≈ 24.522889 atol=atol=1E-5

    v2 = [5,2,2,1,1,2,2,5,6,6,1,1]
    sfr = SF36.sf12(v2)
    @test sfr.PCS ≈ 25.91983 atol=atol=1E-5
    @test sfr.MCS ≈ 28.27583 atol=atol=1E-5

end
