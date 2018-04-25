︠2949583d-b037-4d8e-afb7-2c56343c19f9i︠
%md
# Modelos epidemológicos
***
## Susceptibles - Infectados
***
### Condiciones iniciales
* Población total => N = 10000
* Publación susceptible => S = 9997
* Población infectada => I = 3
* Tiempo => t = 0
︡31a72151-1ca1-41f7-b61b-2dc19d8440ca︡{"done":true,"md":"# Modelos epidemológicos\n***\n## Susceptibles - Infectados\n***\n### Condiciones iniciales\n* Población total => N = 10000\n* Publación susceptible => S = 9997\n* Población infectada => I = 3\n* Tiempo => t = 0"}
︠9e017b42-34c2-4626-8c42-68c25469ada6︠
I = var("I")
S = var("S")
t = var("t")

beta = 0.01

dSdT = -beta*I*S
dIdT = beta*I*S

model_rk4 = desolve_system_rk4([dSdT, dIdT], [S, I], ics=[0, 9997, 3], ivar = t, end_points = 100, step = 0.01)
tuple_rk4 = [[i, j] for i, j, k in model_rk4]
line(tuple_rk4)
︡96bed144-a08d-410d-9825-3139bb3e97db︡{"file":{"filename":"/home/user/.sage/temp/project-d320bd53-1e21-4ba7-89c8-092b388326f5/195/tmp_76sNlc.svg","show":true,"text":null,"uuid":"8dd7a20b-b753-46f9-8c42-5c2e12c8644d"},"once":false}︡
︠47aa1f46-3feb-4ddd-872f-a4e5ceaf3119i︠
%md
## Susceptibles - Infectados - Removidos
***
### Condiciones iniciales
* Población total => N = 10000
* Población susceptible => S = 9997
* Población infectada => I = 3
* Población removidos => R = 0
* tiempo => t = 0
︡c97909c2-7440-48a7-92a7-b5da8bdafd48︡{"done":true,"md":"## Susceptibles - Infectados - Removidos\n***\n### Condiciones iniciales\n* Población total => N = 10000\n* Población susceptible => S = 9997\n* Población infectada => I = 3\n* Población removidos => R = 0\n* tiempo => t = 0"}
︠10fd0599-8583-4321-bdee-6db664ee518c︠
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
︡213b7a0d-0815-4868-a647-04eb4c0bd27f︡{"file":{"filename":"/home/user/.sage/temp/project-d320bd53-1e21-4ba7-89c8-092b388326f5/195/tmp_jPNaOA.svg","show":true,"text":null,"uuid":"72d6833c-0bf3-4b87-a73f-27a12907ac14"},"once":false}︡{"done":true}︡
︠68436dd4-762c-45d3-b957-7d6356dac2e3︠
%md
### Ejemplo 1
***
Construir un modelo SIR con una población del 1000 personas, donde una persona estaba infectada por una enfermedad que se propaga al 0.01% por día, además en este modelo hay una tasa de recuperación del 2% por día, responda las siguientes preguntas:
* ¿En cuántos días la población susceptible llega a cero?
* ¿Cuál es la mayor cantidad de infectados del modelo?
* ¿En cuánto tiempo la población de recuperados llega a la totalidad de la población? 

#### Condiciones iniciales
***
* Población total => N = 1000
* Población susceptible => S = 999
* Población infectada => I = 1 => Tasa de propagación 0.01% por día
* Población removidos => R = 0 => Tasa de recuperación 2% por día
* tiempo => t = 0
︡4759c7e3-c3b1-4837-bc80-c5bf609f52bf︡{"done":true,"md":"### Ejemplo 1 \n***\nConstruir un modelo SIR con una población del 1000 personas, donde una persona estaba infectada por una enfermedad que se propaga al 0.01% por día, además en este modelo hay una tasa de recuperación del 2% por día, responda las siguientes preguntas:\n* ¿En cuántos días la población susceptible llega a cero?\n* ¿Cuál es la mayor cantidad de infectados del modelo? \n* ¿En cuánto tiempo la población de recuperados llega a la totalidad de la población? \n\n#### Condiciones iniciales\n*** \n* Población total => N = 1000\n* Población susceptible => S = 999\n* Población infectada => I = 1 => Tasa de propagación 0.01% por día\n* Población removidos => R = 0 => Tasa de recuperación 2% por día \n* tiempo => t = 0"}
︠d70c3cff-a6a9-475f-ad43-096b875d1e04s︠
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
︡ebe9734d-4cc7-469f-be15-eb4e6b1741f3︡{"file":{"filename":"/home/user/.sage/temp/project-d320bd53-1e21-4ba7-89c8-092b388326f5/320/tmp_nLh_yD.svg","show":true,"text":null,"uuid":"1b49b770-9d60-4ec4-b0bf-c951d5c11a6c"},"once":false}︡{"done":true}︡
︠0366950b-3068-4fd7-b806-04b5afd24e7cs︠
# max infected number
k_list = [[i, k] for i, j, k, l in model_rk4]
line(k_list)
max_infected = max(k for i, k in k_list)
max_infected_ceil = math.ceil(max_infected)
print("El número máximo de infectados es " + str(max_infected_ceil))
︡4f67c348-c06b-49bd-8187-92fdbdb783f8︡{"file":{"filename":"/home/user/.sage/temp/project-d320bd53-1e21-4ba7-89c8-092b388326f5/560/tmp_xt_BnU.svg","show":true,"text":null,"uuid":"02fd8825-4cf0-47b5-b694-0371870ca41c"},"once":false}︡{"stdout":"El número máximo de infectados es 479.0\n"}︡{"done":true}︡
︠5a1093fa-865b-45f0-98dd-bdfa4020b539︠
︡b5b03c00-4c8f-4e01-ac36-5e1e7291d8a4︡
︠f9884bfe-4708-4023-b737-d2bf9c0a4717i︠
%md
# tarea número tres
***
### Enunciado
***
Una enfermedad epidemica ha estallado en una pequena ciudad con una poblacion de 50,000.
Queremos comprender como se propaga la enfermedad a traves de la poblacion, hasta el punto en
que podemos predecir los detalles de la propagacion y la efectividad de varias medidas de control.
***
### Supociciones
* Todos los que contraen la enfermedad finalmente se recuperan, nadie muere.
* Confiere inmunidad permanente a aquellos que se han recuperado.
* La poblaci ́on total permanece fija en 50,000.

