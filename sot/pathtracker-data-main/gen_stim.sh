#!/bin/bash
#SBATCH --time=96:00:00
#SBATCH -n 10
#SBATCH -N 1 
#SBATCH --mem=20GB
#SBATCH -J MOT_data
#SBATCH -o /users/aarjun1/data/aarjun1/pathtracker/sot/pathtracker-data-main/logs/MI_%A_%a_%J.out
#SBATCH -e /users/aarjun1/data/aarjun1/pathtracker/sot/pathtracker-data-main/logs/MI_%A_%a_%J.err
#SBATCH --account=carney-tserre-condo
##SBATCH --array=0-1

cd ~/data/aarjun1/pathtracker/sot/pathtracker-data-main/

module load anaconda/3-5.2.0
module load python/2.7.16

source activate stim_gen


echo $SLURM_ARRAY_TASK_ID


# radius=1 #default=1 height and width of the squares in stimuli
# # start_sample=0
# # last_sample=$(ls -lat | head -2 | tail -1 | awk '{print $9}' | cut -d "_" -f 2)
# # echo $last_sample
# # arrIN=(${last_sample//_/ })
# # echo $arrIN
# num_samples=10000 #0000
# num_distractors=14 #10 #default=10 number of distractor paths
# extra_dist=0 #4 #default=4 number of extra distractor paths
# HUMAN_MODE=0 #default=0 Generate movie in human mode with lines [REMOVED]
# skip_param=1 #default=1 number of coordinates to skip when generating coordinates. Increase speed/path length. MIN:1, MAX:5
# path_length=64 #default=64 length of the trajectory, also equals the number of frames in the sequence
# NEGATIVE_SAMPLE=0 #default=0 Generate a negative sample of movie
# gif=0 #default=0 Generate a gif of movie as well in the same folder as path [REMOVED]
# save_image=0 #default=0 save images of the generated sample as .png files
# path="/users/aarjun1/data/aarjun1/pathtracker/mot/pathtracker-data-main/path/" #default=pwd path at which the stimuli should be stored
# outer_path="/users/aarjun1/data/aarjun1/pathtracker/mot/pathtracker-data-main/outer_path/" #outer path under which the pos and neg stim directories reside
# # echo $path
# # echo $outer_path
# # last_sample=$(ls -lat | head -2 | tail -1 | awk '{print $9}' ) # | cut -d "_" -f 2)
# #USE the below logic to restart the code to generate samples from where the last one left off.
# #Possible reason for stalling would be not finding the right set of coordinates for randomizing trajectories.
# # last_sample=$(ls -lshtr $path | tail -1 | awk '{print $10}' | cut -d "_" -f 3 | cut -d "." -f 1)
# # last_sample=-1
# # echo $last_sample
# # start_sample=$(($last_sample-3))
# start_sample=0
# echo $start_sample
# # echo "Bash version ${BASH_VERSION}..."

# # for i in {"$start_sample".."$num_samples"}
# #  echo "Welcome $i times"
# # echo "$path/sample_$i/"
# #  echo $radius

python -u cluster_store_individual_modular_spline_curve_generator_path_finder_motion_race_distractor_many_fixed_blob_128_permanent_markers_square_numpy.py # -r $radius -n $num_samples -ss $start_sample -nd $num_distractors -ed $extra_dist -HM $HUMAN_MODE -pl $path_length -sp $skip_param -NS $NEGATIVE_SAMPLE --gif $gif -si $save_image --path $outer_path #--path "$path/sample_$i"


# echo $radius
# echo $path