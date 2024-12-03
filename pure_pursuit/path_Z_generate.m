% 生成 1000 个点的 Z 型路径，x 范围 [0, 35]，y 范围 [0, 45]
clc
clear
close all

num_points = 1000;  % 总点数
points_per_segment = floor(num_points / 3);  % 每段路径上的点数，确保为整数

% 第一段 (0, 0) -> (15, 0)
x1 = linspace(0, 15, points_per_segment);
y1 = zeros(1, points_per_segment);

% 第二段 (15, 0) -> (15, 30)
x2 = repmat(15, 1, points_per_segment);  % x 坐标保持 15
y2 = linspace(0, 30, points_per_segment);

% 第三段 (15, 30) -> (35, 30)
x3 = linspace(15, 35, points_per_segment);
y3 = repmat(30, 1, points_per_segment);  % y 坐标保持 30

% 合并所有段的坐标
x = [x1, x2, x3];
y = [y1, y2, y3];

% 如果总点数不等于 1000，调整最后一个点的数量
if numel(x) < num_points
    x = [x, linspace(x(end), x(end), num_points - numel(x))];
    y = [y, linspace(y(end), y(end), num_points - numel(y))];
end

% 组合成一个 1000x2 的路径矩阵
path = [x', y'];

% 保存路径数据到 Z_path_large.mat 文件
save('path_Z.mat', 'path');

% 可视化路径
figure;
plot(path(:,1), path(:,2), 'b-', 'LineWidth', 2);
xlabel('X');
ylabel('Y');
title('Generated Z Shape Path (Larger Range)');
