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

Enunciado: Sea l el número de leones y el número de ñus presentes en el tiempo en algún área, construir un modelo que muestre el comportamiento  
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

plot_time_vs_nius + plot_time_vs_leons
plot_nius_vs_leons


"""
Ejemplo número 2

Enunciado: En el modelo depredador presa, analizar con una población inicial de 
depredadores de 20 mil y una población inicial de presas de 50 mil
"""
"""
Pregunta 1 
¿Qué sucede cuando la tasa de muertes de los depredadores es más grande que 
la de las presas, pero la tasa de nacimientos de las presas es mayor que la de los 
depredadores?

Modelos

* Modelo de depredadores
* * dXdT = -alfa*x + beta*x*y
* Modelo de presas
* * dYdT = delta*y - gamma*x*y

Variables
* alfa ==> Tasa de muerte de depredadores
* beta ==> Tasa de crecimiento de depredadores
* gamma ==> Tasa de muerte de presas
* Delta ==> Tasa de creciemiento de presas 
"""

x = var('x')
y = var('y')
t = var('t')

alfa = 0.0987          # Muerte de depredadores
gamma = 0.00005        # Muerte de presas

beta = 0.00002         # Nacimientos depredadores
delta = 0.999          # Nacimientos presas

dXdT = -alfa*x + beta*x*y
dYdT = delta*y - gamma*x*y

model_rk4 = desolve_system_rk4([dXdT, dYdT], [x, y], ics=[0, 20000, 50000], ivar=t, end_points=30, step=0.1)

dxdt_vs_tiempo = [[i, j] for i, j, k in model_rk4]
dydt_vs_tiempo = [[i, k] for i, j, k in model_rk4]

plot_dxdt_vs_tiempo = list_plot(dxdt_vs_tiempo, plotjoined=True, color="green")
plot_dydt_vs_tiempo = list_plot(dydt_vs_tiempo, plotjoined=True, color="red")

plot_dxdt_vs_tiempo + plot_dydt_vs_tiempo


"""Pregunta 2

Con los mismos datos del ejemplo anterior ¿Qué sucede si a la población
de depredadores llegan más individuos por migración? 

Modelos

* Modelo de depredadores con individuos por migración
* * dXdT = -alfa*x + beta*x*y + epsilon*x 
* Modelo de presas
* * dYdT = delta*y - gamma*x*y

Variables
* alfa ==> Tasa de muerte de depredadores
* beta ==> Tasa de crecimiento de depredadores
* gamma ==> Tasa de muerte de presas
* Delta ==> Tasa de creciemiento de presas
* Epsilon ==> Tasa de inmigración
"""

x = var('x')
y = var('y')
t = var('t')

alfa = 0.0987          # Muerte de depredadores
gamma = 0.00005        # Muerte de presas

beta = 0.00002         # Nacimientos depredadores
delta = 0.999          # Nacimientos presas

epsilon = 0.05        # Inmigración depredadores

dXdT = -alfa*x + beta*x*y + epsilon*x
dYdT = delta*y - gamma*x*y

model_rk4 = desolve_system_rk4([dXdT, dYdT], [x, y], ics=[0, 20000, 50000], ivar=t, end_points=30, step=0.1)

dxdt_vs_tiempo = [[i, j] for i, j, k in model_rk4]
dydt_vs_tiempo = [[i, k] for i, j, k in model_rk4]

plot_dxdt_vs_tiempo = list_plot(dxdt_vs_tiempo, plotjoined=True, color="green")
plot_dydt_vs_tiempo = list_plot(dydt_vs_tiempo, plotjoined=True, color="red")

plot_dxdt_vs_tiempo + plot_dydt_vs_tiempo


"""
Pregunta 3

En la misma situación del primer ejercicio ¿Qué sucede cuando la población
de presas muere también por causas naturales? 
***
Modelos

* Modelo de depredadores
* * dXdT = -alfa*x + beta*x*y
* Modelo de presas con muertes naturales
* * dYdT = delta*y - gamma*x*y - epsilon*y

Variables
* alfa ==> Tasa de muerte de depredadores
* beta ==> Tasa de crecimiento de depredadores
* gamma ==> Tasa de muerte de presas
* Delta ==> Tasa de creciemiento de presas
* Epsilon ==> Tasa de muertes naturales de presas
"""

x = var('x')
y = var('y')
t = var('t')

alfa = 0.0987          # Muerte de depredadores
gamma = 0.00005        # Muerte de presas

beta = 0.00002         # Nacimientos depredadores
delta = 0.999          # Nacimientos presas

epsilon = 1.25         # Muerte natural presas

dXdT = -alfa*x + beta*x*y
dYdT = delta*y - gamma*x*y - epsilon*y

model_rk4 = desolve_system_rk4([dXdT, dYdT], [x, y], ics=[0, 20000, 50000], ivar=t, end_points=30, step=0.1)

dxdt_vs_tiempo = [[i, j] for i, j, k in model_rk4]
dydt_vs_tiempo = [[i, k] for i, j, k in model_rk4]

plot_dxdt_vs_tiempo = list_plot(dxdt_vs_tiempo, plotjoined=True, color="green")
plot_dydt_vs_tiempo = list_plot(dydt_vs_tiempo, plotjoined=True, color="red")

plot_dxdt_vs_tiempo + plot_dydt_vs_tiempo



















