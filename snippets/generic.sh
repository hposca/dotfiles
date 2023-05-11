#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Script location
BASEDIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
script_fullname="${BASH_SOURCE[0]##*/}"
script_name="${script_fullname%.*}"
script_extension="${script_fullname##*.}"

# ---
# Initial checks
# ---

# NOTE: Use this `if` if you want your script to be sourced, not executed
# if [ "${BASH_SOURCE[0]}" -ef "$0" ]; then
#     echo "Hey, you should source this script, not execute it!"
#     exit 1
# fi

# NOTE: Use this `if` if you want to force the script to be run with superuser capabilities
# if [[ "$(id -u)" -ne 0 ]]; then
# 	echo "You should run this program as root"
# 	exit 1
# fi

# NOTE: Use this `if` to check that required commands are installed
# if [[ ! "$(command -v git)" ]]; then
# 	echo "You do not have git installed"
# 	exit 1
# fi

# NOTE: Powerful version of the command checking:
# function check_installed() {
# 	commands=("$@")
#
# 	fine=0
# 	for cmd in "${commands[@]}"; do
# 		if [[ ! "$(command -v "${cmd}")" ]]; then
# 			# echo "You do not have ${cmd} installed"
# 			fine=1
# 		fi
# 	done
#
# 	return "${fine}"
# }
#
# programs=(git go aws node jq python)
# if ! check_installed "${programs[@]}"; then
# 	echo "You don't have all the required programs installed."
# 	echo "Please make sure that you have installed:"
# 	echo "${programs[*]}" | sort
# 	exit 1
# fi

# NOTE: This is a simple map implementation
# NOTE: If a key is not found it throws a `unbound variable`
# declare -A map
# map+=(
# 	["one"]=1
# 	["two"]=2
# )
# key="two"
# echo "${map[${key}]}"

# ---
# Colors
# ---
MNORMAL='\e[0;'
MBOLD='\e[1;'
# MDIM='\e[2;'
# MITALIC='\e[3;'
# MUNDERLINE='\e[4;'

# CBLACK='30m'
CRED='31m'
CGREEN='32m'
CYELLOW='33m'
# CBLUE='34m'
CMAGENTA='35m'
CCYAN='36m'
# CLIGHTGRAY='37m'
# CDEFAULT='39m'
# CDARKGRAY='90m'
# CLIGHTRED='91m'
# CLIGHTGREEN='92m'
# CLIGHTYELLOW='93m'
# CLIGHTBLUE='94m'
# CLIGHTMAGENTA='95m'
# CLIGHTCYAN='96m'
# CWHITE='97m'

# BBLACK='40'
# BRED='41'
# BGREEN='42'
# BYELLOW='43'
# BBLUE='44'
# BMAGENTA='45'
# BCYAN='46'
# BLIGHTGRAY='47'
# BDEFAULT='49'
# BDARKGRAY='100'
# BLIGHTRED='101'
# BLIGHTGREEN='102'
# BLIGHTYELLOW='103'
# BLIGHTBLUE='104'
# BLIGHTMAGENTA='105'
# BLIGHTCYAN='106'
# BWHITE='107'

NC='\e[0m'

# ---
# App variables
# ---

export APP_NAME="Application"
export APP_VERSION='0.0.1'

AVAILABLE_VALIDATORS="one, two, three"
validator="${validator:-}"
thing="${thing:-nothing}"
DRYRUN="${DRYRUN:-}"
filenames=()

# ---
# Visualization functions
# ---

INFO="${MNORMAL}${CGREEN}"
WARN="${MNORMAL}${CYELLOW}"
NOTE="${MBOLD}${CCYAN}"
ERR="${MBOLD}${CRED}"

SPIN='⣾⣽⣻⢿⡿⣟⣯⣷'
SPINCOLOR="${MNORMAL}${CMAGENTA}"
SPINLENGTH="${#SPIN}"

function info() {
	message="${1}"
	printf "${INFO}INFO:${NC} %s\n" "${message}"
}

function note() {
	message="${1}"
	printf "${NOTE}NOTE:${NC} %s\n" "${message}"
}

function warn() {
	message="${1}"
	printf "${WARN}WARN:${NC} %s\n" "${message}"
}

# With the help of https://stackoverflow.com/a/12498305/3746786
function spin() {
	_pid="${1}"

	i=0
	while kill -0 "${_pid}" 2>/dev/null; do
		i=$(((i + 1) % SPINLENGTH))
		printf "\r${SPINCOLOR}%s${NC}" "${SPIN:$i:1}"
		sleep 1
	done
	printf "\r"
}

function abort() {
	local print_usage=1
	if [[ ${1:-} == --no-print-usage ]]; then
		print_usage=
		shift
	fi
	printf "${ERR}Error:${NC} %s\n" "$1" >&2
	if [[ -n $print_usage ]]; then
		usage >&2
	fi
	exit 1
}

# ---
# Script functions
# ---

function version() {
	printf '%s %s\n' "${APP_NAME}" "${APP_VERSION}"
}

function usage() {
	cat <<HELP_TEXT_HEADER
Usage: ${script_fullname} [OPTIONS] <path>
       ${script_fullname} [-h | -v]

HELP_TEXT_HEADER

	cat <<HELP_TEXT_BODY
  <path> is the path to a file

  -h, --help                Display this help message
  -v, --version             Display the version number
  -d, --dryrun, --dry-run   Sets Dry Run
  -V, --validator           Choose between one of the valid options: "${AVAILABLE_VALIDATORS}"
HELP_TEXT_BODY
}

# ---
# Arguments parsing
# ---

function parse_params() {
	local param

	while [[ "$#" -ne 0 ]]; do
		param="${1}"

		case "${param}" in
		-h | --help)
			version
			usage
			exit 0
			;;
		-v | --version)
			version
			exit 0
			;;
		-d | --dryrun | --dry-run) # A boolean variable
			DRYRUN=1
			;;
		-t | --thing) # A variable with a default value
			shift
			thing="${1}"
			;;
		-V | --validator) # A variable with a range of valid options
			shift
			if [[ ${1:-} =~ ^(one|two|three)$ ]]; then
				validator="$1"
			else
				abort "Unknown validator '${1:-}', valid options are: ${AVAILABLE_VALIDATORS}"
			fi
			;;
		-*)
			abort "Bad command line option '${1}'"
			;;
		*)
			filenames+=("${1}")
			;;
		esac

		shift
	done

}

# ---
# main
# ---
parse_params "${@}"

if [[ "${#filenames[@]}" -eq 0 ]]; then
	abort 'Must specify at least one <path>'
fi

if [[ "${DRYRUN}" ]]; then
	warn "Dry Run set"
fi

for filename in "${filenames[@]}"; do
	if [[ ! -e "${filename}" ]]; then
		abort "File named '${filename}' do not exist"
	fi
done

info "This is BASEDIR: ${BASEDIR}"
info "This is script full name: ${script_fullname}"
info "This is script name: ${script_name}"
info "This is script extension: ${script_extension}"
info ""
info "This is the chosen validator: ${validator}"
info "This is the thing: ${thing}"
info "These are the remaining filenames: ${filenames[*]}"

info "Running long command"

SECONDS=0
sleep 5 &
spin $!
duration=$SECONDS
note "Took $((duration / 60)) minutes and $((duration % 60)) seconds to run."
