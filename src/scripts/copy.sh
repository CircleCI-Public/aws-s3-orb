#!/bin/sh
ORB_EVAL_FROM=$(eval echo "${ORB_EVAL_FROM}")
ORB_EVAL_TO=$(eval echo "${ORB_EVAL_TO}")
ORB_STR_ARGUMENTS=$(circleci env subst "${ORB_STR_ARGUMENTS}")
ORB_STR_PROFILE_NAME=$(circleci env subst "${ORB_STR_PROFILE_NAME}")

if [ -n "${ORB_STR_ARGUMENTS}" ]; then
    set -- "$@" "${ORB_STR_ARGUMENTS}"
fi

set -x
aws s3 cp "${ORB_EVAL_FROM}" "${ORB_EVAL_TO}" --profile "${ORB_STR_PROFILE_NAME}" "$@"
set +x