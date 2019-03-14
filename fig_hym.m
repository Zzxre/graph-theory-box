function fig_hym

k = 1
r = 30
r1 = 1
g1 = 20
g2 = 56
e = 5
w = 20
s = -3:0.01:3;
delta = 0

b = (-i.*e) ./ ( (i.*s + k) +  (g1.^2) ./ ( (i.*s + r./2) + w.^2./(i.*s + i.*delta + r1./2) ) +  (g2).^2 ./ ( (i.*s+r./2)+ w.^2./(i.*s+r1./2)));

a = sqrt(k).*b./e
c = a.*conj(a)

subplot(1,3,3)
plot(s,c,'--b','LineWidth',1)

hold on
delta = 50

b = (-i.*e) ./ ( (i.*s + k) +  (g1.^2) ./ ( (i.*s + r./2) + w.^2./(i.*s + i.*delta + r1./2) ) +  (g2).^2 ./ ( (i.*s+r./2)+ w.^2./(i.*s+r1./2)));

a = sqrt(k).*b./e;
c = a.*conj(a);
plot(s,c,'r','LineWidth',1)
hold off

xlabel('\Delta\it_s')
ylabel('\itI_t / I_i_n')
legend boxoff;
legend('\Delta_r_1_r_2=0','\Delta_r_1_r_2=50')
set(gca,'YTick',[0:0.005:0.04]);
set(gca,'XTick',[-3:1:3]);
set(gca,'linewidth',2);
axis([-3 3 -0.001 0.04])

k = 1
r = 30
r1 = 0.01
g1 = 20
g2 = 56
e = 5
w = 20
s = -3:0.01:3;
delta = 0

b = (-i.*e) ./ ( (i.*s + k) +  (g1.^2) ./ ( (i.*s + r./2) + w.^2./(i.*s + i.*delta + r1./2) ) +  (g2).^2 ./ ( (i.*s+r./2)+ w.^2./(i.*s+r1./2)));

a = sqrt(k).*b./e
c = a.*conj(a)
subplot(1,3,1)
plot(s,c,'--b','LineWidth',1)

hold on
delta = 50

b = (-i.*e) ./ ( (i.*s + k) +  (g1.^2) ./ ( (i.*s + r./2) + w.^2./(i.*s + i.*delta + r1./2) ) +  (g2).^2 ./ ( (i.*s+r./2)+ w.^2./(i.*s+r1./2)));

a = sqrt(k).*b./e;
c = a.*conj(a);
plot(s,c,'r','LineWidth',1)
hold off


xlabel('\Delta\it_s')
ylabel('\itI_t / I_i_n')
legend boxoff;
legend('\Delta_r_1_r_2=0','\Delta_r_1_r_2=50')
set(gca,'YTick',[0:0.2:1]);
set(gca,'XTick',[-3:1:3]);
set(gca,'linewidth',2);
axis([-3 3 -0.02 1])

k = 1
r = 30
r1 = 0.1
g1 = 20
g2 = 56
e = 5
w = 20
s = -3:0.01:3;
delta = 0

b = (-i.*e) ./ ( (i.*s + k) +  (g1.^2) ./ ( (i.*s + r./2) + w.^2./(i.*s + i.*delta + r1./2) ) +  (g2).^2 ./ ( (i.*s+r./2)+ w.^2./(i.*s+r1./2)));

a = sqrt(k).*b./e
c = a.*conj(a)
subplot(1,3,2)
plot(s,c,'--b','LineWidth',1)

hold on
delta = 50

b = (-i.*e) ./ ( (i.*s + k) +  (g1.^2) ./ ( (i.*s + r./2) + w.^2./(i.*s + i.*delta + r1./2) ) +  (g2).^2 ./ ( (i.*s+r./2)+ w.^2./(i.*s+r1./2)));

a = sqrt(k).*b./e;
c = a.*conj(a);
plot(s,c,'r','LineWidth',1)
hold off


xlabel('\Delta\it_s')
ylabel('\itI_t / I_i_n')
legend boxoff;
legend('\Delta_r_1_r_2=0','\Delta_r_1_r_2=50')
set(gca,'YTick',[0:0.1:0.5]);
set(gca,'XTick',[-3:1:3]);
set(gca,'linewidth',2);
axis([-3 3 -0.01 0.5])
set(gcf,'PaperType','a3');