#!/bin/sh
ORB_EVAL_FROM=$(circleci env subst "${ORB_EVAL_FROM}")
ORB_EVAL_TO=$(circleci env subst "${ORB_EVAL_TO}")
ORB_EVAL_ARGUMENTS=$(circleci env subst "${ORB_EVAL_ARGUMENTS}")

if [ -n "${ORB_EVAL_ARGUMENTS}" ]; then
    set -- "$@" "${ORB_EVAL_ARGUMENTS}"
fi

set -x
aws s3 cp "${ORB_EVAL_FROM}" "${ORB_EVAL_TO}" --profile "${ORB_VAL_PROFILE_NAME}" "$@"
set +x