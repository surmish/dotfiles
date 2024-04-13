# Function to check if a given path is already in the specified environment variable
path_includes() {
	local env_var_value="$(eval echo \$$1)"
	case ":$env_var_value:" in
	*":$2:"*) true ;;
	*) false ;;
	esac
}

# Function to append a path to the specified environment variable if it's not already included
append_path() {
	if ! path_includes "$1" "$2"; then
		eval export $1="\$$1:$2"
		# echo "Appended $2 to $1."
	fi
}

# Function to prepend a path to the specified environment variable if it's not already included
prepend_path() {
	if ! path_includes "$1" "$2"; then
		eval export $1="$2:\$$1"
		# echo "Prepended $2 to $1."
	fi
}

# Function to print PATH and LD_LIBRARY_PATH path vars
ppl() {
	echo "PATH:"
	echo "$PATH" | tr ':' '\n'
	echo ""
	echo "LD_LIBRARY_PATH:"
	if [ -z "$LD_LIBRARY_PATH" ]; then
		echo "LD_LIBRARY_PATH is not set."
	else
		echo "$LD_LIBRARY_PATH" | tr ':' '\n'
	fi
}

mkcd() {
	mkdir -p "$1"
	cd "$1" || exit 1
}
