Edf = 1:.1:2;
Qe = [-.57,-.39,-.22,-.08,.04,.16,.27,.38,.48,.57,.67];
dl = [64,54,47,42,38,36,34,31,29,27,26];

subplot(2,1,1)
plot(Edf,Qe)
title('Problem 4')
ylabel('Q_E')
xlabel('E_{df}')
subplot(2,1,2)
plot(Edf,dl)
xlabel('E_{df}')
ylabel('\delta')

