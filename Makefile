.PHONY: init_doc venv_rtd

init_doc: venv_rtd

venv_rtd:
	$(call func_venv,readthedocs)

# FUNCTIONS
define func_venv
	if [ -f ./venv/$1 ]; then \
		virtualenv -p python3 ./venv/$1; \
	fi;

	(source ./venv/$1/bin/activate; \
	pip3 install -r ./requirements/$1.txt;)
	echo '#!/bin/bash\necho ./venv/$1/bin/activate' > source.sh
	chmod +x source.sh
	@clear
	@echo "To Activate:"
	@echo '	source $$(./source.sh)'
endef