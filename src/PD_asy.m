function [patterns frequency]= PD_asy(generations,b,n,m,inint_condition,inint_val,interact_condition)
%PD                 A simple, and purely deterministic, spatial version of
%                   the Prisoners' Dilemma, with no memories among players
%                   and no strategical elaboration, can generate
%                   chaotically changing spatial patterns, in which
%                   cooperators and defectors both persist indefinitely.The
%                   updating is performed asynchronously.
%
%Synopsis:          [patterns frequency]=PD_asy(generations,b,n,m,inint_condition,inint_val,interact_condition)
%
%Input:             generations = The number of generations(Time).
%                   b = characterizes the advantage of defectors.
%                   n = (optional) the number of row.
%                       Default: n = 200.
%                   m = (optional) the number of coloum.
%                       Default: m = 200.
%                   inint_condition = 1: A singel defector/cooperator at
%                                     the centre.
%                                     2: Random: inint_val % defectors
%                   inint_val = When inint_condition == 1, then 1:defector,
%                               2:cooperator
%                               When inint_condition == 2, inint_val means
%                               the proportion of defectors.
%                   interact_condition = 1: 8-neighours plus
%                                           self-interaction
%                                        2: 8-neighours exclude
%                                           self-interaction
%                                        3: 4-neighours plus
%                                           self-interaction
%
%Output:            patterns = The result of generating patterns. A 3-D
%                              matrix, where the third dimension is the
%                              index number of generations, the first and
%                              second dimensions are the data of patterns.
%                              1:Red   :D, was D
%                              2:Yellow:D, was C
%                              3:Blue  :C, was C
%                              4:Green :C, was D
%                   frequency = The frequency of cooperators.
%
%Notes:             Function used for coursework of Evolution of Complexity
%                   Nowak and May (1992) Evolutionary Games and Spatial Chaos,
%                   Nature 359, 826

if nargin < 3
    n = 200;
    m = 200;
end

patterns=ones(n, m, generations);
frequency=zeros(1,generations-1);

amount = n * m;
random_v = zeros(1,amount);

if(inint_condition==1)
    if(inint_val==1)
        patterns(:,:,1) = 3;
        patterns(round(n/2),round(m/2),1) = 1;
    else
        patterns(round(n/2),round(m/2),1) = 3;
    end
else
    random_v = randperm(amount);
    for i = 1 :round(amount*(1-inint_val))
        col=mod(random_v(i),m);
        if(col==0)
            col = m;
            row = random_v(i)/m;
        else
            col =mod(random_v(i),m);
            row =ceil(random_v(i)/m);
        end
        patterns(row, col,1)=3;
    end
end


payoff = zeros (n+2,m+2);
currentpattern=ones(n+2, m+2);


num_cooperator=sum(sum(patterns(:,:,1)>2));

frequency(1)=num_cooperator/amount;

