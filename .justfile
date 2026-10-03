set unstable
set lists

add-submodule url path:
    #!/bin/sh
    git submodule add {{ url }} {{ path }}

remove-submodule path:
    #!/bin/sh
    GIT_MOD_DIR="$(git rev-parse --path-format=absolute --git-common-dir 2>/dev/null)/modules/{{ path }}"
    git submodule deinit -f -- {{ path }}
    rm -rf $GIT_MOD_DIR
    git rm -f {{ path }}

[cache(outputs = ["emacs/.git", "vim/.git"])]
init:
    #!/bin/sh
    git submodule update --init --recursive

update-submodules:
    #!/bin/sh
    git submodule update --recursive
