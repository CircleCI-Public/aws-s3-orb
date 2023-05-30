#!/bin/sh
ORB_EVAL_FROM=$(eval echo "${ORB_EVAL_FROM}")
ORB_EVAL_TO=$(eval echo "${ORB_EVAL_TO}")
ORB_EVAL_ARGUMENTS=$(eval echo "${ORB_EVAL_ARGUMENTS}")

if [ -n "${ORB_EVAL_ARGUMENTS}" ]; then
    set -- "$@" "${ORB_EVAL_ARGUMENTS}"
fi

set -x
aws s3 sync "${ORB_EVAL_FROM}" "${ORB_EVAL_TO}" --profile "${ORB_VAL_PROFILE_NAME}" "$@"
set +x