︠795a4e96-43df-4db4-9247-f56c54e5ae02s︠
a = [i for i in [1..9]]
b = [j for j in [-3..20]]
c = zip(a, b)
gc = list_plot(c, plotjoined=True, color='green')
show(gc)
︡530ea2ba-1513-46b3-b9df-9f088ea1290a︡{"file":{"filename":"/home/user/.sage/temp/project-d320bd53-1e21-4ba7-89c8-092b388326f5/385/tmp_8mW0ip.svg","show":true,"text":null,"uuid":"dfe3407f-e3bf-450f-9280-732bd757d34b"},"once":false}︡{"done":true}︡
︠e687a966-04b7-45b3-bcbe-2e114eb13f0es︠
f(x) = x^3 + 3*x - 2
gf = plot(f)
show(gf)
︡f154a156-da71-4d60-8b5f-b5c60d1fc766︡{"file":{"filename":"/home/user/.sage/temp/project-d320bd53-1e21-4ba7-89c8-092b388326f5/385/tmp_uP3l9E.svg","show":true,"text":null,"uuid":"3c6cad89-a84b-457a-bdf4-df0267596809"},"once":false}︡{"done":true}︡
︠e624c110-8ffb-449f-a8e4-ed612c76ac35s︠
show(gc + gf)
︡f363161f-217c-4429-8a8b-469b81a05d5a︡{"file":{"filename":"/home/user/.sage/temp/project-d320bd53-1e21-4ba7-89c8-092b388326f5/385/tmp_5N6SKi.svg","show":true,"text":null,"uuid":"0258dc0f-ee90-471f-8047-6ce198362d5a"},"once":false}︡{"done":true}︡
︠cdf5f576-201d-4109-a0b8-bbcab262b22d︠
y = x^2
diff(y, x)
︡058c6806-5daa-4b35-952e-6c8341906697︡{"stdout":"2*x\n"}︡{"done":true}︡
︠1f878348-98c2-4ff2-9e53-3eb7285044a3s︠
x = var('x')
y = function('y')(x)
desolve(diff(y, x) -2*y*(3-y) == 0, y, ics = [0, 100])
︡40908021-b975-47f6-93ed-fecbe55565f7︡{"stdout":"-1/6*log(y(x) - 3) + 1/6*log(y(x)) == x - 1/6*log(97) + 1/3*log(10)\n"}︡{"done":true}︡
︠99e47a1a-4b0c-4e5e-9000-4b2fdd8d1141︠









