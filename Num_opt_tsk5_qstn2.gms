* Abduraghman Behardien
* Qstn 5.2

Sets
    i   feedstocks /corn, glycerol, wood/
    j   transport  /trucks, railway, pipeline/
    k   plant      /plant_1, plant_2, plant_3/;

Parameters
    hv(i)     "LHV (kWh/kg)"
        / corn 4.63, glycerol 4.75, wood 4.28 /

    scost(i)  "Feedstock cost ($/kg)"
        / corn 0.025, glycerol 0.050, wood 0.060 /

    umax(i)   "Max supply (kg/year)"
        / corn 0.50e6, glycerol 0.45e6, wood 24e6 /

    tcost(j)  "Transport cost ($/kg.km)"
        / trucks 0.008, railway 0.006, pipeline 0.009 /

    HotDemand(k) "Hot utility demand (kW)"
        / plant_1 6560
          plant_2 2740
          plant_3 2280 /

    ColdDemand(k) "Cold utility demand (kW)"
        / plant_1 620
          plant_2 725
          plant_3 20 /;

Parameter weight(i,j,k);

Table weight_p1(i,j)
             trucks  railway  pipeline
    corn        12      17       14
    glycerol    16      20       18
    wood         7      14       15;

Table weight_p2(i,j)
             trucks  railway  pipeline
    corn        22      27       10
    glycerol    18      11       14
    wood        12       9       18;

Table weight_p3(i,j)
             trucks  railway  pipeline
    corn        14      15       13
    glycerol    10      14       12
    wood        14      13        8;

* Map to 3D parameter
weight(i,j,'plant_1') = weight_p1(i,j);
weight(i,j,'plant_2') = weight_p2(i,j);
weight(i,j,'plant_3') = weight_p3(i,j);

Scalar
    eff        "Boiler efficiency" /0.8/
    hours      "Operating hours (h/year)" /8000/
    ccost      "Cold utility cost ($/kW.year)" /6/;

Variables
    z           "Total cost ($/year)"
    x(i,j,k)    "Flow (kg/year)";

Positive Variable x;

Equations
    Obj
    SupplyLimit(i)
    Demand(k);

* Objective function
Obj ..
    z =e=
        sum((i,j,k),
            x(i,j,k)*scost(i)
          + x(i,j,k)*weight(i,j,k)*tcost(j)
        )
      + sum(k, ccost * ColdDemand(k));

* Supply constraint
SupplyLimit(i) ..
    sum((j,k), x(i,j,k)) =l= umax(i);

* Demand constraint (convert kW → kWh/year)
Demand(k) ..
    sum((i,j), x(i,j,k)*hv(i)*eff) =e= hours * HotDemand(k);

Model BioEnergy /all/;

Solve BioEnergy using LP minimizing z;

Display x.l, z.l;