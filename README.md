### Anti-lock Braking System (ABS) Simulation using Matlab and Simulink Modeling

Anti-lock Braking System (ABS) is a system that automatically adjusts the braking force of the wheels when the vehicle is braking. It can prevent the wheels from locking to obtain the best braking effect and improve the directional stability of the automobile. In this study, the ABS system model based on Matlab/Simulink will be introduced, including single wheel vehicle model, tire model and vehicle braking system model. 
Anti-lock braking systems (ABS) are used to control the wheel slip to keep the friction coefficient close to the optimal value. Wheel slip is defined as the relative motion between a wheel (tire) and the surface of the road, during vehicle movement. Wheel slip occurs when the angular speed of the wheel (tire) is greater or less compared to its free-rolling speed. To simulate the braking dynamics of a vehicle, we are going to simulate simplified mathematical models (quarter-car model) for both vehicle and wheel. Also, a simplified ABS controller is going to be implemented to emulate the braking torque in slip conditions.

### Vehicle model basic principles


![Fig1](https://user-images.githubusercontent.com/81799459/207155786-b914cd8b-8e26-4c57-89b0-b05fb500e511.jpg)

Figure 1: Vehicle under braking conditions [1].

If we consider a vehicle moving in a straight direction under braking conditions, we can write the equations of equilibrium. For horizontal direction [1]:

$F_f=-F_i$    (1)

where $F_f$ is the friction force between wheel and ground and $F_i$ is the inertial force of the vehicle. For vertical direction:

$N = W$   (2)

where N  is the normal force (road reaction) and W is the vehicle weight. The friction force can be expressed as:

$F_f=μ \times N$  (3)

where μ is the friction coefficient between wheel and road. The vehicle’s weight is:

$W=m_v \times g$  (4)

Replacing (2) and (4) in (3) yields the expression of the friction force as:

$F_f=-μ \times m_v \times g$       (5)   

where$ m_v$ is the total vehicle mass in kg and g is the gravitational acceleration in $m⁄s^2$ . The inertia force is the product between the vehicle mass $m_v$ in kg and vehicle acceleration $a_v$ in $m/s^2$:

$F_i = m_v \times a_v = m_v \times v ̇_v$   (6)

where $v_v$ is the vehicle speed in m/s. From equations (1), (5) and (6) the vehicle acceleration will be extracted as:

$v ̇_v=1/m_v \times (-μ \times m_v \times g)$  (7)

Vehicle speed is obtained by integration of equation (7).

### Wheel model


![Fig2](https://user-images.githubusercontent.com/81799459/207160151-8cf57aa7-30dd-47b2-a68f-682ff79400c7.jpg)

Figure 2: Acting forces during wheel braking [1].

During braking, the driver applies a braking torque T_b in [Nm] to the wheels. The friction force F_f in [N] between the wheel and road creates an opposite torque with the wheel radius r_w in m. For simplification, we are going to consider that the wheel is rigid, and the normal force (road reaction) passes through the wheel hub, therefore doesn’t add an additional torque. We can write the equation of equilibrium for the wheel as:

$J_w \times ω ̇_w=F_i \times r_w-T_b$       (8) 

where $J_w$ [kg·m2] is the wheel’s moment of inertia and $ω_w$ [rad/s] is the angular speed of the wheel.        
From equation (8) we can extract the expression of the wheel acceleration:

$ω ̇_w = (1/J_w) \times (F_i \times r_w-T_b )$      (9)

Wheel speed is obtained by integration of equation (9).


### Wheel slip
The ABS system must control the wheel slip λ around an optimal target. The wheel slip is calculated as [1]:

$λ=(v_v-〖r_w \times ω〗_v)/(v_v)$    (10)

where $ω_v$ [rad/s] is the equivalent angular speed of the vehicle, equal with:

$ω_v=v_v/r_w$        (11)

where $v_v$ [m/s] is the vehicle speed.

### Friction coefficients calculation
The friction coefficient between wheel and road depends on several factors, like wheel slip, vehicle speed, and the type of the road surface. For our simulation purpose, we are going to consider only the variation of the friction coefficient function on the longitudinal wheel slip. During braking, if the wheel slip is 100 %, the wheel is locked but the vehicle is still moving. At 0 % slip, the wheel and vehicle have the same speed [1]. The optimum friction coefficient (highest value) is obtained when the wheel slip is around 20 %. If the wheel slip enters the unstable area, the friction coefficient will decrease, and the wheel will lock causing skid and vehicle instability. For this example, the ABS systems will have to keep the wheel slip around 20 %, where friction coefficient has the highest values. 
Several tire friction models describing the nonlinear behavior are reported in the literature. There are static models as well as dynamic models. The most reputed tire models are by Layne [3] and by Pacejka [4], also known as magic formula and it is derived heuristically from experimental data. In this study, the Burckhardt model [5] will be used, as it is particularly suitable for analytical purpose while retaining a good degree of accuracy in the description of the friction coefficient. The friction coefficients can be expressed as an empirical function, where the wheel slip is a function argument:

$μ(λ,v)=[A(1-e^{-Bλ} )-Cλ] e^{-Dλv}$            (12)    

where λ is the wheel slip and A, B, C, D are the empirical coefficients. The Simulink model for the friction coefficients versus the wheel slip is shown in Figure 3.

Depending on the value of the coefficients A, B, C and D, the empirical formula (12) can be used to represent the friction coefficient for different road types/states [5].


![Table1](https://user-images.githubusercontent.com/81799459/207165072-e8153c2d-e438-4426-bbce-b7a5d67a119e.jpg)




Using a Matlab script (friction_slip_curves.m), for v=30 m/s, we can plot the variation of the friction coefficient function of slip, for different road conditions.










