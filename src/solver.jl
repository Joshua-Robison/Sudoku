export solve

function possible(p::Puzzle, x::Int, y::Int, n::Int)::Bool
    for j in 1:9
        if p[x,j] == n
            return false;
        end
    end
    for i in 1:9
        if p[i,y] == n
            return false;
        end
    end
    # get sub-grid coordinates
    xs = Int.(3 * ceil(x / 3 - 1) .+ collect(1:3))
    ys = Int.(3 * ceil(y / 3 - 1) .+ collect(1:3))
    for i in xs
        for j in ys
            if p[i,j] == n
                return false;
            end
        end
    end
    return true;
end

function solve(p::Puzzle)::Bool
    for i in 1:9
        for j in 1:9
            if p[i,j] == 0
                for n in 1:9
                    if possible(p, i, j, n)
                        p[i,j] = n
                        # recursion
                        if solve(p)
                            return true;
                        else
                            # backtracking
                            p[i,j] = 0
                        end
                    end
                end
                return false;
            end
        end
    end
    return true;
end
