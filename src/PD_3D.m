function [patterns frequency]= PD_3D(generations,b,l,w,h,inint_condition,inint_val)
%PD                 A simple, and purely deterministic, spatial version of
%                   the Prisoners' Dilemma in 3 diimensions, with no memories among players
%                   and no strategical elaboration, can generate
%                   chaotically changing spatial patterns, in which
%                   cooperators and defectors both persist indefinitely.
%
%Synopsis:          [patterns frequency]=PD_3D(generations,b,l,w,h,inint_condition,inint_val,interact_condition)
%
%Input:             generations = The number of generations(Time).
%                   b = characterizes the advantage of defectors.
%                   l = the number of length.
%                   w = the number of width.
%                   h = the number of hight.
%                   inint_condition = 1: A singel defector/cooperator at
%                                     the centre.
%                                     2: Random: inint_val % defectors
%                   inint_val = When inint_condition == 1, then 1:defector,
%                               2:cooperator
%                               When inint_condition == 2, inint_val means
%                               the proportion of defectors.
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


patterns=ones(l,w,h,generations);
frequency=zeros(1,generations);

amount = l*w*h;


%random_v = zeros(1,amount);

if(inint_condition==1)
    if(inint_val==1)
        patterns(:,:,:,1) = 3;
         patterns(round(l/2),round(w/2),round(h/2),1) = 1;
     else
         patterns(round(l/2),round(w/2),round(h/2),1) = 3;
%         patterns(:,:,:,1) = 3;
%          patterns(1:2,1:2,1:2,1) = 1;
%     else
%          patterns(1:2,1:2,1:2,1)  = 3;
          
    end
else
    random_v = randperm(amount);
    ji=w*l;
    for i = 1 :round(amount*(1-inint_val))
        zz_temp = mod(random_v(i),ji);
        if(zz_temp==0)
            zz=random_v(i)/ji;
            xx=w;
            yy=l;
        else
            zz=ceil(random_v(i)/ji);
            xx=mod(zz_temp,w);
            if(xx==0)
                xx=w;
                yy=zz_temp/w;
            else
                xx=mod(zz_temp,w);
                yy=ceil(zz_temp/w);
            end
        end
        patterns(xx,yy,zz,1)=3;
    end
end


payoff = zeros (l+2,w+2,h+2);
currentpattern=ones(l+2,w+2,h+2);


num_cooperator=sum(sum(sum(patterns(:,:,:,1)>2)));
frequency(1)=num_cooperator/amount;

for k = 1 : generations-1
    currentpattern(2:l+1,2:w+1,2:h+1)=patterns(:,:,:,k);

    num_green = 0;
    num_yellow = 0;



    for hh = 1 : h
        for ll = 1 : l
            for ww=1: w
                if(currentpattern(ll+1,ww+1,hh+1)>2)  % the lattice-site is cooperator.
                    payoff(ll+1, ww+1,hh+1)=sum(sum(sum(currentpattern(ll:ll+2,ww:ww+2,hh:hh+2)>2)));
                else   % the lattice-site is defector.
                    payoff(ll+1, ww+1,hh+1)=b*sum(sum(sum(currentpattern(ll:ll+2,ww:ww+2,hh:hh+2)>2)));
                end
            end
        end
    end

    for ll = 1 : l
        for ww = 1 : w
            for hh= 1:h
                [maxX maxY maxZ] =locateMax(payoff(ll:ll+2,ww:ww+2,hh:hh+2));
                if(payoff(ll + maxX - 1 , ww + maxY -1,hh + maxZ -1) > payoff(ll + 1, ww + 1, hh + 1))
                    if(currentpattern(maxX - 1 + ll, maxY -1 + ww,maxZ -1 +hh)>2) % if the winner lattice-site is cooperator.
                        if(currentpattern(ll + 1, ww + 1, hh + 1) > 2)  % if the current lattice-site is cooperator.
                            patterns(ll, ww,hh,k+1) = 3;
                        else                              % if the current lattice-site is defector.
                            patterns(ll, ww,hh,k+1)  = 4;
                            num_green = num_green + 1;
                        end
                    else                                 % if the winner lattice-site is defector.
                        if(currentpattern(ll + 1, ww + 1, hh + 1)> 2)  % if the current lattice-site is cooperator.
                            patterns(ll, ww,hh,k+1)= 2;
                            num_yellow = num_yellow + 1;
                        else                              % if the current lattice-site is defector.
                            patterns(ll, ww,hh,k+1) = 1;
                        end
                    end
                elseif(currentpattern(ll + 1, ww + 1, hh + 1)==2)
                    patterns(ll, ww,hh,k+1)= 1;

                elseif(currentpattern(ll + 1, ww + 1, hh + 1)==4)
                    patterns(ll, ww,hh,k+1) = 3;
                else
                    patterns(ll, ww,hh,k+1)=patterns(ll, ww,hh,k);
                end
            end
        end
    end
    num_cooperator=num_cooperator+num_green-num_yellow;
    frequency(k+1)= num_cooperator/amount;
end




end

function [maxX maxY maxZ]=locateMax(matrix)
%locateMax          Find the location of the first max number of matrix.
%
%Synopsis:          [maxX maxY maxZ]=locateMax(matrix)
%
%Input:             matrix: matrix
%
%Output:            maxX = the X coordinate
%                   maxY = the Y coordinate
%                   maxZ = the Z coordinate
%
%Notes:             Function used for coursework of Evolution of Complexity
%                   Nowak and May (1992) Evolutionary Games and Spatial Chaos,
%                   Nature 359, 826
tempmax=0;
maxX=1;
maxY=1;
maxZ=1;
for i = 1: 3
    for j =1 : 3
        for k=1:3
            if(matrix(i,j,k)>tempmax)
                tempmax=matrix(i,j,k);
                maxX=i;
                maxY=j;
                maxZ=k;
            end
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