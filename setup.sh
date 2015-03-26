#!/bin/sh

YCM_OPT=''

while getopts ":c" opt; do
  case $opt in
    c)
      echo "Compiling VIM Clang support..." >&2
      YCM_OPT='--clang-completer'
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

exit

git submodule update --init --recursive

pushd vim/.vim/bundle/YouCompleteMe
./install.sh
popd

for dir in */; do stow $dir; done

