clear all;close all;clc
G = 6;
d = 3;
q = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];

%q = [0.5];
itetime = 1000;
delta = 0:0.0001:0.2;
%delta = [0.0783]
B1 =[];
B2 = [];
A1 = [];
A2 = [];
for i = 1:length(q)
    alpha1 = delta;
    alpha2 = delta;
    ga = [];
    for i_1 = 1:length(delta)
        for i_2 = 1:itetime
            beta1 = 1 - (1-((1-q(i))/2)*alpha1(i_1) - ((1+q(i))/2)*alpha2(i_1))^(G*d-1);            
            beta2 = 1 - (1-((1+q(i))/2)*alpha1(i_1) - ((1-q(i))/2)*alpha2(i_1))^(2*G*d-1);
            %B1 = [B1,beta1];
            %B2 = [B2,beta2];
            alpha1(i_1) = delta(i_1)*(((1-q(i))/2)*beta1 + ((1+q(i))/2)*beta2)^(d-1);
            alpha2(i_1) = delta(i_1)*(((1+q(i))/2)*beta1 + ((1-q(i))/2)*beta2)^(2*d-1);
            %A1 = [A1, alpha1(i_1)];
            %A2 = [A2, alpha2(i_1)];
            gamma = 1 - (alpha1(i_1))^d*2/3 - (alpha2(i_1))^(2*d)/3;
        end
        beta_1(i_1) = beta1;
        beta_2(i_1) = beta2;
        ga = [ga, gamma];
    end
    gamma_(i,:) = ga;        
    alpha_1(i,:) = alpha1;
    alpha_2(i,:) = alpha2;
end

figure
plot(delta,alpha_1(1,:),'Linewidth', 2)
hold on
plot(delta,alpha_1(2,:),'Linewidth', 2)
plot(delta,alpha_1(3,:),'Linewidth', 2)
plot(delta,alpha_1(4,:),'Linewidth', 2)
plot(delta,alpha_1(5,:),'Linewidth', 2)
plot(delta,alpha_1(6,:),'Linewidth', 2)
plot(delta,alpha_1(7,:),'Linewidth', 2)
plot(delta,alpha_1(8,:),'Linewidth', 2, 'Color', [1 0 0])
plot(delta,alpha_1(9,:),'Linewidth', 2, 'Color', [0 0 0])
plot(delta,alpha_1(10,:),'Linewidth', 2, 'Color', [1 0 1])
legend('Location', 'northwest' )
legend(['$q =$', num2str(q(1))], ['$q =$', num2str(q(2))], ['$q =$', num2str(q(3))], ['$q =$', num2str(q(4))], ['$q =$', num2str(q(5))], ['$q =$', num2str(q(6))], ['$q =$', num2str(q(7))], ['$q =$', num2str(q(8))], ['$q =$', num2str(q(9))], ['$q =$', num2str(q(10))],'Interpreter', 'LaTeX','FontSize',12)
xlabel('$\delta$', 'FontSize', 15, 'Interpreter', 'LaTeX')
ylabel('$\lim_{i \to \infty}\alpha^{(i)}_d$', 'FontSize', 15, 'Interpreter', 'LaTeX')
%ylim([10^-10 1]);
grid on
saveas(gcf,'nd3G6a1.png')

figure
semilogy(delta,alpha_1(1,:),'Linewidth', 2)
hold on
plot(delta,alpha_1(2,:),'Linewidth', 2)
plot(delta,alpha_1(3,:),'Linewidth', 2)
plot(delta,alpha_1(4,:),'Linewidth', 2)
plot(delta,alpha_1(5,:),'Linewidth', 2)
plot(delta,alpha_1(6,:),'Linewidth', 2)
plot(delta,alpha_1(7,:),'Linewidth', 2)
plot(delta,alpha_1(8,:),'Linewidth', 2, 'Color', [1 0 0])
plot(delta,alpha_1(9,:),'Linewidth', 2, 'Color', [0 0 0])
plot(delta,alpha_1(10,:),'Linewidth', 2, 'Color', [1 0 1])
legend('Location', 'northwest' )
legend(['$q =$', num2str(q(1))], ['$q =$', num2str(q(2))], ['$q =$', num2str(q(3))], ['$q =$', num2str(q(4))], ['$q =$', num2str(q(5))], ['$q =$', num2str(q(6))], ['$q =$', num2str(q(7))], ['$q =$', num2str(q(8))], ['$q =$', num2str(q(9))], ['$q =$', num2str(q(10))],'Interpreter', 'LaTeX','FontSize',12)
xlabel('$\delta$', 'FontSize', 15, 'Interpreter', 'LaTeX')
ylabel('$\lim_{i \to \infty}\alpha^{(i)}_d$', 'FontSize', 15, 'Interpreter', 'LaTeX')
%ylim([10^-10 1]);
grid on
saveas(gcf,'nd3G6a1_log.png')

