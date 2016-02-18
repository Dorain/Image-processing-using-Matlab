function trans_mat
%路径
path =  '/Users/Dorain/Desktop/test/edge';
off_path = [path, '/off_edge/4'];
onc_path = [path, '/on_corner/4'];
one_path = [path, '/on_edge/4'];

%读入样品图片列表
off_list = [path, '/off_edge.txt'];
onc_list = [path, '/on_corner.txt'];
one_list = [path, '/on_edge.txt'];

off_ids = textread(off_list, '%s');
onc_ids = textread(onc_list, '%s');
one_ids = textread(one_list, '%s');

%路径及文件名，以便读取
off_at = @(i) sprintf('%s/%s',off_path, off_ids{i});
onc_at = @(i) sprintf('%s/%s',onc_path, onc_ids{i});
one_at = @(i) sprintf('%s/%s',one_path, one_ids{i});

%调用所提供mat 10000*25 double型
off_mat = [path, '/off_edge.mat'];
onc_mat = [path, '/on_corner.mat'];
one_mat = [path, '/on_edge.mat'];
all_mat = [path, '/all.mat'];

%训练数据量10000
select_length = 12000;

off = zeros(select_length, 25);
onc = zeros(select_length, 25);
one = zeros(select_length, 25);
all = zeros(select_length * 3, 25);

%打乱数据顺序
randid = randperm(select_length);
for i = 1 : length(randid)
    %随机读入数据至mat 5*5
    pic_off = imread(off_at(randid(i)));
    pic_onc = imread(onc_at(randid(i)));
    pic_one = imread(one_at(randid(i)));
    
    %将数据由5*5转化为25
    tmp_off = [];
    tmp_onc = [];
    tmp_one = [];
    for j = 1 : 5
        tmp_off = [tmp_off, pic_off(j, :)];
        tmp_onc = [tmp_onc, pic_onc(j, :)];
        tmp_one = [tmp_one, pic_one(j, :)];
    end
    off(i, :) = tmp_off;
    onc(i, :) = tmp_onc;
    one(i, :) = tmp_one;
end

%数据存入所提供mat
save(off_mat,'off');
save(onc_mat, 'onc');
save(one_mat, 'one');

imshow(off.mat)
end
