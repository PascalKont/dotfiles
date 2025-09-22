#! bash oh-my-bash.module

function setup_chezmoi() {
  echo "Installing Chezmoi on ${1}"
  cmd='sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply'
  ssh ${1} "${cmd} ${GITHUB_USERNAME}"
}
