
 clc; close all; clear all

 I=imread('FFTPRINT.TIF');

 Z=promedio(I);

subplot(1,2,1), imshow(I)
subplot(1,2,2), imshow(uint8(Z))

function y3 = promedio(x)
x = double(x);
medida=size(x);
y3=x;
N=medida(1)-1
M=medida(2)-1
for i=2:N
    for j=2:M       
        %promo = sum(sum(x(i-1:i+1,j-1:j+1)))/9;
        promo=(x(i,j) + x(i-1,j) + x(i+1,j) + x(i,j-1) + x(i,j+1))/5;
        y3(i,j)=fix(promo);
    end
end
        
end

function y2=iluminar(x)
medida=size(x);
prompt = "ingrese limite inferior ";
limite_inf=input(prompt);
prompt = "ingrese limite superior ";
limite_sup=input(prompt);
y2=x;
medida=size(x);
limite_inf=85;
limite_sup=170;
 for i = 1:medida(1)
    for j = 1:medida(2)
        if (x(i,j)>limite_inf && x(i,j)<limite_sup)
            y2(i,j)=255;        
        end
    end
 end

end


function y1=oscurecer(x)
medida=size(x);
prompt = "ingrese limite inferior ";
limite_inf=input(prompt);
prompt = "ingrese limite superior ";
limite_sup=input(prompt);
y1=x;
medida=size(x);
limite_inf=85;
limite_sup=170;
 for i = 1:medida(1)
    for j = 1:medida(2)
        if (x(i,j)<limite_inf | x(i,j)>limite_sup)
            y1(i,j)=0;            
        end
    end
 end

end




function salida=Calculo_expancion(x)
medida=size(x);
prompt = "ingrese limite inferior ";
limite_inf=input(prompt);
prompt = "ingrese la salida correspondiente al limite inferior ";
salida_inf=input(prompt);
prompt = "ingrese limite superior ";
limite_sup=input(prompt);
prompt = "ingrese la salida correspondiente al limite superior ";
salida_sup=input(prompt);
salida=x;
 for i = 1:medida(1)
    for j = 1:medida(2)
        if x(i,j)<limite_inf
            
            pen_inf=salida_inf/limite_inf;
            salida(i,j)=fix(x(i,j)*pen_inf);
            
        elseif x(i,j)>limite_sup
            
            pen_sup=(255-salida_inf)/(255-limite_sup);
            ord_sup=255-(255*pen_sup);
            salida(i,j)=fix(x(i,j)*pen_sup+ord_sup);
            
        else
            
            pen_int=(salida_sup-salida_inf)/(limite_sup-limite_inf);
            ord_int=salida_sup-(limite_sup*pen_int);
            salida(i,j)=fix(x(i,j)*pen_int+ord_int);
        end
    end
 end
end


 