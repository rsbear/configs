# If you come from bash you might have to change your $PATH.
function vlaunch() {
  multipass launch --name microk8s-vm --mem 4G --disk 40G
  multipass exec microk8s-vm -- sudo snap install microk8s --classic
  multipass exec microk8s-vm -- sudo iptables -P FORWARD ACCEPT
}
function vdelete() {
  multipass delete microk8s-vm
  multipass purge
}
function vconnect() {
  multipass exec microk8s-vm -- sudo /snap/bin/microk8s.config > kubeconfig
  kubectl --kubeconfig=kubeconfig get all --all-namespaces
  multipass exec microk8s-vm -- sudo /snap/bin/microk8s.enable helm
  multipass exec microk8s-vm -- sudo /snap/bin/microk8s helm init
}

alias initvim="cd ~/.config/nvim/ && vim init.vim"
alias zshrc="vim ~/.zshrc"
alias zsh="chsh -s $(which zsh)"
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"
alias cat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)"
alias venter="multipass shell microk8s-vm"
alias vstop="multipass stop microk8s-vm"
alias vhelmversion="multipass exec microk8s-vm -- sudo /snap/bin/microk8s helm version"

# Path to your oh-my-zsh installation.
export ZSH="/Users/rsbear/.oh-my-zsh"
export PATH="/usr/local/bin:$PATH"
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

ZSH_THEME="avit"


plugins=(git kubectl tmux)

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(kubectl completion zsh)
export PATH="$HOME/.helm:$PATH"
source $HOME/.helm/helmenv.sh