︡d450cd3a-804b-4714-9cfd-98536427843d︡{"done":true,"md":"# tarea número tres\n***\n### Enunciado\n***\nUna enfermedad epidemica ha estallado en una pequena ciudad con una poblacion de 50,000.\nQueremos comprender como se propaga la enfermedad a traves de la poblacion, hasta el punto en\nque podemos predecir los detalles de la propagacion y la efectividad de varias medidas de control.\n***\n### Supociciones\n* Todos los que contraen la enfermedad finalmente se recuperan, nadie muere.\n* Confiere inmunidad permanente a aquellos que se han recuperado.\n* La poblaci ́on total permanece fija en 50,000."}
︠c69a7a9f-e336-49fa-b747-9e7782ed8cddi︠
%md
### Literal a
***
Haga un esquema de la situacion. Determinando las variables a utilizar

* S  ==> representa la población sana
* I  ==> representa la poblacíón infectada
* R  ==> representa la población recuperada
* alpha  ==> variable que representa la tasa de infectados por contacto
* betha  ==> variable que representa la tasa de recuperación
︡ed09c4e2-4f37-41ba-8d40-ffd090f6b85a︡{"done":true,"md":"### Literal a\n***\nHaga un esquema de la situacion. Determinando las variables a utilizar\n\n* S  ==> representa la población sana\n* I  ==> representa la poblacíón infectada\n* R  ==> representa la población recuperada\n* alpha  ==> variable que representa la tasa de infectados por contacto\n* betha  ==> variable que representa la tasa de recuperación"}
︠7d29cfda-f977-453a-b5ce-d0e908bf94e8i︠
%md
# Literal b
***
Platee las ecuaciones del modelo

* Variación de la población sana a infectada
* * dS/dT = -alpha \* S \* I
* Variación de la población infectada a sana
* * dI/dT = alpha \* S \* (I-betha) * I
* Variación de infectados a inmunes
* * dR/dT = betha \* I
︡8631bfb6-2ab9-4171-b427-33b2c5e97782︡{"done":true,"md":"# Literal b\n***\nPlatee las ecuaciones del modelo\n\n* Variación de la población sana a infectada\n* * dS/dT = -alpha \\* S \\* I\n* Variación de la población infectada a sana\n* * dI/dT = alpha \\* S \\* (I-betha) * I\n* Variación de infectados a inmunes\n* * dR/dT = betha \\* I"}
︠b2bc99ac-f9ae-4172-957b-0cdd0fdde250i︠
%md
### Literal c
***
Tome la cantidad de infectados como desee para hacer un análisis de sensibilidad de las siguientes situaciones
***

︡5d93c65c-ab3d-4551-9f3f-3785f57fa827︡{"done":true,"md":"### Literal c\n***\nTome la cantidad de infectados como desee para hacer un análisis de sensibilidad de las siguientes situaciones\n***"}
︠4cef0178-ed51-4e36-ad85-de0e0ff6f82di︠
%md
#### c.1) Las tasas de contacto y recuperación son iguales

