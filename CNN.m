
path =  '/Users/Dorain/Desktop/test/edge';
train_x = [path, '/train_x.mat'];
train_y = [path, '/train_y.mat'];
test_x = [path, '/test_x.mat'];
test_y = [path, '/test_y.mat'];
load (train_x);
load (train_y);
load (test_x);
load (test_y);

train_x = double(reshape(train_x',5,5,30000))/255;
train_y = double(train_y');

test_x = double(reshape(test_x',5,5,6000))/255;
test_y = double(test_y');

rand('state',0)

cnn.layers = {
    struct('type', 'i') %input layer
    struct('type', 'c', 'outputmaps', 9, 'kernelsize', 3) %convolution layer
    %struct('type', 's', 'scale', 3) %sub sampling layer
    %struct('type', 'c', 'outputmaps', 10, 'kernelsize', 3) %convolution layer
    %struct('type', 's', 'scale', 2) %subsampling layer
};


opts.alpha = 0.1;
opts.batchsize = 50;
opts.numepochs = 100;

%%
cnn = cnnsetup(cnn, train_x, train_y);
cnn = cnntrain(cnn, train_x, train_y, opts);

%[er, bad] = cnntest(cnn, test_x, test_y);

%plot mean squared error
%figure; plot(cnn.rL);
%assert(er<0.12, 'Too big error');

%% testing

path_t =  '/Users/Dorain/Desktop/test/test_images/synthetic characters';
D = dir([path_t, '/*.bmp']);
lengh_t = length(D);
size_t = 240;

for i =1:lengsh_t
i
    pic_sort_t = imread(D(i).name);
    pic_sort_new = rgb2gray(pic_sort_t);
    pic_sort = double(pic_sort_new)/255;
    tmp_x_t = zeros(5);
    tmp_y_t = [];
    train_t = zeros(5, 5, 236*236);
    figure_t=[];
    for j = 1 : size_t-4
        for k = 1 :size_t-4
            tmp_x_t(:,:) = pic_sort(j:j+4, k:k+4);
            train_t(:,:,(j-1)*(size_t-4)+k) = tmp_x_t;
        end
    end
    tmp_y_t = 255*(cnntest_t(cnn,train_t)-1);
    %label = nnpredict(cnn,train_t);
  
  
for j = 1 : size_t-4
        for k = 1 :size_t-4
            
        figure_t(j,k)=uint8(tmp_y_t((j-1)*(size_t-4)+k));
        end;
  end;
      %c = strcat('num27_',num2str(k));
    C = strcat('/Users/Dorain/Desktop/output/',num2str(i),'.bmp');
    
     imwrite(figure_t,C);
     
     
end





%%
path_t_1 =  '/Users/Dorain/Desktop/test/test_images/natural scene';
D_1 = dir([path_t_1, '/*.jpg']);
lengh_t_1 = length(D_1);
size_t_1 = 512;

for i =1:lengh_t_1
i
    pic_sort_t_1 = imread(D_1(i).name);
    pic_sort_new_1 = rgb2gray(pic_sort_t_1);
    pic_sort_1 = double(pic_sort_new_1)/255;
    tmp_x_t_1 = zeros(5);
    tmp_y_t_1 = [];
    train_t_1 = zeros(5, 5, (size_t_1-4)*(size_t_1-4));
    figure_t_1=[];
    for j = 1 : size_t_1-4
        for k = 1 :size_t_1-4
            tmp_x_t_1(:,:) = pic_sort_1(j:j+4, k:k+4);
            train_t_1(:,:,(j-1)*(size_t_1-4)+k) = tmp_x_t_1;
        end
    end
    tmp_y_t_1 = 255*(cnntest_t(cnn,train_t_1)-1);
    %label = nnpredict(cnn,train_t);
  
  
for j = 1 : size_t-4
        for k = 1 :size_t-4
            
        figure_t(j,k)=uint8(tmp_y_t_1((j-1)*(size_t_1-4)+k));
        end;
  end;
      %c = strcat('num27_',num2str(k));
  C = strcat('/Users/Dorain/Desktop/output/',num2str(i+40),'.bmp');
    
     imwrite(figure_t,C);
     
end;   
