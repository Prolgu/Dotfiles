#!/usr/bin/env bash
#-*- coding: utf-8 -*-
#
#  mk-git-repo.sh
#
#  2021 <https://github.com/Prolgu>
#
#
#
# Code start {{{


set -o pipefail
set -o errexit
set -o nounset

create_project() {
    local repo_name="$1"
    local dir_name=`basename $(pwd)`

    if [ "$repo_name" = "" ]; then
        echo -n "  Nombre del repo (enter para usar'$dir_name')?"
        read repo_name
    fi

    if [ "$repo_name" = "" ]; then
        repo_name=$dir_name
    fi

    local project_root="$HOME/Develop"
    echo "Creando proyecto en $project_root/$repo_name"
    local project_abs_path="$project_root/$repo_name"
    mkdir -p "$project_abs_path"
    cd "$project_abs_path"
    # git init --initial-branch=main
    git init
    echo "#$1">> README.md
    git add README.md
    # git branch -m "Main"
    git commit -m "Commit inicial"
    # cd "$project_abs_path"
}

create_project "$@"



# Code end }}}
