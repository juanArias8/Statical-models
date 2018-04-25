# -------------------------------------------------------------- #
# Example 1
a = [i for i in [1..9]]
b = [j for j in [-3..20]]
c = zip(a, b)
gc = list_plot(c, plotjoined=True, color='green')
show(gc)


# -------------------------------------------------------------- #
# Example 2
f(x) = x^3 + 3*x - 2
gf = plot(f)
show(gf)
show(gc + gf)


# -------------------------------------------------------------- #
# Example 3
x = var('x')
y = function('y')(x)
desolve(diff(y, x) -2*y*(3-y) == 0, y, ics = [0, 100])










