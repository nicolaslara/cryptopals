#!/usr/bin/env bash
if jupyter nbconvert --to script $1; then
	echo 'Checking types with MyPy'
	if mypy `basename $1 .ipynb`.py; then
		echo 'No type errors found'
	fi
	rm `basename $1 .ipynb`.py
fi