for k = 1 : generations-1
    currentpattern(2:n+1,2:m+1)=patterns(:,:,k);

    num_green = 0;
    num_yellow = 0;

    if(interact_condition==1)

        for i = 1 : n
            for j = 1 : m
                if(currentpattern(i+1,j+1)>2)  % the lattice-site is cooperator.
                    payoff(i+1, j+1)=sum(sum(currentpattern(i:i+2,j:j+2)>2));
                else   % the lattice-site is defector.
                    payoff(i+1, j+1)=b*sum(sum(currentpattern(i:i+2,j:j+2)>2));
                end
            end
        end

        random_v = randperm(amount);
        for i = 1 : amount

            col=mod(random_v(i),m);
            if(col==0)
                col = m;
                row = random_v(i)/m;
            else
                col =mod(random_v(i),m);
                row =ceil(random_v(i)/m);
            end


            [maxX maxY] =locateMax(payoff(row:row+2,col:col+2));
            if(payoff(row + maxX - 1 , col + maxY -1) > payoff(row + 1, col + 1))
                if(currentpattern(maxX - 1 + row, maxY -1 + col)>2) % if the winner lattice-site is cooperator.
                    if(currentpattern(row+1,col+1) > 2)  % if the current lattice-site is cooperator. C->C
                        currentpattern(row+1, col+1) = 3;
                    else                              % if the current lattice-site is defector. D->C
                        currentpattern(row+1, col+1) = 4;
                        num_green = num_green + 1;

                        for p=0:2
                            for q=0:2
                                if(p==1&&q==1)
                                    payoff(row+p,col+q)=payoff(row+p,col+q)/b+1;
                                elseif(currentpattern(row+p,col+q)>2) % the lattice-site is C
                                    payoff(row+p,col+q)=payoff(row+p,col+q)+1;
                                else  % the lattice-site is D
                                    payoff(row+p,col+q)=payoff(row+p,col+q)+b;
                                end
                            end
                        end

                    end
                else                                 % if the winner lattice-site is defector.
                    if(currentpattern(row+1,col+1) > 2)  % if the current lattice-site is cooperator. C->D
                        currentpattern(row+1, col+1) = 2;
                        num_yellow = num_yellow + 1;

                        for p=0:2
                            for q=0:2
                                if(p==1&&q==1)
                                    payoff(row+p,col+q)=(payoff(row+p,col+q)-1)*b;
                                elseif(currentpattern(row+p,col+q)>2) % the lattice-site is C
                                    payoff(row+p,col+q)=payoff(row+p,col+q)-1;
                                else  % the lattice-site is D
                                    payoff(row+p,col+q)=payoff(row+p,col+q)-b;
                                end
                            end
                        end

                    else                              % if the current lattice-site is defector.
                        currentpattern(row+1, col+1) = 1;
                    end
                end
            elseif(currentpattern(row+1,col+1)==2)
                currentpattern(row+1, col+1) = 1;

            elseif(currentpattern(row+1,col+1)==4)
                currentpattern(row+1, col+1) = 3;
            else
            end
        end

    elseif(interact_condition==2)

        for i = 1 : n
            for j = 1 : m
                if(currentpattern(i+1,j+1)>2)  % the lattice-site is cooperator.
                    payoff(i+1, j+1)=sum(sum(currentpattern(i:i+2,j:j+2)>2))-1;
                else   % the lattice-site is defector.
                    payoff(i+1, j+1)=b*sum(sum(currentpattern(i:i+2,j:j+2)>2));
                end
            end
        end

        random_v = randperm(amount);
        for i = 1 : amount

            col=mod(random_v(i),m);
            if(col==0)
                col = m;
                row = random_v(i)/m;
            else
                col =mod(random_v(i),m);
                row =ceil(random_v(i)/m);
            end


            [maxX maxY] =locateMax_2(payoff(row:row+2,col:col+2));
            if(payoff(row + maxX - 1 , col + maxY -1) > payoff(row + 1, col + 1))
                if(currentpattern(maxX - 1 + row, maxY -1 + col)>2) % if the winner lattice-site is cooperator.
                    if(currentpattern(row+1,col+1) > 2)  % if the current lattice-site is cooperator. C->C
                        currentpattern(row+1, col+1) = 3;
                    else                              % if the current lattice-site is defector. D->C
                        currentpattern(row+1, col+1) = 4;
                        num_green = num_green + 1;

                        for p=0:2
                            for q=0:2
                                if(p==1&&q==1)
                                    payoff(row+p,col+q)=payoff(row+p,col+q)/b;
                                elseif(currentpattern(row+p,col+q)>2) % the lattice-site is C
                                    payoff(row+p,col+q)=payoff(row+p,col+q)+1;
                                else  % the lattice-site is D
                                    payoff(row+p,col+q)=payoff(row+p,col+q)+b;
                                end
                            end
                        end
                    end
                else                                 % if the winner lattice-site is defector.
                    if(currentpattern(row+1,col+1) > 2)  % if the current lattice-site is cooperator. C->D
                        currentpattern(row+1, col+1) = 2;
                        num_yellow = num_yellow + 1;

                        for p=0:2
                            for q=0:2
                                if(p==1&&q==1)
                                    payoff(row+p,col+q)=payoff(row+p,col+q)*b;
                                elseif(currentpattern(row+p,col+q)>2) % the lattice-site is C
                                    payoff(row+p,col+q)=payoff(row+p,col+q)-1;
                                else  % the lattice-site is D
                                    payoff(row+p,col+q)=payoff(row+p,col+q)-b;
                                end
                            end
                        end

                    else                              % if the current lattice-site is defector.
                        currentpattern(row+1, col+1) = 1;
                    end
                end
            elseif(currentpattern(row+1,col+1)==2)
                currentpattern(row+1, col+1) = 1;

            elseif(currentpattern(row+1,col+1)==4)
                currentpattern(row+1, col+1) = 3;
            else
            end
        end

    else
        for i = 1 : n
            for j = 1 : m
                if(currentpattern(i+1,j+1)>2)  % the lattice-site is cooperator.
                    payoff(i+1, j+1)=sum(currentpattern(i+1,j:j+2)>2)+sum(currentpattern(i:i+2,j+1)>2)-1;
                else   % the lattice-site is defector.
                    payoff(i+1, j+1)=b*(sum(currentpattern(i+1,j:j+2)>2)+sum(currentpattern(i:i+2,j+1)>2));
                end
            end
        end

        random_v = randperm(amount);
        for i = 1 : amount

            col=mod(random_v(i),m);
            if(col==0)
                col = m;
                row = random_v(i)/m;
            else
                col =mod(random_v(i),m);
                row =ceil(random_v(i)/m);
            end


            [maxX maxY] =locateMax_3(payoff(row:row+2,col:col+2));
            if(payoff(row + maxX - 1 , col + maxY -1) > payoff(row + 1, col + 1))
                if(currentpattern(maxX - 1 + row, maxY -1 + col)>2) % if the winner lattice-site is cooperator.
                    if(currentpattern(row+1,col+1) > 2)  % if the current lattice-site is cooperator. C->C
                        currentpattern(row+1, col+1) = 3;
                    else                              % if the current lattice-site is defector. D->C
                        currentpattern(row+1, col+1) = 4;
                        num_green = num_green + 1;

                        for p=0:2
                            if(p~=1)
                                if(currentpattern(row+1,col+p)>2) % the lattice-site is C
                                    payoff(row+1,col+p)=payoff(row+1,col+p)+1;
                                else  % the lattice-site is D
                                    payoff(row+1,col+p)=payoff(row+1,col+p)+b;
                                end
                            end
                        end

                        for p=0:2
                            if(p~=1)
                                if(currentpattern(row+p,col+1)>2) % the lattice-site is C
                                    payoff(row+p,col+1)=payoff(row+p,col+1)+1;
                                else  % the lattice-site is D
                                    payoff(row+p,col+1)=payoff(row+p,col+1)+b;
                                end
                            end
                        end
                        
                        payoff(row+1,col+1)=payoff(row+1,col+1)/b+1;

                    end
                else                                 % if the winner lattice-site is defector.
                    if(currentpattern(row+1,col+1) > 2)  % if the current lattice-site is cooperator. C->D
                        currentpattern(row+1, col+1) = 2;
                        num_yellow = num_yellow + 1;

                        for p=0:2
                            if(p~=1)
                                if(currentpattern(row+1,col+p)>2) % the lattice-site is C
                                    payoff(row+1,col+p)=payoff(row+1,col+p)-1;
                                else  % the lattice-site is D
                                    payoff(row+1,col+p)=payoff(row+1,col+p)-b;
                                end
                            end
                        end

                        for p=0:2
                            if(p~=1)
                                if(currentpattern(row+p,col+1)>2) % the lattice-site is C
                                    payoff(row+p,col+1)=payoff(row+p,col+1)-1;
                                else  % the lattice-site is D
                                    payoff(row+p,col+1)=(payoff(row+p,col+1)-1)*b;
                                end
                            end
                        end
                        
                        payoff(row+1,col+1)=payoff(row+1,col+1)/b+1;

                    else                              % if the current lattice-site is defector.
                        currentpattern(row+1, col+1) = 1;
                    end
                end
            elseif(currentpattern(row+1,col+1)==2)
                currentpattern(row+1, col+1) = 1;

            elseif(currentpattern(row+1,col+1)==4)
                currentpattern(row+1, col+1) = 3;
            else
            end
        end





    end
    patterns(:,:,k+1)=currentpattern(2:m+1,2:n+1);
    num_cooperator=num_cooperator+num_green-num_yellow;
    frequency(k+1)= num_cooperator/amount;
