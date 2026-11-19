#!/bin/sh
#MISE description="This repository's own checks"
#MISE depends=[]
# check:repo depends on this task, so it stays a file.
# A repository lists its own checks in depends.
# Each check is a task that runs one tool, and the dependencies run in parallel.
# This file is a starter: the template writes it once and never rewrites it.
