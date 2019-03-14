function modeltest1_2%(k)
h = 6.62606896e-34;
f = 193.1e12;
b = 50e9;
nf = 4;

ps = 10;
g_ain = 1./( (1./2).^(100./15) );
p_n = 2.*pi.*h.*f.*b.*(nf - 1./g_ain)
p_n = 1000*p_n;

%k_1 = 1.1348e-08
%p_e = sqrt(k_1*ps)
 p_e = 2/3.*p_n
 k_1 = 1.0693e-04
%k_1 = 1.1433e-08
p_e = k_1*ps^2
s_nr = ps./(k.*(p_n+p_e));
s_nr = 10.*log10(s_nr)

