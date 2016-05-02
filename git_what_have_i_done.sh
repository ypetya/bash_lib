#!/bin/bash

function git_what_have_i_done() {
  git log --pretty=format:"%ad;%aE;%s" --branches | grep $USER | cut --delimiter=";" -f1,3 | head
}
