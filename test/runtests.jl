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
end
