# 5-Section Stripline Coupler (CST + MATLAB)

This repository contains the complete workflow (design → modeling → simulation) of a **5-section stripline directional coupler** implemented in **CST**.  
The multi-section coupling parameters and the **even/odd-mode impedances** are computed using a custom **MATLAB** script. Trace widths and spacings are obtained using an online coupled-stripline calculator.

## Repository Structure
- `CST/`  
  CST model file of the 5-section stripline coupler.
- `MATLAB/`  
  MATLAB script used to compute coupling coefficients and even/odd impedances for each section.
- `docs/report.md`  
  Full project report.
- `videos/`  
  Simulation export videos (MP4).
- `assets/figures/`  
  Figures used in the report.
- `assets/gifs/`  
  GIF animations (converted from MP4).

## Animations

### Port Mode
![Port Mode](assets/gifs/port_mode.gif)

### E-Field (Port1 & Port3)
![E-Field Port1 & Port3](assets/gifs/e_field_port1_port3.gif)

### E-Field (Port2 & Port4)
![E-Field Port2 & Port4](assets/gifs/e_field_port2_port4.gif)

## Full Report
See: [`docs/report.md`](docs/report.md)
