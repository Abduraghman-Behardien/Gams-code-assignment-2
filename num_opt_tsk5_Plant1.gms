* Abduraghman Behardien
* CHE4070F Assignment 5
* Question 1
*Plant 1

$Title Qstn1_plant1 Paper Production LP

*Utilities in kW
Variables
Z             minimum hot utility

Positive Variables
QHU           minimum hot utility
QCU           minimum cold utility
R1            Residual heat from interval 1 to 2
R2            Residual heat from interval 2 to 3
R3            Residual heat from interval 3 to 4
R4            Residual heat from interval 4 to 5
R5            Residual heat from interval 5 to 6
R6            Residual heat from interval 6 to 7
R7            Residual heat from interval 7 to 8
R8            Residual heat from interval 8 to 9
R9            Residual heat from interval 9 to 10
R10           Residual heat from interval 10 to 11
R11           Residual heat from interval 11 to 12
R12           Residual heat from interval 12 to 13
R13           Residual heat from interval 13 to 14; 

Equations
INT1          Entahlpy balance in interval 1
INT2          Entahlpy balance in interval 2
INT3          Entahlpy balance in interval 3
INT4          Entahlpy balance in interval 4
INT5          Entahlpy balance in interval 5
INT6          Entahlpy balance in interval 6
INT7          Entahlpy balance in interval 7
INT8          Entahlpy balance in interval 8
INT9          Entahlpy balance in interval 9 
INT10         Entahlpy balance in interval 10
INT11         Entahlpy balance in interval 11
INT12         Entahlpy balance in interval 12
INT13         Entahlpy balance in interval 13
INT14         Entahlpy balance in interval 14
Cost          Objective function to be minimized;


*Objective function
Cost..z=e=QHU;

*Entahlpy balance in interval 1
INT1..QHU-R1-420=E=0;

*Entahlpy balance in interval 2
INT2..R1-R2-340=E=0;

*Entahlpy balance in interval 3
INT3..R2-R3-900=E=0;

*Entahlpy balance in interval 4
INT4..R3-R4-870=E=0;

*Entahlpy balance in interval 5
INT5..R4-R5-220=E=0;

*Entahlpy balance in interval 6
INT6..R5-R6+110=E=0;

*Entahlpy balance in interval 7
INT7..R6-R7-20=E=0;

*Enthalpy balance in interval 8
INT8..R7-R8-1320=E=0;

*Enthalpy balance in interval 9
INT9..R8-R9-1260=E=0;

*Enthalpy balance in interval 10
INT10..R9-R10+120=E=0;

*Enthalpy balance in interval 11
INT11..R10-R11-300=E=0;

*Enthalpy balance in interval 12
INT12..R11-R12+150=E=0;

*Enthalpy balance in interval 13
INT13..R12-R13+280=E=0;

*Enthalpy balance in interval 14
INT14..R13-QCU+180=E=0;


Model HENS /All/ ;

Solve HENS using lp minimizing z ;

Display QHU.L, QCU.L, R1.L, R2.L, R3.L, R4.L, R5.L, R6.L, R7.L, R8.L, R6.L, R9.L, R10.L, R11.L, R12.L, R13.L;
