"""
Modelos epidemológicos

Susceptibles - Infectados

Condiciones iniciales
* Población total => N = 10000
* Publación susceptible => S = 9997
* Población infectada => I = 3
* Tiempo => t = 0
"""
I = var("I")
S = var("S")
t = var("t")

beta = 0.01

dSdT = -beta*I*S
dIdT = beta*I*S

model_rk4 = desolve_system_rk4([dSdT, dIdT], [S, I], ics=[0, 9997, 3], ivar = t, end_points = 100, step = 0.01)
tuple_rk4 = [[i, j] for i, j, k in model_rk4]
line(tuple_rk4)

"""
Susceptibles - Infectados - Removidos

Condiciones iniciales
* Población total => N = 10000
* Población susceptible => S = 9997
* Población infectada => I = 3
* Población removidos => R = 0
* tiempo => t = 0
"""
S = var("S")
I = var("I")
R = var("R")
t = var("t")

beta = 0.001
gama = 0.01

dSdT = -beta*I*S
dIdT = beta*I*S - gama*I
dRdT = gama*I

model_rk4 = desolve_system_rk4([dSdT, dIdT, dRdT], [S, I, R], ics=[0, 9997, 3, 0], ivar = t, end_points = 1, step = 0.01)
tuple_rk4 = [[i, j] for i, j, k, l in model_rk4]
line(tuple_rk4)

"""
Ejemplo 1

Construir un modelo SIR con una población del 1000 personas, donde una persona estaba infectada por una enfermedad que se propaga al 0.01% por día, además en este modelo hay una tasa de recuperación del 2% por día, responda las siguientes preguntas:
* ¿En cuántos días la población susceptible llega a cero?
* ¿Cuál es la mayor cantidad de infectados del modelo?
* ¿En cuánto tiempo la población de recuperados llega a la totalidad de la población? 

Condiciones iniciales

* Población total => N = 1000
* Población susceptible => S = 999
* Población infectada => I = 1 => Tasa de propagación 0.01% por día
* Población removidos => R = 0 => Tasa de recuperación 2% por día
* tiempo => t = 0
"""
S = var("S")
I = var("I")
R = var("R")
t = var("t")

beta = 0.0001
gama = 0.02

dSdT = -beta*I*S
dIdT = beta*I*S - gama*I
dRdT = gama*I

model_rk4 = desolve_system_rk4([dSdT, dIdT, dRdT], [S, I, R], ics=[0, 999, 1, 0], ivar = t, end_points = 1000, step = 1)
tuple_rk4 = [[i, j] for i, j, k, l in model_rk4]
line(tuple_rk4)

# max infected number
k_list = [[i, k] for i, j, k, l in model_rk4]
line(k_list)
max_infected = max(k for i, k in k_list)
max_infected_ceil = math.ceil(max_infected)
print("El número máximo de infectados es " + str(max_infected_ceil))

"""
Ejemplo 2 

Enunciado

Una enfermedad epidemica ha estallado en una pequena ciudad con una poblacion de 50,000.
Queremos comprender como se propaga la enfermedad a traves de la poblacion, hasta el punto en
que podemos predecir los detalles de la propagacion y la efectividad de varias medidas de control.

Supociciones
* Todos los que contraen la enfermedad finalmente se recuperan, nadie muere.
* Confiere inmunidad permanente a aquellos que se han recuperado.
* La poblaci ́on total permanece fija en 50,000.

Literal a
Haga un esquema de la situacion. Determinando las variables a utilizar

* S  ==> representa la población sana
* I  ==> representa la poblacíón infectada
* R  ==> representa la población recuperada
* alpha  ==> variable que representa la tasa de infectados por contacto
* betha  ==> variable que representa la tasa de recuperación

Literal b
Platee las ecuaciones del modelo

* Variación de la población sana a infectada
* * dS/dT = -alpha \* S \* I
* Variación de la población infectada a sana
* * dI/dT = alpha \* S \* (I-betha) * I
* Variación de infectados a inmunes
* * dR/dT = betha \* I

Literal c
Tome la cantidad de infectados como desee para hacer un análisis de sensibilidad de las siguientes situaciones
"""

#c.1) Las tasas de contacto y recuperación son iguales

S = var("S")
I = var("I")
R = var("R")
t = var("t")

alpha = 0.000005
betha = 0.000005

dSdT = -alpha*I*S
dIdT = alpha*I*S - betha*I
dRdT = betha*I

model_rk4 = desolve_system_rk4([dSdT, dIdT, dRdT], [S, I, R], ics=[0, 49000, 1000, 0], ivar=t, end_points=100, step=0.1)
dsdt_vs_tiempo = [[i, j] for i, j, k, l in model_rk4]
didt_vs_tiempo = [[i, k] for i, j, k, l in model_rk4]
drdt_vs_tiempo = [[i, l] for i, j, k, l in model_rk4]

plot_dsdt_vs_tiempo = list_plot(dsdt_vs_tiempo, plotjoined=True, color="green")
plot_didt_vs_tiempo = list_plot(didt_vs_tiempo, plotjoined=True, color="red")
plot_drdt_vs_tiempo = list_plot(drdt_vs_tiempo, plotjoined=True, color="blue")

plot_dsdt_vs_tiempo + plot_didt_vs_tiempo + plot_drdt_vs_tiempo

# c.2) La tasa de contacto es mayor que la de recuperación
I = var("I")
R = var("R")
t = var("t")

alpha = 0.0005
betha = 2

dSdT = -alpha*I*S
dIdT = alpha*I*S - betha*I
dRdT = betha*I

