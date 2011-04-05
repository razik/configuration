#!/bin/sh

SCRIPT_DIR=`pwd`

ln -sinv $SCRIPT_DIR                    $HOME/.configuration
ln -sinv $SCRIPT_DIR/astyle/astylerc    $HOME/.astylerc
ln -sinv $SCRIPT_DIR/zsh/zshrc          $HOME/.zshrc