︡e22c3ea6-8684-499a-b859-2d968e4b964e︡{"done":true,"md":"#### c.1) Las tasas de contacto y recuperación son iguales"}
︠c086369d-84df-40c1-91be-773db5a310aa︠
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
︡8ca6601e-0fa3-4401-bff5-5840929de138︡{"file":{"filename":"/home/user/.sage/temp/project-7265bd2c-62e9-448c-83aa-7e13a298e1cf/133/tmp_DwLuMp.svg","show":true,"text":null,"uuid":"614c2555-6335-4da7-a9c6-97feca9fbec1"},"once":false}︡{"done":true}︡
︠00cc26b6-2756-4655-bcb5-4ffc28e0b78bi︠
%md
#### c.2) La tasa de contacto es mayor que la de recuperación
︡63205389-949c-4845-8600-0760ed181242︡{"done":true,"md":"#### c.2) La tasa de contacto es mayor que la de recuperación"}
︠cdb4ab21-6708-4837-9f9d-67c7a84dfb60︠
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
︡ff828aee-d98c-4a8f-91d0-881580dddca2︡{"file":{"filename":"/home/user/.sage/temp/project-7265bd2c-62e9-448c-83aa-7e13a298e1cf/133/tmp_tLrB1l.svg","show":true,"text":null,"uuid":"3be094a0-06c3-427e-b1f5-31ff818176bd"},"once":false}︡{"done":true}︡
︠1eb89232-3d0c-4760-8877-af0eef478435i︠
%md
#### c.3) La tasa de contacto es menor que la de recuperación
︡5f03687a-b8db-4227-9e7a-34da5938a09c︡{"done":true,"md":"#### c.3) La tasa de contacto es menor que la de recuperación"}
︠2102b0e8-57d7-4c53-bbdd-5ef7cc52832f︠
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
︡c0727360-3536-4fd2-9bc7-c436947b121b︡{"file":{"filename":"/home/user/.sage/temp/project-7265bd2c-62e9-448c-83aa-7e13a298e1cf/133/tmp_nZQn35.svg","show":true,"text":null,"uuid":"4ae74a30-dee0-4571-a385-8228bd9fb66b"},"once":false}︡{"done":true}︡
︠7535509e-7080-40f6-bec7-5a56459fb4e3︠
%md
### Literal d
***
Tome la cantidad de infectados inicialmente como desee y encuentre los valores de las razones de contacto y recuperación (diferentes de cero) que cumplan las siguientes condiciones
***
︡e634aae2-c45f-4a11-a73a-98125e37c272︡{"done":true,"md":"### Literal d\n***\nTome la cantidad de infectados inicialmente como desee y encuentre los valores de las razones de contacto y recuperación (diferentes de cero) que cumplan las siguientes condiciones\n***"}
︠d96da97f-004c-45f2-8d24-750f5e993500i︠
%md
#### d.1) El número de infectados en 20 días es la mitad de la poblacíon.
︡b55f6409-71a1-42ac-9733-4a1c37778172︡{"done":true,"md":"#### d.1) El número de infectados en 20 días es la mitad de la poblacíon."}
︠8967f83e-d97e-42ea-a743-d25d724ea6da︠
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
︡d0497792-f91c-44c3-b894-9f6e9848801f︡{"file":{"filename":"/home/user/.sage/temp/project-7265bd2c-62e9-448c-83aa-7e13a298e1cf/133/tmp_EYcqRh.svg","show":true,"text":null,"uuid":"0b7cf96f-6c64-47c0-80dd-b5c74127a2ac"},"once":false}︡{"done":true}︡
︠addb7c8a-0fe9-496f-b8ff-121d13c6631ei︠
%md
#### d.2) A los 20 días desaparece la epidemia.
︡b0a38bc9-d3f4-4396-b103-bfb5b7935493︡{"done":true,"md":"#### d.2) A los 20 días desaparece la epidemia."}
︠94ecab18-8c96-4a9d-806d-36f808b99449︠
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
︡29a1668f-6232-4cb9-a138-6465dfb0e84f︡{"file":{"filename":"/home/user/.sage/temp/project-7265bd2c-62e9-448c-83aa-7e13a298e1cf/133/tmp_dqWRH1.svg","show":true,"text":null,"uuid":"c4fc8e02-c26a-416c-94c7-3befe396eabc"},"once":false}︡{"done":true}︡
︠3e068564-62b2-4f13-b45f-d17a3dc2cc63i︠
%md
#### d.3)  El  número de infectados no puede superar los 10000 habitantes.
︡c4b0c9b7-ed3f-47c7-9ca4-845e888d58f0︡{"done":true,"md":"#### d.3)  El  número de infectados no puede superar los 10000 habitantes."}
︠f8fdf106-2666-4c40-918b-51c4e1a167dd︠
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
︡84a6d40a-2f87-4cad-bc2e-b41c8323be50︡{"file":{"filename":"/home/user/.sage/temp/project-7265bd2c-62e9-448c-83aa-7e13a298e1cf/133/tmp_hB5hQT.svg","show":true,"text":null,"uuid":"2c62e4dc-ebf4-4bcf-a70e-e7413a5b76ff"},"once":false}︡{"done":true}︡
︠93925983-4624-461c-9fce-b1d4946c9d4b︠




















