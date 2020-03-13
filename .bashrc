# Set up configfiles from repo
rm ~/.bashrc
rm ~/.vimrc
rm -r ~/.vim
ln -s ~/Configfiles/.bashrc ~/.bashrc
ln -s ~/Configfiles/.vimrc ~/.vimrc
ln -s ~/Configfiles/.vim ~/.vim



# Prompt stiles
LIGHT_RED="\[\e[1;31m\]"
LIGHT_MAGENTA="\[\e[1;35m\]"
LIGHT_CYAN="\[\e[1;36m\]"
WHITE="\[\e[1;37m\]"

function set_git_branch {
  # Capture the output of the "git status" command.
  local git_status="$(git status -unormal 2>&1)"

  if [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
      BRANCH=''
      return
  fi

  if [[ ${git_status} =~ "working tree clean" ]]; then
    state=${GREEN}
  elif [[ ${git_status} =~ "Changes to be committed" ]]; then
    state="${LIGHT_MAGENTA}"
  else
    state="${LIGHT_RED}"
  fi

  # Set arrow icon based on status against remote.
  remote_pattern="Your branch is (.*) of"
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote=" ${LIGHT_MAGENTA}ahead"
    else
      remote=" ${LIGHT_RED}behind"
    fi
  else
    remote=''
  fi
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote=" {LIGHT_RED}conflicting"
  fi

  # Get the name of the branch.
  branch_pattern="^On branch ([^${IFS}]*)"
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=":${BASH_REMATCH[1]}"
  else
    branch=''
  fi

  # Set the final branch string.
  BRANCH="${state}${branch}${COLOR_NONE}${remote}"
}

function set_bash_prompt () {
  # Set the BRANCH variable.
  set_git_branch

  # Set the bash prompt variable.
  PS1="${LIGHT_CYAN}\w${WHITE}${BRANCH}${COLOR_NONE}\$ "
}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=set_bash_prompt
