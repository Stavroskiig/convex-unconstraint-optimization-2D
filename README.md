# Convex Optimization Using Derivatives

This project focuses on the problem of minimizing a given convex function of multiple variables f: ℝ^n^→ℝ without constraints. The algorithms used are based on the idea of iterative descent, starting from some point $x_0$∈ℝ^n^ and generating successive vectors $x_1$, $x_2$, ..., so $f(x_{k+1})$<$f(x_{k})$, $k=1, 2, 3, ...$ aiming to find the minimum.

The search algorithms studied are:

-   **Steepest Descent method**
-   **Newton's method**
-   **Levenberg-Marquardt method**

The objective function studied is: $f(x,y)=x^5e^{-(x^2-y^2)}$
