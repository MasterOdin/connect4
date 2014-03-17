function [ value ] = heuristic( board, player, n )
%HEURISTIC Generate value for n-out-of-4 utility
%   Detailed explanation goes here

value = 0;
%disp(player);
%disp(board);

if player == 1
    opposite = 2;
else
    opposite = 1;
end

% check horizontal
for ii=1:4
    for jj=1:6
        if board(jj,ii) == player
            group = [board(jj,ii+1);board(jj,ii+2);board(jj,ii+3)];
            if any(group == opposite) == 0
                if (sum(group)/player) == (n-1)
                    value = value + 1;
                end
            end
        end
    end
end

% check vertical
for ii=1:7
    for jj=1:3
        if board(jj,ii) == player
            group = [board(jj+1,ii);board(jj+2,ii);board(jj+3,ii)];
            if any(group == opposite) == 0
                if (sum(group)/player) == (n-1)
                    value = value + 1;
                end
            end
        end
    end
end

% check diagonal (down to right)
for ii=1:4
    for jj=1:3
        if board(jj,ii) == player
            group = [board(jj+1,ii+1);board(jj+2,ii+2);board(jj+3,ii+3)];
            if any(group == opposite) == 0
                if (sum(group)/player) == (n-1)
                    value = value + 1;
                end
            end
        end
    end
end

% check diagonal (up to right)
for ii=1:4
    for jj=6:-1:4
        if board(jj,ii) == player
            group = [board(jj-1,ii+1);board(jj-2,ii+2);board(jj-3,ii+3)];
            if any(group == opposite) == 0
                if (sum(group)/player) == (n-1)
                    value = value + 1;
                end
            end
        end
    end
end

if player == 1
    value = value * -1;
end
end

