#!/bin/sh

ORB_EVAL_FROM="$(circleci env subst "${ORB_EVAL_FROM}")"
ORB_EVAL_TO="$(circleci env subst "${ORB_EVAL_TO}")"
ORB_STR_ARGUMENTS="$(echo "${ORB_STR_ARGUMENTS}" | circleci env subst)"
ORB_STR_PROFILE_NAME="$(circleci env subst "${ORB_STR_PROFILE_NAME}")"

if [ -n "${ORB_STR_ARGUMENTS}" ]; then
    set -- "$@" "${ORB_STR_ARGUMENTS}"
fi
set -x
aws s3 sync "${ORB_EVAL_FROM}" "${ORB_EVAL_TO}" --profile "${ORB_STR_PROFILE_NAME}" "$@"
set +x