#!/usr/bin/env bash
if jupyter nbconvert --to script $1; then
	echo 'Checking types with MyPy'
	if mypy `basename $1 .ipynb`.py; then
		echo 'No type errors found'
		rm `basename $1 .ipynb`.py
	fi
fi
