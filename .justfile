set unstable
set lists

git_mod_dir := "$(git rev-parse --path-format=absolute --git-common-dir)/modules"

init: init-submodules

add-submodule url path:
    git submodule add {{ url }} {{ path }}

remove-submodule path:
    git submodule deinit -f -- {{ path }}
    rm -rf {{ git_mod_dir }}/{{ path }}
    git rm -f {{ path }}

[cache]
[script]
init-submodules:
    git submodule update --init --recursive

update-submodules:
    git submodule update --recursive
