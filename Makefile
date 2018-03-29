all:: emacs

print-%: ; @echo $*=$($*)

emacs::
	@ln -fns $(PWD) ${HOME}/.emacs.d
	@echo Emacs has been setup.

