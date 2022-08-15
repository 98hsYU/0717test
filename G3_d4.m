clear all;close all;clc
G = 3;
d = 4;
q = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
%q = 0.3;
itetime = 1000;
delta = 0:0.0001:0.34;

for i = 1:length(q)
    alpha1 = delta;
    alpha2 = delta;
    ga = [];
    for i_1 = 1:length(delta)
        for i_2 = 1:itetime
            beta1 = 1 - (1-((1-q(i))/2)*alpha1(i_1) - ((1+q(i))/2)*alpha2(i_1))^(G*d-1);
            beta2 = 1 - (1-((1+q(i))/2)*alpha1(i_1) - ((1-q(i))/2)*alpha2(i_1))^(2*G*d-1);
            alpha1(i_1) = delta(i_1)*(((1-q(i))/2)*beta1 + ((1+q(i))/2)*beta2)^(d-1);
            alpha2(i_1) = delta(i_1)*(((1+q(i))/2)*beta1 + ((1-q(i))/2)*beta2)^(2*d-1);
            gamma = 1 - (alpha1(i_1))^d*2/3 - (alpha2(i_1))^(2*d)/3;
        end
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
title('d = 4, G = 3')
grid on
saveas(gcf,'nd4G3a1.png')

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
title('d = 4, G = 3')
grid on
saveas(gcf,'nd4G3a1_log.png')

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
title('d = 4, G = 3')
grid on
saveas(gcf,'nd4G3a2.png')

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
title('d = 4, G = 3')
grid on
saveas(gcf,'nd4G3a2_log.png')

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
title('d = 4, G = 3')
grid on
saveas(gcf,'nd4G3gamma.png')

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
title('d = 4, G = 3')
grid on
saveas(gcf,'nd4G3gamma_log.png')

writematrix(alpha_1, 'd4G3alpha1.xlsx')
writematrix(alpha_2, 'd4G3alpha2.xlsx')
writematrix(gamma_, 'd4G3gamma.xlsx')

delta_f_1 = [0.2425 0.2476 0.2542 0.2628 0.2732 0.2845 0.2633 0.2253 0.1892 0.1569];
delta_f_2 = [0.2425 0.2476 0.2542 0.2628 0.2732 0.2845 0.2633 0.2253 0.1892 0.1569];

lim4=[];
for i = 1:length(q)
    B = (3*G*d-2)*(1+(q(i))^2)/2;
    C = (G*d-1)*(2*G*d-1)*(q(i))^2;
    lim4(11-i) = 1/(0.5*(B+sqrt(B^2-4*C)));
end
lim4 = [0.0475707275166071	0.0509361659629108	0.0534733299858501	0.0552996042796796	0.0565911409403798	0.0574958181129468	0.0581169758324653	0.0585214097657115	0.0587497008856143	0.0588235294117647];

figure
hold on
plot(q,delta_f_1,'Linewidth', 2)
plot(q,delta_f_2,'Linewidth', 2)
legend('d=4','2d=8')
xlabel('$q$', 'FontSize', 15, 'Interpreter', 'LaTeX')
ylabel('$\delta^{*}(q)$', 'FontSize', 15, 'Interpreter', 'LaTeX')
grid on


delta_f_d2 = [0.1156 0.107 0.0979 0.0888 0.0802 0.0722 0.0649 0.0583 0.0525 0.0473];
delta_f_2d4 = [0.1175 0.1088 0.0996 0.0904 0.0816 0.0735 0.0661 0.0594 0.0536 0.0485];
