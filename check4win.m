%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Code to check for a winner... will return winner 1 or 2 or
%%%%%%%%%% 0 if no win, 3 if tie
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [w,ind] = check4win(b)

[w,ind]=checkplayer(b,1);
if w==0
    [w,ind]=checkplayer(b,2);
end
if isempty(find(b==0,1)) && w==0
    w=3;
end

end
