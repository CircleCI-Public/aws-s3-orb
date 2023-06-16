#!/bin/bash
set -x
ORB_EVAL_FROM=$(circleci env subst "${ORB_EVAL_FROM}")
ORB_EVAL_TO=$(circleci env subst "${ORB_EVAL_TO}")
ORB_EVAL_ARGUMENTS=$(echo "${ORB_EVAL_ARGUMENTS}" | circleci env subst)
ORB_EVAL_PROFILE_NAME=$(circleci env subst "${ORB_EVAL_PROFILE_NAME}")
# shellcheck disable=SC2086
if [ -n "${ORB_EVAL_ARGUMENTS}" ]; then
    IFS=' '
    set --
    for arg in ${ORB_EVAL_ARGUMENTS}; do
        set -- "$@" ${arg}
    done
    # IFS=' '
    # read -ra args <<< "${ORB_EVAL_ARGUMENTS}"
    # for arg in "${args[@]}"
    # do
    #     set -- "$@" "${arg}"
    # done        
    # echo "$@"

    # Split the string into individual arguments
    # IFS=' ' 
    # # read -ra args <<< "$ORB_EVAL_ARGUMENTS"
    # set --
    # modified_args=()

    # # Iterate over the arguments and remove single quotes
    # for arg in ${ORB_EVAL_ARGUMENTS}; do
    #     # Check if the argument starts with a double quote
    #     if [[ $arg == \"* ]]; then
    #         modified_args+=("$arg")  # Preserve double-quoted argument as is
    #     else
    #         # Remove single quotes from the argument
    #         modified_args+=("${arg//\'/}")
    #     fi
    # done
    # # Print the modified arguments
    # printf '%s\n' "${modified_args[@]}"
    # result=$(printf '%s ' "${modified_args[@]}" | tr -d "'")
    # set --
    # for arg in ${result}; do
    #     set -- "$@" "${arg}"
    # done

fi

aws s3 cp "${ORB_EVAL_FROM}" "${ORB_EVAL_TO}" --profile "${ORB_EVAL_PROFILE_NAME}" "$@"
set +x