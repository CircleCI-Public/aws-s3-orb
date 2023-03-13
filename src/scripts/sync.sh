#!/bin/sh
PARAM_AWS_S3_FROM=$(eval echo "${PARAM_AWS_S3_FROM}")
PARAM_AWS_S3_TO=$(eval echo "${PARAM_AWS_S3_TO}")
PARAM_AWS_S3_ARGUMENTS=$(eval echo "${PARAM_AWS_S3_ARGUMENTS}")

if [ -n "${PARAM_AWS_S3_ARGUMENTS}" ]; then
    set -- "$@" "${PARAM_AWS_S3_ARGUMENTS}"
fi

if [ -n "${PARAM_AWS_S3_PROFILE_NAME}" ]; then
    set -- "$@" --profile "${PARAM_AWS_S3_PROFILE_NAME}"
fi

set -x
aws s3 sync "${PARAM_AWS_S3_FROM}" "${PARAM_AWS_S3_TO}" "$@"
set +x