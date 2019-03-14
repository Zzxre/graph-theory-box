function [R,toc] = st_rel_montecar(G,s,t,M)
%G=(V,E) SOURCE NODE S AND TERMINAL NODE T M:replication number
%R: MONTE CARLO ALGORITHM RESULTS


% G = [0 1 1 0 0 0 1;
%     1 0 1 0 0 0 0;
%     1 1 0 1 1 0 0;
%     0 0 1 0 1 0 0;
%     0 0 1 1 0 1 0;
%     0 0 0 0 1 0 1;
%     1 0 0 0 0 1 0];
% %G22  R -EXACT = 0.88290
% G = [0 1 1 0;
%     1 0 1 0;
%     1 1 0 1;
%     0 0 1 0];
% %G21  R-EXACT = 0.94851
% G = [0 1 0 0 1;
%      1 0 1 0 0;
%      0 1 0 1 0;
%      0 0 1 0 1;
%      1 0 0 1 0];
% G = [0 1 1 0 0 ;
%     1 0 0 1 0;
%     1 0 0 0 1;
%     0 1 0 0 1;
%     0 0 1 1 0]
% G = [0 1 0;
%     1 0 1;
%     0 1 0]

% s = 1;
% t = 4;
T = 0; %success number
% M = 10000; %replication number
p = 0.9;
P = p.*G;
k = 0;


flag1 = 0;
flag2 = 0;
flag3 = 0;
flag4 = 0;
flag5 = 0;
flag6 = 0;
while 1
    S_0 = []; %S_0 empty set
    S = s;
    while 2
        if flag1 == 0
            i = S( unidrnd(length(S) ));  % random choose a number in S          
            S_star = [S, S_0];  %S_1 £ºS*
            %STEP 3 FIRST FIND ALL NEIRGHHOOD OF S_1
            while 3
                if flag2 == 0
                    a = G(i,1:end);
                    a_ind = find(a == 1);
                    b = a_ind;
                    b = unique(b);
                    S_2 = setdiff(b,S_star);  %NODES SET ONT IN S_1
                    S_2 = unique(S_2);
                    while 4
                        if flag3 == 0
                            while 5                               
                                if flag4 == 0
                                    while 6
                                        if flag5 == 0
                                            while 7                                                
                                                if isempty(S_2) || flag6 == 1                                                                                                      
                                                    if length(S) == 1 || flag6 == 1
                                                        flag6 = 0;
                                                        if k < M - 1
                                                            k = k + 1;
                                                            flag6 = 0;
                                                            flag2 = 1;
                                                            flag3 = 1;
                                                            flag4 = 1;
                                                            flag5 = 1;
                                                            flag1 = 1;
                                                            
                                                            break
                                                        else
%                                                             T
%                                                             M
%                                                             k
                                                            R = T/M;
                                                           
                                                            return
                                                        end
                                                    else                                                       
                                                        S = setdiff(S,i);%%%%????
                                                        S_0 = [S_0, i];
                                                        S = unique(S);
                                                        S_0 = unique(S_0);
                                                        flag1 = 0;
                                                        flag2 = 1;
                                                        flag3 = 1;
                                                        flag4 = 1;
                                                        flag5 = 1;
                                                        flag6 = 0;
                                                        
                                                        break
                                                    end
                                                else
                                                    flag6 = 0;
                                                    j = S_2( unidrnd( length(S_2) ) );
                                                    r = rand(1,1);
                                                    
                                                    if p > r                                   
                                                        if j == t
                                                            T = T + 1;
                                                            flag1 = 0;
                                                            flag2 = 0;
                                                            flag3 = 0;
                                                            flag4 = 0;
                                                            flag6 = 1;
                                                            flag5 = 0;
                                                            break %%%
                                                        else
                                                            S = [S,j];
                                                            S = unique(S);
                                                            flag6 = 0;
                                                            flag1 = 0;
                                                            flag5 = 1;
                                                            flag4 = 1;
                                                            flag3 = 1;
                                                            flag2 = 1;
                                                            break
                                                        end                                                
                                                    else
                                                        S_star = [S_star, j];
                                                        S_star = unique(S_star);
                                                        flag6 = 0;
                                                        flag2 = 0;
                                                        flag1 = 0;
                                                        flag5 = 1;
                                                        flag4 = 1;
                                                        flag3 = 1;
                                                        break
                                                    end
                                                end
                                            end
                                        else
                                            flag5 = 0;
                                            break
                                        end                            
                                    end
                                else
                                    flag4 = 0;
                                    break
                                end
                            end
                        else
                            flag3 = 0;
                            break
                        end
                    end
                else
                    flag2 = 0;
                    break
                end
            end
        else
            flag1 = 0;
            break
        end
    end
%     R = T/M;
end
