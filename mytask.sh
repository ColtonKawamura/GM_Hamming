#!/bin/bash
#SBATCH --job-name=Array_Tasks_Initial
#SBATCH --array=1-27
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --constraint=epyc
#SBATCH --cpus-per-task=1
#SBATCH --time=72:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mitchell.irmer@nps.edu
#SBATCH -o Initial_Run.out
#SBATCH --mem-per-cpu=4000

source /etc/profile
source ~/.bashrc

module load compile/intel-oneapi/2022.0.1
module load mpi/intel-oneapi/2021.5.0
module load app/lammps/20220623
module load util/ffmpeg/4.4.1

sed -n "${SLURM_ARRAY_TASK_ID}p" hamming_batch_jobs.script | /bin/bash