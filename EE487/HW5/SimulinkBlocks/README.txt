README

1. Duty cycle saturation (forcing between 0 and 1) and sample-and-hold have been taken care of inside the fullbridge and halfbridge models.  The system’s switching frequency is determined by the frequency of the sawtooth signal generator inside these blocks.

2. The input to the inverter blocks is duty cycle.  You must therefore convert the command voltage output from your regulator block into a duty cycle command between 0 and 1.  This conversion typically will be a function of bus voltage.

3. These switch mode converter models can do strange things to the Simulink solvers - the model may simulate but give incorrect results such failing to switch when you would expect it to.  There are a few ways to handle this:  

	a. Use adaptive zero-crossing detection by enabling it in the Additional Options section of the Simulation -> Model Configuration Paramters menu
	b. Use a fixed-timestep solver