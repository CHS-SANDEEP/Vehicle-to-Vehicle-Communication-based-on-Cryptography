Decryption Code:
encryptedImage = imread("C:\Users\adity\encrypts.jpg");
% Convert the image to a 1D array
cipherText = encryptedImage(:);
key=123;
% Initialize the RC4 algorithm with the same key
s = uint8(0:255);
t = uint8(key);
x = length(key);
b = 0;
for a = 0:255
 b = mod(j + s(a + 1) + t(mod(a, n) + 1), 256);
 % Swap s(a) and s(b)
 tmp = s(a + 1);
 s(a + 1) = s(b + 1);
 s(b + 1) = tmp;
end
% Decryption using RC4
recoveredText = zeros(size(cipherText), 'uint8');
a = 0;
b = 0;
for k = 1:length(cipherText)
 a = mod(i + 1, 256);
 b = mod(j + s(a + 1), 256);
 % Swap s(a) and s(b)
 tmp = s(a + 1);
 s(a + 1) = s(b + 1);
 s(b + 1) = tmp;
 t = mod(s(a + 1) + s(b + 1), 256);
 recoveredText(k) = bitxor(cipherText(k), s(t + 1));
end
% Convert the 1D array back to an image
recoveredImage = reshape(recoveredText, size(encryptedImage));
% Display the decrypted image
figure;
imshow(recoveredImage);
title('Decrypted Image')
