#!/bin/sh
set -x
ORB_EVAL_FROM=$(circleci env subst "${ORB_EVAL_FROM}")
ORB_EVAL_TO=$(circleci env subst "${ORB_EVAL_TO}")
ORB_EVAL_ARGUMENTS=$(echo "${ORB_EVAL_ARGUMENTS}" | circleci env subst)
ORB_EVAL_PROFILE_NAME=$(circleci env subst "${ORB_EVAL_PROFILE_NAME}")

if [ -n "${ORB_EVAL_ARGUMENTS}" ]; then
    IFS=' '
    set --
    for arg in ${ORB_EVAL_ARGUMENTS}; do
        set -- "$@" "${arg}"
    done
fi

aws s3 cp "${ORB_EVAL_FROM}" "${ORB_EVAL_TO}" --profile "${ORB_STR_PROFILE_NAME}" "$@"
set +x