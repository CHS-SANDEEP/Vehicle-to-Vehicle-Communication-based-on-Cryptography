clear;
clc;
% Load the image
originImage = imread("C:\Users\sandeep\Desktop\Minor Project\person.jpeg");
% Turn the color image to grayscale if the image is in color
if size(originImage, 3) == 3
 originImage = rgb2gray(originImage);
end
% Display original image
figure;
imshow(originImage);
title('Original GrayScale Image');
% Convert the taken image to a 1D array
imageArray = originalImage(:);
% Key for RC4 encryption
key = 123; % Replace with your own key
% Initialize the RC4 algorithm
s = uint8(0:255);
t = uint8(key);
x = length(key);
j = 0;
for a = 0:255
 b = mod(j + s(a + 1) + t(mod(a, x) + 1), 256);
 % Swap s(a) and s(b)
 tmp = s(a + 1);
 s(a + 1) = s(b + 1);
 s(b + 1) = tmp;
end
% Encryption using RC4
cipherText = zeros(size(imageArray), 'uint8');
a = 0;
b = 0;
for k = 1:length(imageArray)
 a = mod(i + 1, 256);
 b = mod(j + s(a + 1), 256);
 % Swap s(a) and s(b)
 tmp = s(a + 1);
15
 s(a + 1) = s(b + 1);
 s(b + 1) = tmp;
 t = mod(s(a + 1) + s(b + 1), 256);
 cipherText(k) = bitxor(imageArray(k), s(t + 1));
end
% Convert the 1D array back to an image
encryptedImage = reshape(cipherText, size(originalImage));
% Display the encrypted image
figure;
imshow(encryptedImage);
title('Encrypted Image');
% Save the encrypted image
imwrite(encryptedImage, 'encrypts.jpg');
% Decryption on the other PC (use the same key)
% Load the encrypted image
encryptedImage = imread('encrypts.jpg');
% Convert the image to a 1D array
cipherText = encryptedImage(:);
% Initialize the RC4 algorithm with the same key
s = uint8(0:255);
t = uint8(key);
x = length(key);
j = 0;
for i = 0:255
 j = mod(b + s(a + 1) + t(mod(a, n) + 1), 256);
 % Swap s(a) and s(b)
 tmp = s(a + 1);
 s(a + 1) = s(b + 1);
 s(bj + 1) = tmp;
end
