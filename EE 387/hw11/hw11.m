clearvars; clc;

wr = 2 * pi * 60;
syms t;
theta = wr * t;
A = [cos(theta), sin(theta), 0;
    -sin(theta), cos(theta), 0;
    0, 0, 1];
B = [(2/3),(-1/3),(-1/3);
    0, sqrt(3)/3,-sqrt(3)/3;
    1/3,1/3,1/3];

syms Ll; syms LA; syms LB; syms Lmd; syms Lmq;

Ls = [Ll + LA+ LB*cos(2*theta), -.5*LA+ LB*cos(2*theta-(2*pi/3)), -.5*LA+ LB*cos(2*theta+(2*pi/3));
        -.5*LA+ LB*cos(2*theta-(2*pi/3)), Ll + LA+ LB*cos(2*theta+(2*pi/3)), -.5*LA+ LB*cos(2*theta);
        -.5*LA+ LB*cos(2*theta+(2*pi/3)), -.5*LA+ LB*cos(2*theta), Ll+LA+ LB*cos(2*theta-(2*pi/3));];
    
Lsr = [Lmd*cos(theta), Lmd*cos(theta), -Lmq*sin(theta), -Lmq*sin(theta);
       Lmd*cos(theta-(2*pi/3)), Lmd*cos(theta-(2*pi/3)), -Lmq*sin(theta-(2*pi/3)), -Lmq*sin(theta-(2*pi/3));
       Lmd*cos(theta+(2*pi/3)), Lmd*cos(theta+(2*pi/3)), -Lmq*sin(theta+(2*pi/3)), -Lmq*sin(theta+(2*pi/3));];
   
   
diff(Ls) 