model_rk4 = desolve_system_rk4([dSdT, dIdT, dRdT], [S, I, R], ics=[0, 49000, 1000, 0], ivar = t, end_points=5, step=0.1)
dsdt_vs_tiempo = [[i, j] for i, j, k, l in model_rk4]
didt_vs_tiempo = [[i, k] for i, j, k, l in model_rk4]
drdt_vs_tiempo = [[i, l] for i, j, k, l in model_rk4]

plot_dsdt_vs_tiempo = list_plot(dsdt_vs_tiempo, plotjoined=True, color="green")
plot_didt_vs_tiempo = list_plot(didt_vs_tiempo, plotjoined=True, color="red")
plot_drdt_vs_tiempo = list_plot(drdt_vs_tiempo, plotjoined=True, color="blue")

show(plot_dsdt_vs_tiempo + plot_didt_vs_tiempo + plot_drdt_vs_tiempo)

# c.3) La tasa de contacto es menor que la de recuperación
S = var("S")
I = var("I")
R = var("R")
t = var("t")

alpha = 0.0005
betha = 1

dSdT = -alpha*I*S
dIdT = alpha*I*S - betha*I
dRdT = betha*I

model_rk4 = desolve_system_rk4([dSdT, dIdT, dRdT], [S, I, R], ics=[0, 49000, 1000, 0], ivar = t, end_points=6, step=0.1)
dsdt_vs_tiempo = [[i, j] for i, j, k, l in model_rk4]
didt_vs_tiempo = [[i, k] for i, j, k, l in model_rk4]
drdt_vs_tiempo = [[i, l] for i, j, k, l in model_rk4]

plot_dsdt_vs_tiempo = list_plot(dsdt_vs_tiempo, plotjoined=True, color="green")
plot_didt_vs_tiempo = list_plot(didt_vs_tiempo, plotjoined=True, color="red")
plot_drdt_vs_tiempo = list_plot(drdt_vs_tiempo, plotjoined=True, color="blue")

show(plot_dsdt_vs_tiempo + plot_didt_vs_tiempo + plot_drdt_vs_tiempo)


""" 
Literal d
Tome la cantidad de infectados inicialmente como desee y encuentre los valores de las razones de contacto y recuperación (diferentes de cero) que cumplan las siguientes condiciones
"""

# d.1) El número de infectados en 20 días es la mitad de la poblacíon.
S = var("S")
I = var("I")
R = var("R")
t = var("t")

alpha = 0.000158
betha = 1.60

dSdT = -alpha*I*S
dIdT = alpha*I*S - betha*I
dRdT = betha*I

model_rk4 = desolve_system_rk4([dSdT, dIdT, dRdT], [S, I, R], ics=[0, 49999, 1, 0], ivar = t, end_points=3, step=0.1)
dsdt_vs_tiempo = [[i, j] for i, j, k, l in model_rk4]
didt_vs_tiempo = [[i, k] for i, j, k, l in model_rk4]
drdt_vs_tiempo = [[i, l] for i, j, k, l in model_rk4]

plot_dsdt_vs_tiempo = list_plot(dsdt_vs_tiempo, plotjoined=True, color="green")
plot_didt_vs_tiempo = list_plot(didt_vs_tiempo, plotjoined=True, color="red")
plot_drdt_vs_tiempo = list_plot(drdt_vs_tiempo, plotjoined=True, color="blue")

show(plot_dsdt_vs_tiempo + plot_didt_vs_tiempo + plot_drdt_vs_tiempo)

# d.2) A los 20 días desaparece la epidemia.
S = var("S")
I = var("I")
R = var("R")
t = var("t")

alpha = 0.0001
betha = 3

dSdT = -alpha*I*S
dIdT = alpha*I*S - betha*I
dRdT = betha*I

model_rk4 = desolve_system_rk4([dSdT, dIdT, dRdT], [S, I, R], ics=[0, 25000, 25000, 0], ivar = t, end_points=10, step=0.1)
dsdt_vs_tiempo = [[i, j] for i, j, k, l in model_rk4]
didt_vs_tiempo = [[i, k] for i, j, k, l in model_rk4]
drdt_vs_tiempo = [[i, l] for i, j, k, l in model_rk4]

plot_dsdt_vs_tiempo = list_plot(dsdt_vs_tiempo, plotjoined=True, color="green")
plot_didt_vs_tiempo = list_plot(didt_vs_tiempo, plotjoined=True, color="red")
plot_drdt_vs_tiempo = list_plot(drdt_vs_tiempo, plotjoined=True, color="blue")

show(plot_dsdt_vs_tiempo + plot_didt_vs_tiempo + plot_drdt_vs_tiempo)

# d.3)  El  número de infectados no puede superar los 10000 habitantes.
S = var("S")
I = var("I")
R = var("R")
t = var("t")

alpha = 0.05
betha = 1100

dSdT = -alpha*I*S
dIdT = alpha*I*S - betha*I
dRdT = betha*I

model_rk4 = desolve_system_rk4([dSdT, dIdT, dRdT], [S, I, R], ics=[0, 49000, 1000, 0], ivar = t, end_points=0.01, step=0.00001)
dsdt_vs_tiempo = [[i, j] for i, j, k, l in model_rk4]
didt_vs_tiempo = [[i, k] for i, j, k, l in model_rk4]
drdt_vs_tiempo = [[i, l] for i, j, k, l in model_rk4]

plot_dsdt_vs_tiempo = list_plot(dsdt_vs_tiempo, plotjoined=True, color="green")
plot_didt_vs_tiempo = list_plot(didt_vs_tiempo, plotjoined=True, color="red")
plot_drdt_vs_tiempo = list_plot(drdt_vs_tiempo, plotjoined=True, color="blue")

show(plot_dsdt_vs_tiempo + plot_didt_vs_tiempo + plot_drdt_vs_tiempo)




















