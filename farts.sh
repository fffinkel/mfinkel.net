#!/bin/sh
set -e
set -x
echo "Beginning setup"

# TODO
# - source environment-specific exports

command -v go >/dev/null 2>&1 || { echo "ERROR: go is not installed" >&2; exit 1; }
command -v git >/dev/null 2>&1 || { echo "ERROR: git is not installed" >&2; exit 1; }
command -v screen >/dev/null 2>&1 || { echo "ERROR: screen is not installed" >&2; exit 1; }
command -v vim >/dev/null 2>&1 || { echo "ERROR: vim is not installed" >&2; exit 1; }

mkdir $HOME/cnf
git clone git@github.com:fffinkel/zsh.git $HOME/cnf/zsh
make -C $HOME/cnf/zsh install

git clone git@github.com:fffinkel/vim.git $HOME/cnf/vim
make -C $HOME/cnf/vim install

git clone git@github.com:fffinkel/dotfiles.git $HOME/cnf/dotfiles
make -C $HOME/cnf/dotfiles install

echo "[user]" > ~/.gitconfig
echo "	email = finkel.matt@gmail.com" >> ~/.gitconfig
echo "	name = Matt Finkel" >> ~/.gitconfig

echo "alias s='screen -dRR'" >> ~/.bashrc

