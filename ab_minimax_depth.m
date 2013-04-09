function [value] = ab_minimax_depth(player,a,b,depth)
%MINIMAX minimax algorithm for basic AI. Returns row,col for move
%   Doesn't have depth limiting so incredibly slow and unwieldy.
%   Every branch will run till it hits win (1), loss (-1), or tie
%   and then at that point, add together for best column

global board;

value = 0;


w = check4win(board);

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

% heuristic determine
if depth == 0
    value = 100*heuristic(board,player,3)+50*heuristic(board,player,2)+heuristic(board,player,1);
    if player == 1
        opposite = 2;
    else
        opposite = 1;
    end
    value = value + 100*heuristic(board,opposite,3)+50*heuristic(board,opposite,2)+heuristic(board,opposite,1);
    return;
end

for ii=1:7
    if board(1,ii) ~= 0
        continue;
    else
        for jj=6:-1:1
            if board(jj,ii) == 0
                row = jj;
                break;
            end
        end
    end
    board(row,ii) = player;
    %disp(sprintf('%d at %d and %d which has %d',player,row,ii,board(row,ii)));
    %disp(board);
     
    if player == 1
        b = min(b,ab_minimax_depth(2,a,b,(depth-1)));
    else
        a = max(a,ab_minimax_depth(1,a,b,(depth-1)));
    end
    
    board(row,ii) = 0; 
    if b <= a
        break;
    end
end

if player == 1
    value  = b;
else
    value = a;
end

end
