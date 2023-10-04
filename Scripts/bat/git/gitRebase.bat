@echo off
setlocal

set depth=%~1
if '%depth%'=='' (set depth=2)

git rebase -i HEAD~%depth%
