#!/usr/bin/env bash

echo "Running build script"
mkdir -p content-org/images/generated
emacs --batch --no-init-file --load publish.el content-org/all-posts.org --funcall npl-publish-all
