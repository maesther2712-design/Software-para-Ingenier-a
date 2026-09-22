% RETO 2 - SISTEMA INTELIGENTE DE GESTIÓN ENERGÉTICA
% Simulación de generación solar, eólica y demanda durante 24 horas

clc;
clear;
close all;

% Horas del día
horas = 1:24;

% ---------------------------------------------------------
% GENERACIÓN SOLAR
% ---------------------------------------------------------
% La generación solar es 0 durante la noche.
% Aumenta desde la hora 6 hasta alcanzar 25 kW en la hora 12.
% Después disminuye hasta llegar nuevamente a 0 kW.

solar = [0 0 0 0 0 5 9 13 17 21 24 25 ...
         24 21 17 13 9 5 0 0 0 0 0 0];

% ---------------------------------------------------------
% GENERACIÓN EÓLICA
% ---------------------------------------------------------
% La generación eólica cambia durante el día debido
% a las variaciones en la velocidad del viento.
% Ningún valor supera los 15 kW.

eolica = [7 9 6 8 10 7 11 9 13 8 12 10 ...
          9 14 11 8 13 10 7 12 9 11 8 10];

% ---------------------------------------------------------
% GENERACIÓN HÍBRIDA TOTAL
% ---------------------------------------------------------
% Se suman las generaciones solar y eólica.

generacion_total = solar + eolica;

% ---------------------------------------------------------
% DEMANDA DE LA COMUNIDAD
% ---------------------------------------------------------
% Horas 1 a 5 y 22 a 24: consumo entre 2 y 4 kW.
% Horas 6 a 17: consumo entre 6 y 10 kW.
% Horas 18 a 21: mayor demanda, hasta 15 kW.

demanda = [3 4 2 3 4 6 7 8 9 8 10 9 ...
           8 7 9 6 10 15 14 15 4 3 2 4];

% ---------------------------------------------------------
% GRÁFICA
% ---------------------------------------------------------

figure;

% Generación total
plot(horas, generacion_total, '-o', 'LineWidth', 1.5);
hold on;

% Demanda de la comunidad
plot(horas, demanda, '-s', 'LineWidth', 1.5);

% Título y nombres de los ejes
title('Balance energético de la micro-red');
xlabel('Tiempo en horas');
ylabel('Potencia (kW)');

% Cuadrícula y leyenda
grid on;
legend('Generación Total', 'Demanda', 'Location', 'best');

% Límites de la gráfica
xlim([1 24]);
ylim([0 40]);

hold off;