# Set up configfiles from repo
rm ~/.vimrc
rm -r ~/.vim
ln -s ~/Configfiles/.vimrc ~/.vimrc
ln -s ~/Configfiles/.vim ~/.vim


# Prompt stiles
LIGHT_GREEN="\[\e[1;92m\]"
DARK_GREEN="\[\e[38;5;28m\]"
DARK_RED="\[\e[38;5;88m\]"
DARK_MAGENTA="\[\e[38;5;98m\]"
DARK_BLUE="\[\e[38;5;26m\]"
DARK_GRAY="\[\e[38;5;15m\]"
LIGHT_RED="\[\e[1;31m\]"
LIGHT_MAGENTA="\[\e[1;35m\]"
LIGHT_CYAN="\[\e[1;36m\]"
WHITE="\[\e[1;37m\]"

function set_git_branch {
  # Capture the output of the "git status" command.
  local git_status="$(git status -unormal 2>&1)"

  if [[ "$git_status" =~ not\ a\ git\ repo ]]; then
      BRANCH=''
      return
  fi

  if [[ ${git_status} =~ "working tree clean" ]]; then
    state=${DARK_GREEN}
  elif [[ ${git_status} =~ "Changes to be committed" ]]; then
    state="${DARK_MAGENTA}"
  else
    state="${LIGHT_RED}"
  fi

  # Get the name of the branch.
  branch_pattern="^On branch ([^${IFS}]*)"
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch="${BASH_REMATCH[1]}"
  else
    branch=''
  fi

  # Set the final branch string.
  BRANCH=":${state}${branch}${DARK_GRAY}${remote}"
}

function set_bash_prompt () {
  # Set the BRANCH variable.
  set_git_branch

  # Set the bash prompt variable.
  PS1="${DARK_BLUE}\w${DARK_GRAY}${BRANCH}${DARK_GRAY}\$ "
}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=set_bash_prompt
