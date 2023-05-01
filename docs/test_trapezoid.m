% testing trapezoid_at, trapezoid_evaluate
close all;
clear;

% Case 1 : vi == vmax
Case1_0 = trapezoid_generate(1, 3, 2, 0.5, 2, -4, 1, -2);
Case1_1 = trapezoid_generate(1, 0, 2, 0.5, 2, -4, 1, -2);
Case1_2 = trapezoid_generate(1, -12, 2, 0.5, 2, -4, 1, -2);
trapezoid_evaluate(Case1_0 , 1)
trapezoid_evaluate(Case1_1 , 2)
trapezoid_evaluate(Case1_2 , 3)

% Case 2 : vi == vmin
Case2_0 = trapezoid_generate(0.5, 4, -2, 0.5, 2, -2, 2, -2);
Case2_1 = trapezoid_generate(0.5, 0, -2, 0.5, 2, -2, 2, -2);
Case2_2 = trapezoid_generate(0, -2, -2, 0.5, 2, -2, 2, -2);
trapezoid_evaluate(Case2_0 , 4)
trapezoid_evaluate(Case2_1 , 5)
trapezoid_evaluate(Case2_2 , 6)

% Case 3 
Case3_0 = trapezoid_generate(0.5, 4, 0, 0, 2, -2, 2, -2);
Case3_1 = trapezoid_generate(0.5, -4, 0, 0, 2, -2, 2, -2);
Case3_2 = trapezoid_generate(0.5, 1, -0.5, 0.5, 2, -2, 2, -2);
Case3_3 = trapezoid_generate(0.5, -1, -0.5, 0.5, 2, -2, 2, -2);
Case3_4 = trapezoid_generate(0.5, 1, 0.5, -0.5, 2, -2, 2, -2);
Case3_5 = trapezoid_generate(0.5, -1, 0.5, -0.5, 2, -2, 2, -2);

trapezoid_evaluate(Case3_0, 7)
trapezoid_evaluate(Case3_1, 8)
trapezoid_evaluate(Case3_2, 9)
trapezoid_evaluate(Case3_3, 10)
trapezoid_evaluate(Case3_4, 11)
trapezoid_evaluate(Case3_5, 12)
