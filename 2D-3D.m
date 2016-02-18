load('D:\Matlab2014a\bin\data2d_test_mat\0000.mat')
load('D:\Matlab2014a\bin\data2d_train_mat\0000.mat')
load('D:\Matlab2014a\bin\data3d_train_mat\0000.mat')

%% NN
rand('state',0)
nn = nnsetup([12 100 6]);
nn.weightPenaltyL2 = 1e-4;  %  L2 weight decay
opts.numepochs =  200;        %  Number of full sweeps through data
opts.batchsize = 100;       %  Take a mean gradient step over this many samples
nn = nntrain(nn, data2dtrain, data3d2train, opts);
test_y = nnpredict(nn, data2dtest);

%% picAngle(test_y);
for i = 1501:2000;
    figure(i);
    P0 = [0,0,0];
    %scale1 = 1 / ((test_y(i, 1)^2 + test_y(i, 2)^2 + test_y(i, 3)^2) ^ (1/2));
    %scale2 = 1 / ((test_y(i, 4)^2 + test_y(i, 5)^2 + test_y(i, 6)^2) ^ (1/2));
    P1 = test_y(i, 1:3);
    P2 = test_y(i, 4:6);
    hold on;
    x = [P0(1), P1(1), P2(1)];
    y = [P0(2), P1(2), P2(2)];
    z = [P0(3), P1(3), P2(3)];
    plot3(x, y, z, '*');
    line([P0(1), P1(1)], [P0(2), P1(2)], [P0(3), P1(3)]);
    line([P0(1), P2(1)], [P0(2), P2(2)], [P0(3), P2(3)]);
    set(gca,'XLim',[0 2.0]);
    set(gca,'XTick',[0:0.5:2.0]);
    set(gca,'XTickLabel',[0:0.5:2.0]);
    set(gca,'YLim',[0 2.0]);
    set(gca,'YTick',[0:0.5:2.0]);
    set(gca,'YTickLabel',[0:0.5:2.0]);
    set(gca,'ZLim',[0 2.0]);
    set(gca,'ZTick',[0:0.5:2.0]);
    set(gca,'ZTickLabel',[0:0.5:2.0]); 
    grid on;
    view(90, 0);
    print(i, '-dpng', [num2str(i) '-res']);
    %close figure(i);
end
