︠77911011-d45e-4441-8c28-f440a4665025i︠
%md
# Modelo depredador - presa
## Modelo lokta - Volteira
***
Consideramos un modelo de presa - depredador donde
* x(t) ==> Depredadores a lo largo del tiempo
* y(t) ==> Presas a lo largo del tiempo

y además
* dXdT = -a\*x + b\*x\*y
* * con x(0) = 0
* * inicialmente consideramos que las presas están casi extintas
* dYdT = o\*y - r\*x\*y
* * con y(0) = 0
* * inicialmente consideramos que los depredadores están casi extintas

con a, b, o, r constantes
︡46a57d50-a9a5-4d10-8696-3a5cb59b8e8c︡{"done":true,"md":"# Modelo depredador - presa\n## Modelo lokta - Volteira\n***\nConsideramos un modelo de presa - depredador donde\n* x(t) ==> Depredadores a lo largo del tiempo\n* y(t) ==> Presas a lo largo del tiempo\n\ny además\n* dXdT = -a\\*x + b\\*x\\*y\n* * con x(0) = 0\n* * inicialmente consideramos que las presas están casi extintas\n* dYdT = o\\*y - r\\*x\\*y\n* * con y(0) = 0\n* * inicialmente consideramos que los depredadores están casi extintas\n\ncon a, b, o, r constantes"}
︠7de87a83-8a2d-47b3-b924-6ef2933f644ei︠
%md
## Ejemplo número 1
***
### Enunciado
Sea l el número de leones y el número de ñus presentes en el tiempo en algún área, construir un modelo que muestre el comportamiento  
de los animales en el área si la taza de nacimientos y de muertes del depredador es 0.03 y 0.98 respectivamente y la taza de nacimientos  
y de muertes de la presa es 3 y 0.06. Además la población inicial de ñus es 1000 y de leones es 25. Muestre además, una tabla de lo que  
pasa cada mes durante 24 meses y grafique.
***
### Datos del enunciado
***
* alpha = 0.98
* betha = 0.03
* tetha = 3
* omega = 0.06
***
### Ecuaciones del modelo Lokta - Volteira
* Depredadores
* * dXdT = -alpha*x + betha*x*y
* Presas
* * dYdT = tetha*y - omega*x*y
***
︡3ff09815-521b-4b7f-a9a4-e7d91a86bed6︡{"done":true,"md":"## Ejemplo número 1\n***\n### Enunciado\nSea l el número de leones y el número de ñus presentes en el tiempo en algún área, construir un modelo que muestre el comportamiento  \nde los animales en el área si la taza de nacimientos y de muertes del depredador es 0.03 y 0.98 respectivamente y la taza de nacimientos  \ny de muertes de la presa es 3 y 0.06. Además la población inicial de ñus es 1000 y de leones es 25. Muestre además, una tabla de lo que  \npasa cada mes durante 24 meses y grafique.\n***\n### Datos del enunciado\n***\n* alpha = 0.98\n* betha = 0.03\n* tetha = 3\n* omega = 0.06\n***\n### Ecuaciones del modelo Lokta - Volteira\n* Depredadores\n* * dXdT = -alpha*x + betha*x*y\n* Presas\n* * dYdT = tetha*y - omega*x*y\n***"}
︠99963d65-c6df-4a4a-9243-a89dc5aecd9as︠
x = var("x")
y = var("y")
t = var("t")

alpha = 0.98
betha = 0.03
tetha = 3
omega = 0.06

dXdT = -alpha*x + betha*x*y
dYdT = tetha*y - omega*x*y

rk4_solution = desolve_system_rk4([dXdT, dYdT], [x, y], ics=[0, 1000, 25], ivar = t, end_points = 24, step = 0.01)

time_vs_nius = [[i, j] for i, j, k in rk4_solution]
plot_time_vs_nius = list_plot(time_vs_nius, plotjoined = True, color = "green")

time_vs_leons = [[i, k] for i, j, k in rk4_solution]
plot_time_vs_leons = list_plot(time_vs_leons, plotjoined = True, color = "orange")

nius_vs_leons = [[j, k] for i, j, k in rk4_solution]
plot_nius_vs_leons = list_plot(nius_vs_leons, plotjoined=True, color = "red")

plot_time_vs_nius + plot_time_vs_leons + plot_nius_vs_leons
︡813b6548-9220-4ed1-b243-2cdd4c2f5bf1︡{"file":{"filename":"/home/user/.sage/temp/project-d320bd53-1e21-4ba7-89c8-092b388326f5/211/tmp_gbCVjh.svg","show":true,"text":null,"uuid":"ba8118fd-e091-4025-b840-6f5d7d0ca8cc"},"once":false}︡{"done":true}︡
︠34fe7a71-9dd1-452e-abd1-7e250a737e73︠









