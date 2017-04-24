
# Please set the appropriate paths
EXAMPLE=/caffe_project/lmdbs       			# Path where the output LMDB is stored
DATA=/caffe_project/datasets       			# Path where the data.txt file is present 
TOOLS=/caffe-master/build/tools    			# Caffe dependency to access the convert_imageset utility 
DATA_ROOT=/datasets/images/     			  # Path prefix for each entry in data.txt

# Checks for DATA_ROOT Path
if [ ! -d "$DATA_ROOT" ]; then
  echo "Error: DATA_ROOT is not a path to a directory: $DATA_ROOT"
  echo "Set the DATA_ROOT variable to the path where the data instances are stored."
  exit 1
fi

# Set the resize options
RESIZE=true
if $RESIZE; then
  RESIZE_HEIGHT=224
  RESIZE_WIDTH=224
else
  RESIZE_HEIGHT=0
  RESIZE_WIDTH=0
fi

# ------------------------------
# Creating LMDB
 echo "Creating data lmdb..."
 GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    $DATA_ROOT \
    $DATA/data.txt \
    $EXAMPLE/data_lmdb

# ------------------------------
echo "Done."



