using Mocking
Mocking.enable()

import Compat: Test
using Test
import Mocking: apply

function next_gensym(str::AbstractString, offset::Integer=1)
    m = match(r"^(.*?)(\d+)$", string(gensym(str)))
    return Symbol(string(m.captures[1], parse(Int, m.captures[2]) + offset))
end

@testset "Mocking" begin
    include("precompile.jl")
    include("expr.jl")
    include("bindings/bindings.jl")
    include("patch.jl")

    include("concept.jl")
    include("scope.jl")
    include("closure.jl")
    include("import.jl")
    include("real-open.jl")
    include("real-isfile.jl")
    include("real-nested.jl")
    include("mock-in-patch.jl")
    include("readme.jl")
    include("optional.jl")
    include("patch-gen.jl")
    include("anonymous-param.jl")
end
