* Abduraghman Behardien
* CHE4070F Assignment 5
* Question 1
* Plant 3  

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
R11           Residual heat from interval 11 to 12; 

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
Cost          Objective function to be minimized;


*Objective function
Cost..z=e=QHU;

*Entahlpy balance in interval 1
INT1..QHU-R1-1170=E=0;

*Entahlpy balance in interval 2
INT2..R1-R2-80=E=0;

*Entahlpy balance in interval 3
INT3..R2-R3+200=E=0;

*Entahlpy balance in interval 4
INT4..R3-R4-50=E=0;

*Entahlpy balance in interval 5
INT5..R4-R5+450=E=0;

*Entahlpy balance in interval 6
INT6..R5-R6+600=E=0;

*Entahlpy balance in interval 7
INT7..R6-R7+60=E=0;

*Enthalpy balance in interval 8
INT8..R7-R8-220=E=0;

*Enthalpy balance in interval 9
INT9..R8-R9-1250=E=0;

*Enthalpy balance in interval 10
INT10..R9-R10-780=E=0;

*Enthalpy balance in interval 11
INT11..R10-R11-40=E=0;

*Enthalpy balance in interval 13
INT12..R11-QCU+20=E=0;


Model HENS /All/ ;

Solve HENS using lp minimizing z ;

Display QHU.L, QCU.L, R1.L, R2.L, R3.L, R4.L, R5.L, R6.L, R7.L, R8.L, R6.L, R9.L, R10.L, R11.L;