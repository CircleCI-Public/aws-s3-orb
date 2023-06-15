#!/bin/sh
set -x
ORB_EVAL_FROM=$(circleci env subst "${ORB_EVAL_FROM}")
ORB_EVAL_TO=$(circleci env subst "${ORB_EVAL_TO}")
ORB_EVAL_ARGUMENTS=$(echo "${ORB_EVAL_ARGUMENTS}" | circleci env subst)
echo "${ORB_EVAL_ARGUMENTS}" | sed "s/'//g"
ORB_EVAL_PROFILE_NAME=$(circleci env subst "${ORB_EVAL_PROFILE_NAME}")

# if [ -n "${ORB_EVAL_ARGUMENTS}" ]; then
#     IFS=' '
#     set -- "${ORB_EVAL_ARGUMENTS}"
#     for arg do
#         set -- "$@" "${arg}"
#     done
# fi

ORB_EVAL_ARGUMENTS=$(echo "$ORB_EVAL_ARGUMENTS" | circleci env subst)
if [ -n "$ORB_EVAL_ARGUMENTS" ]; then
    printf '%s\n' "$ORB_EVAL_ARGUMENTS" | while IFS= read -r arg; do
        ARGUMENTS="$ARGUMENTS $arg"
    done
fi

echo "${ARGUMENTS}"
aws s3 sync "${ORB_EVAL_FROM}" "${ORB_EVAL_TO}" --profile "${ORB_EVAL_PROFILE_NAME}" "$@"
set +x