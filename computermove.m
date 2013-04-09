function computermove_pt4()
%COMPUTERMOVE_PT1 Part 4, implementation of a "minimax w/ alpha-beta w/ depth-limiting AI"
%   Set the board position for the AI. Ensure use of 2 for move

global board;
global count;

count = 0;

max_value = -inf;
col = 1;
col = 6;

% loop through all columns, and then apply minimax to find best column
for ii=1:7
    % check if column is filled, else find open spot
    if board(1,ii) ~= 0
        if col == ii
            col = col + 1;
        end
        continue;
    else
        for jj=6:-1:1
            if board(jj,ii) == 0
                arow = jj;
                break;
            end
        end
    end
    board(arow,ii) = 2;
    value = ab_minimax_depth(1,-inf,inf,4);
    board(row,ii) = 0;
    if value > max_value        
        col = ii;
        row = arow;
    end
    
end

board(row,col) = 2;

end
