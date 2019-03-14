function R = montecar_twoterminal(G,label,source_node,terminal_node)
G=[0 1 0 0 0 1;1 0 1 0 0 1;0 1 0 1 1 1;0 0 1 0 1 0;0 0 1 1 0 1;1 1 1 0 1 0];
label=[1 2 3 4 5 6];
tic
source_node=1;
terminal_node=4;
M=100;
P=0.9*G;
k=0;
success=0;

while k<=M
    s_zero=[];
    s=[source_node];
    while 1
        node_i=s(randperm(length(s),1)); % randperm（n,k） returns a row vector containing a random permutation of the integers from 1 to n inclusive.
        s_star=unique([s_zero s]);  % unique(X) 去掉数组中重复的元素

        s_star_bar=setdiff(label,s_star); % 返回不在s_star中的点
        node_j=s_star_bar(randperm(length(s_star_bar),1));
        p_star=random('unif',0,1);
        if G(node_i,node_j)==1 && node_i~= node_j
            if P(node_i,node_j)>p_star||P(node_i,node_j)==1
                if node_j==terminal_node
                   success=success+1;
                   break;
                else 
                    s(length(s)+1)=node_j;
                    continue;
                end
            else
                s_star(length(s_star)+1)=node_j;
                continue;
            end
        else
            if length(s)==1
                break;
            else
                position=find(s==node_i);
                s(position)=[];
                s(length(s)+1)=node_i;
                continue;
            end
        end
    end
 k=k+1;
end
success
k
R=success/M
toc
%Rel(G,0.9*G,[1,4])




   
        
        
