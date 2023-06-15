#!/bin/bash
ORB_EVAL_FROM=$(circleci env subst "${ORB_EVAL_FROM}")
ORB_EVAL_TO=$(circleci env subst "${ORB_EVAL_TO}")
ORB_EVAL_ARGUMENTS=$(echo "${ORB_EVAL_ARGUMENTS}" | circleci env subst)
ORB_EVAL_ARGUMENTS=${ORB_EVAL_ARGUMENTS//\'/}
ORB_EVAL_PROFILE_NAME=$(circleci env subst "${ORB_EVAL_PROFILE_NAME}")



# if [ -n "${ORB_EVAL_ARGUMENTS}" ]; then
#     aws s3 sync "${ORB_EVAL_FROM}" "${ORB_EVAL_TO}" --profile "${ORB_EVAL_PROFILE_NAME}" "${ORB_EVAL_ARGUMENTS}"
#     # set -- "$@" "${ORB_EVAL_ARGUMENTS}"
#     else
#     aws s3 sync "${ORB_EVAL_FROM}" "${ORB_EVAL_TO}" --profile "${ORB_EVAL_PROFILE_NAME}"
# fi

# set -x
# aws s3 cp "${ORB_EVAL_FROM}" "${ORB_EVAL_TO}" --profile "${ORB_EVAL_PROFILE_NAME}" "$@"


aws s3 sync "${ORB_EVAL_FROM}" "${ORB_EVAL_TO}" --profile "${ORB_EVAL_PROFILE_NAME}" "${ORB_EVAL_ARGUMENTS:+$ORB_EVAL_ARGUMENTS}"
set +x