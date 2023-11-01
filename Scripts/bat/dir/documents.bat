@echo off
setlocal

set loc=%MyDocuments%

if '%loc%'=='' (
	explorer shell:documents
) else (
	explorer %loc%
)
