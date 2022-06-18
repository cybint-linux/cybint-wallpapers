.PHONY: help install test distclean clean pkg

# Put it first so that "make" without argument is like "make help".
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

install: ## Create symlinks dependencies
	scripts/symlinks.sh
	scripts/kde-wallpapers.sh

# test: ## Test for common errors
# 	@./scripts/test.py
	
clean: distclean ## Remove build files
	@rm -rf '*' wallpaper/wallpapers wallpaper/backgrounds/cybint-*

pkg: ## Build debian package 
	@debuild -us -uc
