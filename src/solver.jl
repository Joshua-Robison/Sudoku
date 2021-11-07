# Sudoku: Recursion + Backtracking
export solve

# Helper Function
function possible(p::Puzzle, x::Int, y::Int, n::Int)::Bool
    #=
    This function checks that the number n
    is not already in the row x, column y
    or the 3 x 3 sub-grid of the board.
    =#
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

# Solve the Sudoku Puzzle
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
                            # backtrack
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
