#!/bin/sh

set -ex  # stop at errors

# User groups configuration

usermod -aG sudo andre
usermod -aG docker andre
