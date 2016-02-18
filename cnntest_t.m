function  h = cnntest_t(net, x)
    %  feedforward
    net = cnnff(net, x);
    o = net.o;
    [t, h] = max(net.o);
    %[~, a] = max(y);
    %bad = find(h ~= a);

    %er = numel(bad) / size(y, 2);
end