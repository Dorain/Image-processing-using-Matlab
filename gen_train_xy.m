function gen_train_xy

path =  '/Users/Dorain/Desktop/test/edge';
off_mat = [path, '/off_edge.mat'];
onc_mat = [path, '/on_corner.mat'];
one_mat = [path, '/on_edge.mat'];

%m生成空白at
train_x_mat = [path, '/train_x.mat'];
train_y_mat = [path, '/train_y.mat'];

load (off_mat);
load (onc_mat);
load (one_mat);

%训练数据
sel_length = 10000;
train_x_sort = [];
train_y_sort = zeros(sel_length * 3, 2);

for i = 1: sel_length
    train_x_sort(i, :) = off(i, :);
    train_y_sort(i, 1) = 1;
end

for i = 1: sel_length
    train_x_sort(sel_length + i, :) = onc(i, :);
    train_y_sort(sel_length + i, 2) = 1;
end

for i = 1: sel_length
    train_x_sort(sel_length * 2 + i, :) = one(i, :);
    train_y_sort(sel_length * 2 + i, 2) = 1;
end

train_x = zeros(sel_length * 3, 25);
train_y = zeros(sel_length * 3, 2);
randid = randperm(sel_length * 3);
for i = 1 : length(randid)
    train_x(i, :) = train_x_sort(randid(i), :);
    train_y(i, :) = train_y_sort(randid(i), :);
end
save(train_x_mat, 'train_x');
save(train_y_mat, 'train_y');


end