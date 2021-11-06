# Sudoku: Puzzle Definition
export Puzzle

# Puzzle Structure
struct Puzzle
    grid::Matrix{Int} # n x n matrix
    function Puzzle(grid::Matrix{Int})
        # verify input is a valid Sudoku puzzle (9 x 9)
        @assert size(grid) == (9, 9) "Invalid puzzle dimensions!"
        return new(grid);
    end
end

# Puzzle Interfaces
function Base.getindex(p::Puzzle, i::Int, j::Int)::Int
    rows, cols = size(p.grid)
    if (1 ≤ i ≤ rows) && (1 ≤ j ≤ cols)
        return p.grid[i,j];
    end
    throw(BoundsError(p));
end

function Base.setindex!(p::Puzzle, n::Int, i::Int, j::Int)
    rows, cols = size(p.grid)
    if (1 ≤ i ≤ rows) && (1 ≤ j ≤ cols)
        p.grid[i,j] = n;
    else
        throw(BoundsError(p));
    end
end

# Display Sudoku Puzzle
function Base.show(io::IO, p::Puzzle)::Nothing
    println("\033[2J") # clear repl
    println("\033[$(displaysize(stdout)[1])A")
    rows, cols = size(p.grid)
    println("\t" * "-"^37)
    for i in 1:rows
        for j in 1:cols
            if j == 1
                print("\t|")
            end
            print(" $(p.grid[i,j]) |")
        end
        println("\n\t" * "-"^37)
    end
end
