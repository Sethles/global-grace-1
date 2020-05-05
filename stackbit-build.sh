#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5eb0cb87090320001bd41bc5/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5eb0cb87090320001bd41bc5
curl -s -X POST https://api.stackbit.com/project/5eb0cb87090320001bd41bc5/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5eb0cb87090320001bd41bc5/webhook/build/publish > /dev/null
