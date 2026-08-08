set default-list := true

add url path:
  git submodule add {{url}} {{path}}

update:
  git submodule update --recursive

remove path:
  git submodule deinit -f -- {{path}}
  rm -rf .git/modules/{{path}}
  git rm -f {{path}}

init path:
  git submodule update --init --recursive {{path}}

init-submodules:
  git submodule update --init --recursive

