# OpenACC_DDT
1. Install Linaro Forge 23.0 with EasyBuild<br>
    module load LUMI/22.12<br>
    module load EasyBuild-user<br>
    eb LinaroForge-23.0.eb -r<br>

3. Install new Linaro version locally and under Remote Launch -> Configure -> Edit set the remote installation directory to /users/<username>/EasyBuild/SW/LUMI-22.12/G/Linaro_Forge/23.0  (or whereever you installed it)
![image](https://github.com/mihkeltiks/OpenACC_DDT/assets/138012113/34f60194-fc32-4ef9-b018-7fa59506cd01)

4. Compile pi_openacc.f90 like: <br>
    module load cce/15.0<br>
    module load PrgEnv-cray<br>
    module load rocm<br>
    module load craype-accel-amd-gfx90a<br>
    ftn -hacc -g -O0 -o pi_openacc pi_openacc.f90<br>
    
5. Change the account (and other settings) setting in the batch script and run it: sbatch pi_acc.slurm

6. Select ROCm when starting script

7. Add a breakpoint in the code by selecting at Control -> Add Breakpoint and then write in the function line your break function. Or just by clicking left of the code line numbers.
![image](https://github.com/mihkeltiks/OpenACC_DDT/assets/138012113/b2eca4c1-3420-4cea-a533-d5538646cef6)
![image](https://github.com/mihkeltiks/OpenACC_DDT/assets/138012113/4d728b1c-5e4a-4f91-b95d-27b2078eeb91)

8. After Breakpoint is created you should see this in the Breakpoint tab.
![image](https://github.com/mihkeltiks/OpenACC_DDT/assets/138012113/3560d922-698c-40a4-83e6-627b5f76f985)

9. Then run the click continue and wait until program stops with this prompt and then pause.
![image](https://github.com/mihkeltiks/OpenACC_DDT/assets/138012113/e7b97c95-69d3-4911-b720-a7c7497045d0)

