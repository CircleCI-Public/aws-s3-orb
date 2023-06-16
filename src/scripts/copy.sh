#!/bin/sh
ORB_EVAL_FROM="$(eval echo "${ORB_EVAL_FROM}")"
ORB_EVAL_TO="$(eval echo "${ORB_EVAL_TO}")"
ORB_STR_ARGUMENTS="$(echo "${ORB_STR_ARGUMENTS}" | circleci env subst)"
ORB_STR_PROFILE_NAME="$(circleci env subst "${ORB_STR_PROFILE_NAME}")"

if [ -n "${ORB_STR_ARGUMENTS}" ]; then
    IFS=' '
    set --
    for arg in $(echo "${ORB_STR_ARGUMENTS}" | sed 's/,[ ]*/,/g'); do
    set -- "$@" "$arg"
    done
fi

set -x
aws s3 cp "${ORB_EVAL_FROM}" "${ORB_EVAL_TO}" --profile "${ORB_STR_PROFILE_NAME}" "$@"
set +x