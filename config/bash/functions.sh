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
		# Remove leading colon if it exists
		eval export $1="\${$1#:}"
	fi
}

# Function to prepend a path to the specified environment variable if it's not already included
prepend_path() {
	if ! path_includes "$1" "$2"; then
		eval export $1="$2:\$$1"
		# echo "Prepended $2 to $1."
		# Remove trailing colon if it exists
		eval export $1="\${$1%:}"
	fi
}

# Function to print PATH and LD_LIBRARY_PATH path vars
ppl() {
	echo "PATH:"
	if [ -z "$PATH" ]; then
		echo "PATH is not set."
	else
		echo "$PATH" | tr ':' '\n'
	fi
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

function prompt_command_func {
	# Display the last command's exit status if it failed.
	local last_exit="$?"
	if [ "$last_exit" -ne 0 ]; then
		echo -e "Last command exit status: \033[1;31m$last_exit\033[0m"
	fi
}