figure
plot(delta,alpha_2(1,:),'Linewidth', 2)
hold on
plot(delta,alpha_2(2,:),'Linewidth', 2)
plot(delta,alpha_2(3,:),'Linewidth', 2)
plot(delta,alpha_2(4,:),'Linewidth', 2)
plot(delta,alpha_2(5,:),'Linewidth', 2)
plot(delta,alpha_2(6,:),'Linewidth', 2)
plot(delta,alpha_2(7,:),'Linewidth', 2)
plot(delta,alpha_2(8,:),'Linewidth', 2, 'Color', [1 0 0])
plot(delta,alpha_2(9,:),'Linewidth', 2, 'Color', [0 0 0])
plot(delta,alpha_2(10,:),'Linewidth', 2, 'Color', [1 0 1])
legend('Location', 'northwest' )
legend(['$q =$', num2str(q(1))], ['$q =$', num2str(q(2))], ['$q =$', num2str(q(3))], ['$q =$', num2str(q(4))], ['$q =$', num2str(q(5))], ['$q =$', num2str(q(6))], ['$q =$', num2str(q(7))], ['$q =$', num2str(q(8))], ['$q =$', num2str(q(9))], ['$q =$', num2str(q(10))],'Interpreter', 'LaTeX','FontSize',12)
xlabel('$\delta$', 'FontSize', 15, 'Interpreter', 'LaTeX')
ylabel('$\lim_{i \to \infty}\alpha^{(i)}_{2d}$', 'FontSize', 15, 'Interpreter', 'LaTeX')
%ylim([10^-10 1]);
title('d = 3, G = 6')
grid on
saveas(gcf,'nd3G6a2.png')

figure
semilogy(delta,alpha_2(1,:),'Linewidth', 2)
hold on
plot(delta,alpha_2(2,:),'Linewidth', 2)
plot(delta,alpha_2(3,:),'Linewidth', 2)
plot(delta,alpha_2(4,:),'Linewidth', 2)
plot(delta,alpha_2(5,:),'Linewidth', 2)
plot(delta,alpha_2(6,:),'Linewidth', 2)
plot(delta,alpha_2(7,:),'Linewidth', 2)
plot(delta,alpha_2(8,:),'Linewidth', 2, 'Color', [1 0 0])
plot(delta,alpha_2(9,:),'Linewidth', 2, 'Color', [0 0 0])
plot(delta,alpha_2(10,:),'Linewidth', 2, 'Color', [1 0 1])
legend('Location', 'northwest' )
legend(['$q =$', num2str(q(1))], ['$q =$', num2str(q(2))], ['$q =$', num2str(q(3))], ['$q =$', num2str(q(4))], ['$q =$', num2str(q(5))], ['$q =$', num2str(q(6))], ['$q =$', num2str(q(7))], ['$q =$', num2str(q(8))], ['$q =$', num2str(q(9))], ['$q =$', num2str(q(10))],'Interpreter', 'LaTeX','FontSize',12)
xlabel('$\delta$', 'FontSize', 15, 'Interpreter', 'LaTeX')
ylabel('$\lim_{i \to \infty}\alpha^{(i)}_{2d}$', 'FontSize', 15, 'Interpreter', 'LaTeX')
%ylim([10^-10 1]);
title('d = 3, G = 6')
grid on
saveas(gcf,'nd3G6a2_log.png')

