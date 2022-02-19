export Puzzle

struct Puzzle
    board::Matrix{Int} # n x n matrix
    function Puzzle(board::Matrix{Int})
        # verify input is a valid Sudoku puzzle (9 x 9)
        @assert size(board) == (9, 9) "Invalid puzzle dimensions!"
        return new(board);
    end
end

function Base.getindex(p::Puzzle, i::Int, j::Int)::Int
    rows, cols = size(p.board)
    if (1 ≤ i ≤ rows) && (1 ≤ j ≤ cols)
        return p.board[i,j];
    end
    throw(BoundsError(p));
end

function Base.setindex!(p::Puzzle, n::Int, i::Int, j::Int)
    rows, cols = size(p.board)
    if (1 ≤ i ≤ rows) && (1 ≤ j ≤ cols)
        p.board[i,j] = n;
    else
        throw(BoundsError(p));
    end
end

function Base.show(io::IO, p::Puzzle)::Nothing
    println(io, "\033[2J") # clear repl
    println(io, "\033[$(displaysize(stdout)[1])A")
    rows, cols = size(p.board)
    for i in 1:rows
        for j in 1:cols
            print(io, " $(p.board[i,j]) ")
            if (j % 3 == 0) && (j != cols)
                print(io, "|")
            end
        end
        println(io)
        if (i % 3 == 0) && (i != rows)
            # border lines
            println(io, ("-"^9 * "+")^2 * "-"^9)
        end
    end
end
