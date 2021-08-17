#!/usr/bin/env bash
set -eo pipefail

TF_FILE_PATH=$(find . -name "*.tf" -type f)
EXIT_CODE=0

for file_path in ${TF_FILE_PATH}; do
  check_line=$(awk '/( .tags \{| .tags = \{)/, /[^([:alnum:](=?[:punct:]))]}/' ${file_path} |
    xargs |
    sed -e 's/ } /\n/g; s/ }//g; s/tags { //g' |
    grep -v "Managed = Terraform" || true);
  if [[ "${check_line}" != "" ]]; then
    1>&2 echo -e '\033[31m'${file_path}' tags need add Managed = "Terraform" \033[m';
    1>&2 echo "tags block => ${check_line}";
    EXIT_CODE=1;
  fi;
done

exit "${EXIT_CODE}"
