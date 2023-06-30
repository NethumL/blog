#!/usr/bin/env bash

echo "Preparing"
mkdir -p content-org/images/generated

echo "Exporting to MD"
(
    cd content-org || exit
    emacs --batch --no-init-file --load ../publish.el --funcall npl-publish-all
)
