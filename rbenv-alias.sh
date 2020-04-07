#!/bin/bash

RBENV_REPO="/usr/local/rbenv/versions"

for RUBYS in $(find ${RBENV_REPO} -maxdepth 1 | sed '1d' | grep -oP '(?<=versions/)(.*)' | egrep -v [0-9]-p)
do

  MAJOR_MINOR=$(echo ${RUBYS} | sed -E 's/(\.[0-9][0-9]$|\.[0-9]$)//')
  LAST_VERSION_INSTALED=$(ls ${RBENV_REPO} | grep -E "^${MAJOR_MINOR}" | sort -nr | head -1)

  for LAST in {0..20}
  do
    VERSION="${MAJOR_MINOR}.${LAST}"
    LAST_VERSION_LITERAL="$(echo ${VERSION} | sed s/\\.//g)"
    VERSION_LITERAL="$(echo ${RUBYS} | sed s/\\.//g)"

    if [[ ${LAST_VERSION_LITERAL} -lt ${VERSION_LITERAL} ]]
    then

         TYPE_FILE=$(find ${RBENV_REPO}/${VERSION} -maxdepth 1 -type d 2> /dev/null)
         [[ ! -z ${TYPE_FILE} ]] && export TYPE="diretorio" || export TYPE="link"

         if [[ ${TYPE} == "diretorio" ]]
         then
             echo "Removendo versao de Ruby e Recriando o Link => ${VERSION} => ${LAST_VERSION_INSTALED} => Tipo => $TYPE"

             [[ -d ${RBENV_REPO}/${VERSION} ]] && rm -rf ${RBENV_REPO}/${VERSION} && export REMOVIDO=true && sleep 2

             [[ -d ${RBENV_REPO}/${VERSION} ]] && export REMOVIDO=false

             [[ ${REMOVIDO} == true ]] && rbenv alias ${VERSION} ${LAST_VERSION_INSTALED}

         else
             echo "Criando alias de ${VERSION} => ${LAST_VERSION_INSTALED} => Tipo => $TYPE"
             rbenv alias ${VERSION} ${LAST_VERSION_INSTALED}

         fi
     fi
  done
  echo "--------------"
done