end
end

function [maxX maxY]=locateMax(matrix)
%locateMax          Find the location of the first max number of matrix.
%
%Synopsis:          [maxX maxY]=locateMax(matrix)
%
%Input:             matrix: matrix
%
%Output:            maxX = the row number of the first max number
%                   maxY = the coloum number of the first max number
%
%Notes:             Function used for coursework of Evolution of Complexity
%                   Nowak and May (1992) Evolutionary Games and Spatial Chaos,
%                   Nature 359, 826
tempmax=0;
maxX=1;
maxY=1;
for i = 1: size(matrix,1)
    for j =1 : size(matrix,2)
        if(matrix(i,j)>tempmax)
            tempmax=matrix(i,j);
            maxX=i;
            maxY=j;
        end
    end
end
end


function [maxX maxY]=locateMax_2(matrix)
%locateMax          Find the location of the first max number of matrix
%                   apart from self
%
%Synopsis:          [maxX maxY]=locateMax_2(matrix)
%
%Input:             matrix: matrix
%
%Output:            maxX = the row number of the first max number
%                   maxY = the coloum number of the first max number
%
%Notes:             Function used for coursework of Evolution of Complexity
%                   Nowak and May (1992) Evolutionary Games and Spatial Chaos,
%                   Nature 359, 826

tempmax=0;
maxX=1;
maxY=1;
for i = 1: 3
    for j =1 : 3
        if(matrix(i,j)>tempmax)
            if(i==2&&j==2)
            else
                tempmax=matrix(i,j);
                maxX=i;
                maxY=j;
            end
        end
    end
end
end

function [maxX maxY]=locateMax_3(matrix)
%locateMax          Find the location of the first max number of matrix
%                   along basic lines laid down above
%
%
%Synopsis:          [maxX maxY]=locateMax_3(matrix)
%
%Input:             matrix: matrix
%
%Output:            maxX = the row number of the first max number
%                   maxY = the coloum number of the first max number
%
%Notes:             Function used for coursework of Evolution of Complexity
%                   Nowak and May (1992) Evolutionary Games and Spatial Chaos,
%                   Nature 359, 826

tempmax=0;
maxX=2;
maxY=2;
for i = 1: 3

    if(matrix(2,i)>tempmax)

        tempmax=matrix(2,i);
        maxY=i;
    end

end

for i = 1: 3

    if(matrix(i,2)>tempmax)

        tempmax=matrix(i,2);
        maxX=i;
        maxY=2;
    end

end
end


