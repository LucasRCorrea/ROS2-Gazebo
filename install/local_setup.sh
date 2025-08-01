# generated from colcon_core/shell/template/prefix.sh.em

# This script extends the environment with all packages contained in this
# prefix path.

# since a plain shell script can't determine its own path when being sourced
# either use the provided COLCON_CURRENT_PREFIX
# or fall back to the build time prefix (if it exists)
_colcon_prefix_sh_COLCON_CURRENT_PREFIX="/home/rodrigo/Downloads/ROS2Gazebo/install"
if [ -z "$COLCON_CURRENT_PREFIX" ]; then
  if [ ! -d "$_colcon_prefix_sh_COLCON_CURRENT_PREFIX" ]; then
    echo "The build time path \"$_colcon_prefix_sh_COLCON_CURRENT_PREFIX\" doesn't exist. Either source a script for a different shell or set the environment variable \"COLCON_CURRENT_PREFIX\" explicitly." 1>&2
    unset _colcon_prefix_sh_COLCON_CURRENT_PREFIX
    return 1
  fi
else
  _colcon_prefix_sh_COLCON_CURRENT_PREFIX="$COLCON_CURRENT_PREFIX"
fi

# function to prepend a value to a variable
# which uses colons as separators
# duplicates as well as trailing separators are avoided
# first argument: the name of the result variable
# second argument: the value to be prepended
_colcon_prefix_sh_prepend_unique_value() {
  # arguments
  _listname="$1"
  _value="$2"

  # get values from variable
  eval _values=\"\$$_listname\"
  # backup the field separator
  _colcon_prefix_sh_prepend_unique_value_IFS="$IFS"
  IFS=":"
  # start with the new value
  _all_values="$_value"
  _contained_value=""
  # iterate over existing values in the variable
  for _item in $_values; do
    # ignore empty strings
    if [ -z "$_item" ]; then
      continue
    fi
    # ignore duplicates of _value
    if [ "$_item" = "$_value" ]; then
      _contained_value=1
      continue
    fi
    # keep non-duplicate values
    _all_values="$_all_values:$_item"
  done
  unset _item
  if [ -z "$_contained_value" ]; then
    if [ -n "$COLCON_TRACE" ]; then
      if [ "$_all_values" = "$_value" ]; then
        echo "export $_listname=$_value"
      else
        echo "export $_listname=$_value:\$$_listname"
      fi
    fi
  fi
  unset _contained_value
  # restore the field separator
  IFS="$_colcon_prefix_sh_prepend_unique_value_IFS"
  unset _colcon_prefix_sh_prepend_unique_value_IFS
  # export the updated variable
  eval export $_listname=\"$_all_values\"
  unset _all_values
  unset _values

  unset _value
  unset _listname
}

# add this prefix to the COLCON_PREFIX_PATH
_colcon_prefix_sh_prepend_unique_value COLCON_PREFIX_PATH "$_colcon_prefix_sh_COLCON_CURRENT_PREFIX"
unset _colcon_prefix_sh_prepend_unique_value

# check environment variable for custom Python executable
if [ -n "$COLCON_PYTHON_EXECUTABLE" ]; then
  if [ ! -f "$COLCON_PYTHON_EXECUTABLE" ]; then
    echo "error: COLCON_PYTHON_EXECUTABLE '$COLCON_PYTHON_EXECUTABLE' doesn't exist"
    return 1
  fi
  _colcon_python_executable="$COLCON_PYTHON_EXECUTABLE"
else
  # try the Python executable known at configure time
  _colcon_python_executable="/usr/bin/python3"
  # if it doesn't exist try a fall back
  if [ ! -f "$_colcon_python_executable" ]; then
    if ! /usr/bin/env python3 --version > /dev/null 2> /dev/null; then
      echo "error: unable to find python3 executable"
      return 1
    fi
    _colcon_python_executable=`/usr/bin/env python3 -c "import sys; print(sys.executable)"`
  fi
fi

# function to source another script with conditional trace output
# first argument: the path of the script
_colcon_prefix_sh_source_script() {
  if [ -f "$1" ]; then
    if [ -n "$COLCON_TRACE" ]; then
      echo "# . \"$1\""
    fi
    . "$1"
  else
    echo "not found: \"$1\"" 1>&2
  fi
}

# get all commands in topological order
_colcon_ordered_commands="$($_colcon_python_executable "$_colcon_prefix_sh_COLCON_CURRENT_PREFIX/_local_setup_util_sh.py" sh)"
unset _colcon_python_executable
if [ -n "$COLCON_TRACE" ]; then
  echo "_colcon_prefix_sh_source_script() {
    if [ -f \"\$1\" ]; then
      if [ -n \"\$COLCON_TRACE\" ]; then
        echo \"# . \\\"\$1\\\"\"
      fi
      . \"\$1\"
    else
      echo \"not found: \\\"\$1\\\"\" 1>&2
    fi
  }"
  echo "# Execute generated script:"
  echo "# <<<"
  echo "${_colcon_ordered_commands}"
  echo "# >>>"
  echo "unset _colcon_prefix_sh_source_script"
fi
eval "${_colcon_ordered_commands}"
unset _colcon_ordered_commands

unset _colcon_prefix_sh_source_script

unset _colcon_prefix_sh_COLCON_CURRENT_PREFIX
