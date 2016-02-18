function gen_test_xy

path =  '/Users/Dorain/Desktop/test/edge';
off_mat = [path, '/off_edge.mat'];
onc_mat = [path, '/on_corner.mat'];
one_mat = [path, '/on_edge.mat'];

%调用所提供mat
test_x_mat = [path, '/test_x.mat'];
test_y_mat = [path, '/test_y.mat'];

load (off_mat);
load (onc_mat);
load (one_mat);

%训练数据
sel_length = 2000;
train_length = 10000
test_x_sort = [];
test_y_sort = zeros(sel_length * 3, 2);

for i = 1: sel_length
    test_x_sort(i, :) = off(train_length+i, :);
    test_y_sort(i, 1) = 1;
end

for i = 1: sel_length
    test_x_sort(sel_length + i, :) = onc(train_length + i, :);
    test_y_sort(sel_length + i, 2) = 1;
end

for i = 1: sel_length
    test_x_sort(sel_length * 2 + i, :) = one(train_length + i, :);
    test_y_sort(sel_length * 2 + i, 2) = 1;
end

test_x = zeros(sel_length * 3, 25);
test_y = zeros(sel_length * 3, 2);
randid = randperm(sel_length * 3);
for i = 1 : length(randid)
    test_x(i, :) = test_x_sort(randid(i), :);
    test_y(i, :) = test_y_sort(randid(i), :);
end
save(test_x_mat, 'test_x');
save(test_y_mat, 'test_y');


end