function  modeltest()

%[s_100,s_001,s_000,s_110,s_111,s_011,s_101,s_010] = modeltest_1(ps,s_nr,u1,u2)
s_nr = 2
[s_100,s_001,s_000,s_110,s_111,s_011,s_101,s_010] = modeltest_1(2,s_nr,1,1)
s_r = s_111+s_010+s_100
s_green = s_110
s_b = s_011+s_000+s_101
s_gray = s_001

b_er_1 = (s_r.*2+s_green.*3+s_b.*1)./3

[s_100,s_001,s_000,s_110,s_111,s_011,s_101,s_010] = modeltest_1((1+sqrt(3))^2,s_nr,1+sqrt(3),0)
s_r = s_001+s_010+s_100
s_green = s_000
s_b = s_011+s_110+s_101
s_gray = s_111

b_er_2 = (s_r.*2+s_green.*3+s_b.*1)./3

b_er = (b_er_1+b_er_2)./2
b_er = vpa(b_er)



