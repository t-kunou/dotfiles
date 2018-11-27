#!/bin/sh

find . -type f | grep -v '.git' | grep -v 'README.md' | grep -v 'gen_dotfiles.sh' | sed 's/\.\///' | xargs -Iname echo "ln -s dotfiles/"name" ~/."name | sh
