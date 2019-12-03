clear; clc; close all;

i1 = imread("lab112.png");

figure;
i1 = im2bw(i1, 40/255);
i1 = not(i1);
i1 = imclearborder(i1);
i1 = not(i1);

sq = strel('square', 5);
i1 = imclose(i1, sq);
imshow(i1)

edges = edge(i1, 'canny');

[H, T, R] = hough(edges);

figure;
imshow(H, []);

P = houghpeaks(H, 8);

hold on;
plot(P, 'o');

lines = houghlines(edges, T, R, P, 'FillGap', 5, 'MinLength', 7);
figure, imshow(edges), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');