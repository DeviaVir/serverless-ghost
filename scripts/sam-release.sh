#!/usr/bin/env sh
set -ex

bucket=digilyfe-oss-public-files
prefix=serverless-ghost/${VERSION:-master}
output_file=template-packaged.yaml

sam package --profile digilyfe-chase --s3-bucket ${bucket} --region eu-west-3 --s3-prefix ${prefix} --output-template-file ${output_file}
aws s3 cp --profile digilyfe-chase ${output_file} s3://${bucket}/${prefix}/template.yaml
