function [a, P_a] = content_requested_label(alpha,number,T)
%zipf_dis generate the probability of zipf_distribution
%   P_acc shows the probability distribution function
%   P_each shows the probability density function
% have tested the reality.



P_each = zeros(1,number);    % ����ÿ���ļ��ĸ���
for i = 1 : number
    P_each(i) = i^(-alpha);
end
P_sum = sum(P_each(:));
P_each = P_each ./ P_sum;    % �������ʽ�õ�����

% % P_acc = zeros(1,number);
% % for i = 1 : number
% %     if i == 1
% %         P_acc(i) = P_each(i);
% %     else
% %         P_acc(i) = P_acc(i-1) + P_each(i);
% %     end
% % end

% % ����
% % P_acc = cumsum(P_each);

N = number;           % ��Ҫ������ĸ���
a = zeros(N,T);  % ��������������
P_a = zeros(N,T);% �������Ӧ�ĸ���
n = 0; 

for timeslot=1:1:T
    n = 0;
while n<N
    t = randperm(number,1);% ����[1,200]�������
    r = rand(1);           % ����[0,1]���ȷֲ������
    if r <= P_each(t)      % ��������rС��f(t)�����ɸ�t����������a��
        n = n + 1;         % ������һ
        a(n,timeslot) = t;          % ��n������ֵΪt
        P_a(n,timeslot) = P_each(t);% ��n�����ĸ���ΪP_each��t��
    end
end
end

end





