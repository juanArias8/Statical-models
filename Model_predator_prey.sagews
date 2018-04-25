"""
Modelo depredador - presa
Modelo lokta - Volteira

Consideramos un modelo de presa - depredador donde
* x(t) ==> Depredadores a lo largo del tiempo
* y(t) ==> Presas a lo largo del tiempo

y además: 
* dXdT = -a\*x + b\*x\*y
* * con x(0) = 0
* * inicialmente consideramos que las presas están casi extintas
* dYdT = o\*y - r\*x\*y
* * con y(0) = 0
* * inicialmente consideramos que los depredadores están casi extintas

con a, b, o, r constantes
"""

"""
Ejemplo número 1

Enunciado

Sea l el número de leones y el número de ñus presentes en el tiempo en algún área, construir un modelo que muestre el comportamiento  
de los animales en el área si la taza de nacimientos y de muertes del depredador es 0.03 y 0.98 respectivamente y la taza de nacimientos  
y de muertes de la presa es 3 y 0.06. Además la población inicial de ñus es 1000 y de leones es 25. Muestre además, una tabla de lo que  
pasa cada mes durante 24 meses y grafique.

Datos del enunciado

* alpha = 0.98
* betha = 0.03
* tetha = 3
* omega = 0.06

Ecuaciones del modelo Lokta - Volteira
* Depredadores
* * dXdT = -alpha*x + betha*x*y
* Presas
* * dYdT = tetha*y - omega*x*y
***
"""
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










