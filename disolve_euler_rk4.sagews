# ----------------------------------------------------------------------------------- #
# Example 1
var('y')
func = eulers_method(0.1 * sqrt(y) + 0.4 * x^2, 2, 4, 0.1, 2.5, algorithm="table")
P1 = list_plot(func)
P2 = line(pts)
(P1+P2).show()


# ----------------------------------------------------------------------------------- #
# Example 2
var('y')
pts = eulers_method(0.1 * sqrt(y) + 0.4 * x^2, 2, 4, 0.05, 2.5, algorithm='table')
P1 = list_plot(pts)
P2 = line(pts)
(P1+P2).show()


# ----------------------------------------------------------------------------------- #
# Example 3
var('y')
pts = eulers_method(5*x + y - 5, 0, 1, 1/2, 1, algorithm="none")
P1 = list_plot(pts)
P2 = line(pts)
(P1+P2).show()


# ----------------------------------------------------------------------------------- #
# Example 4
var('y')
pts = desolve_rk4(0.1 * sqrt(y) + 0.4 * x^2, y, ics=[2, 4], end_points = 2.5, step = 0.05)
pts
P1 = list_plot(pts)
P2 = line(pts)
(P1+P2).show()


# ----------------------------------------------------------------------------------- #
# Example 5
y = var('y')

ptsf1 = eulers_method(0.2*x*y, 1, 1, 0.1, 1.5, algorithm="none")
ptsf2 = desolve_rk4(0.2*x*y, y, ics = [1, 1], end_points = 1.5, step = 0.1)

lp_f1 = line(ptsf1)
lp_f2 = line(ptsf2)

(lp_f1 + lp_f2).show()


# ----------------------------------------------------------------------------------- #
# Example 6
org = [1000, 1003, 1006, 1010, 1013, 1017, 1020]
plt_y = list_plot(org, legend_label="Original points")

var("y")
alpha = 0.00343
pts = desolve_rk4(alpha*y, y, ics=[0, 1000], ivar=x, end_points=100, output="list", step=1)
pts
plt_pts = line(pts, color="red", legend_label="alpha * y")
plt_y + plt_pts


# ----------------------------------------------------------------------------------- #
# Example 7
var("y")
alpha = 0.00543
pts = desolve_rk4(alpha*y, y, ics=[20, 1071], ivar=x, end_points=100, output="list", step=1)
pts
plt_pts = line(pts, color="red", legend_label="alpha * y con incremento del 0.2%")
plt_pts