figure
plot(delta,gamma_(1,:),'Linewidth', 2)
hold on
plot(delta,gamma_(2,:),'Linewidth', 2)
plot(delta,gamma_(3,:),'Linewidth', 2)
plot(delta,gamma_(4,:),'Linewidth', 2)
plot(delta,gamma_(5,:),'Linewidth', 2)
plot(delta,gamma_(6,:),'Linewidth', 2)
plot(delta,gamma_(7,:),'Linewidth', 2)
plot(delta,gamma_(8,:),'Linewidth', 2, 'Color', [1 0 0])
plot(delta,gamma_(9,:),'Linewidth', 2, 'Color', [0 0 0])
plot(delta,gamma_(10,:),'Linewidth', 2, 'Color', [1 0 1])
legend('Location', 'northwest' )
legend(['$q =$', num2str(q(1))], ['$q =$', num2str(q(2))], ['$q =$', num2str(q(3))], ['$q =$', num2str(q(4))], ['$q =$', num2str(q(5))], ['$q =$', num2str(q(6))], ['$q =$', num2str(q(7))], ['$q =$', num2str(q(8))], ['$q =$', num2str(q(9))], ['$q =$', num2str(q(10))],'Interpreter', 'LaTeX','FontSize',12)
xlabel('$\delta$', 'FontSize', 15, 'Interpreter', 'LaTeX')
ylabel('$\lim_{i \to \infty}\gamma^{(i)}$', 'FontSize', 15, 'Interpreter', 'LaTeX')
%ylim([10^-10 1]);
title('d = 3, G = 6')
grid on
saveas(gcf,'nd3G6gamma.png')

figure
semilogy(delta,gamma_(1,:),'Linewidth', 2)
hold on
plot(delta,gamma_(2,:),'Linewidth', 2)
plot(delta,gamma_(3,:),'Linewidth', 2)
plot(delta,gamma_(4,:),'Linewidth', 2)
plot(delta,gamma_(5,:),'Linewidth', 2)
plot(delta,gamma_(6,:),'Linewidth', 2)
plot(delta,gamma_(7,:),'Linewidth', 2)
plot(delta,gamma_(8,:),'Linewidth', 2, 'Color', [1 0 0])
plot(delta,gamma_(9,:),'Linewidth', 2, 'Color', [0 0 0])
plot(delta,gamma_(10,:),'Linewidth', 2, 'Color', [1 0 1])
legend('Location', 'northwest' )
legend(['$q =$', num2str(q(1))], ['$q =$', num2str(q(2))], ['$q =$', num2str(q(3))], ['$q =$', num2str(q(4))], ['$q =$', num2str(q(5))], ['$q =$', num2str(q(6))], ['$q =$', num2str(q(7))], ['$q =$', num2str(q(8))], ['$q =$', num2str(q(9))], ['$q =$', num2str(q(10))],'Interpreter', 'LaTeX','FontSize',12)
xlabel('$\delta$', 'FontSize', 15, 'Interpreter', 'LaTeX')
ylabel('$\lim_{i \to \infty}\gamma^{(i)}$', 'FontSize', 15, 'Interpreter', 'LaTeX')
%ylim([10^-10 1]);
title('d = 3, G = 6')
grid on
saveas(gcf,'nd3G6gamma_log.png')

writematrix(alpha_1, 'd3G6alpha1.xlsx')
writematrix(alpha_2, 'd3G6alpha2.xlsx')
writematrix(gamma_, 'd3G6gamma.xlsx')

lim3=[];
for i = 1:length(q)
    B = (3*G*d-2)*(1+(q(i))^2)/2;
    C = (G*d-1)*(2*G*d-1)*(q(i))^2;
    lim3(11-i) = 1/(0.5*(B+sqrt(B^2-4*C)));
end
lim3 = [0.0312517297261044	0.0334366084082166	0.0350681944110833	0.0362334722277515	0.0370530030423041	0.0376249559709945	0.0380167371921597	0.0382714477978450	0.0384151002888307	0.0384615384615385];

delta_f_1 = [0.1362 0.1387 0.1421 0.1468 0.1489 0.1369 0.1219 0.1067 0.0927 0.08];
delta_f_2 = [0.1362 0.1387 0.1421 0.1468 0.1489 0.1369 0.1219 0.1067 0.0927 0.08];

figure
hold on
plot(q,delta_f_1,'Linewidth', 2)
plot(q,delta_f_2,'Linewidth', 2)
legend('d=3','2d=6')

xlabel('$q$', 'FontSize', 15, 'Interpreter', 'LaTeX')
ylabel('$\delta^{*}(q)$', 'FontSize', 15, 'Interpreter', 'LaTeX')
grid on

%{
figure(1)
semilogy(q,alpha_1,'Linewidth', 2, 'color', [49 133 156]/255)
hold on
xlabel('$q$', 'FontSize', 15, 'Interpreter', 'LaTeX')
ylabel('$\delta^{*}(q)$', 'FontSize', 15, 'Interpreter', 'LaTeX')
legend(['$\gamma =$', num2str(gamma(1))], 'Interpreter', 'LaTeX','FontSize',12)
%axis([0 2 10^-10 1]);
grid on
%}
