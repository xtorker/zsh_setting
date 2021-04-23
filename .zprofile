# For zsh-autoswitch-conda
. /home/chenghao/anaconda3/etc/profile.d/conda.sh
export AUTOSWITCH_DEFAULT_CONDAENV='base'
export AUTOSWITCH_SILENT=1 # set a non-empty value to eliminate output msg

# Start from Ubuntu 20.04, CUDA is install in the below path
export LD_LIBRARY_PATH=/usr/lib/cuda/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/lib/cuda/include:$LD_LIBRARY_PATH

# YourIP:0.0 for default setting in VcXsrv
# '0.0' can be found in Windows system tray 
export DISPLAY="140.114.79.74:40.0"
