#!/usr/bin/env bash 
#SBATCH -p sched_17806         # name of runtime queue
#SBATCH --nodes=2               # number of nodes
#SBATCH --ntasks-per-node=13    # number of cores
#SBATCH -t 1:00                 # wall-time (mm:ss)
#SBATCH -J simple               # job name
#SBATCH -o log.%j               # output

echo '==========' 
cd ${SLURM_SUBMIT_DIR} 
echo ${SLURM_SUBMIT_DIR} 
echo Running on host $(hostname) 
echo Time is $(date) 
echo SLURM_NODES are $(echo ${SLURM_NODELIST}) 
echo '==========' 

mpirun -n 1 Rscript --no-save --no-restore --verbose simple.r > simple.Rout 2>&1
