#!/bin/bash

# Default Git URL protocol
DEFAULT_URL_PROTOCOL="https"

# GitHub root URL
GITHUB_ROOT_URL="$DEFAULT_URL_PROTOCOL://github.com"

# Display usage information
usage() {
  echo "clone_repos.sh - Clones multiple repositories from GitHub with the specified branch and Git URL protocol"
  echo ""
  echo "Usage:"
  echo "  clone_repos.sh [-h] [-b branch] [-u protocol] repo1 repo2 repo3..."
  echo ""
  echo "Options:"
  echo "  -h      Display this help message"
  echo "  -b      Specify the branch name to clone (default is the default branch of the repository)"
  echo "  -u      Specify the Git URL protocol (either 'http' or 'ssh')"
  echo ""
  echo "Arguments:"
  echo "  repo1 repo2 repo3...  List of repository names to clone from GitHub"
  echo ""
  echo "The clone_repos.sh script clones multiple repositories from GitHub with the specified branch and Git URL protocol."
  echo "The repository names should be passed as command line arguments."
  echo "The script clones the repository with the 'git clone' command."
  exit 1
}

# Check if options are passed
while getopts "hb:u:" opt; do
  case $opt in
    h)
      usage
      ;;
    b)
      DEFAULT_BRANCH=$OPTARG
      ;;
    u)
      DEFAULT_URL_PROTOCOL=$OPTARG
      GITHUB_ROOT_URL="$DEFAULT_URL_PROTOCOL://github.com"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      ;;
  esac
done

# Remove the options from the arguments
shift $((OPTIND-1))

# Check if repository names are passed as command line arguments
if [ $# -eq 0 ]; then
  usage
fi

# Loop through the list of repository names
for repo_name in "$@"; do
  # Replace repository name in URL
  repo_url="$GITHUB_ROOT_URL/$repo_name.git"

  # If the default branch is set to "default", fetch the default branch name from the repository
  if [ "$DEFAULT_BRANCH" = "default" ]; then
    default_branch=$(curl -sL https://api.github.com/repos/$repo_name | jq -r '.default_branch')
  else
    default_branch=$DEFAULT_BRANCH
  fi

  # Clone the repository with the specified branch
  git clone -b $default_branch $repo_url
done
