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








