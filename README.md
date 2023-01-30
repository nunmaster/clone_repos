# Clone Repositories from GitHub
This shell script allows you to clone multiple repositories from GitHub with the specified branch and Git URL protocol.

## Usage
```css
clone_repos.sh [-h] [-b branch] [-u protocol] repo1 repo2 repo3...
```

## Options
```css
-h      Display this help message
-b      Specify the branch name to clone (default is the default branch of the repository)
-u      Specify the Git URL protocol (either 'http' or 'ssh')
```

## Arguments
```ruby
repo1 repo2 repo3...  List of repository names to clone from GitHub
```

## Example
```css
# Clone multiple repositories with the default branch and Git URL protocol
./clone_repos.sh repo1 repo2 repo3

# Clone multiple repositories with the specified branch and Git URL protocol
./clone_repos.sh -b development -u ssh repo1 repo2 repo3
```

In this example, the clone_repos.sh script is used to clone multiple repositories from GitHub. The repository names are passed as command line arguments. The -b option allows you to specify the branch name to clone, and the -u option allows you to specify the Git URL protocol (either 'http' or 'ssh'). If the -b option is not specified, the script will clone the default branch of the repository. If the -u option is not specified, the script will use the default Git URL protocol (https).
