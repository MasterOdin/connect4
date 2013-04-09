function [value] = minimax(player,a,b)
%MINIMAX minimax algorithm for basic AI. Returns row,col for move
%   Doesn't have depth limiting so incredibly slow and unwieldy.
%   Every branch will run till it hits win (1), loss (-1), or tie
%   and then at that point, add together for best column

global board;

value = 0;


[w,ind] = check4win(board);

if w > 0
    if w == 1
        value = -inf;
    elseif w == 2
        value = inf;
    elseif w == 3
        value = 0;
    end
    return;
end

for ii=1:7
    col = ii;
    if board(1,col) ~= 0
        continue;
    else
        for jj=6:-1:1
            if board(jj,col) == 0
                row = jj;
                break;
            end
        end
    end
    board(row,col) = player;
     
    if player == 1
        b = min(b,minimax(2,a,b));
    else
        a = max(a,minimax(1,a,b));
    end
    
    board(row,col) = 0; 
    if b <= a
        break;
    end
end

if player == 1
    value  = b;
else
    value = a;
end
