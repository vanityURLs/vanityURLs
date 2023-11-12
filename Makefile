CCRED=\033[0;31m
CCEND=\033[0m

.PHONY: build help

help: ## Show this help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)


url: ## Generate a unique ID for a new URL
	npx nanoid --size 5

build: ## GIT add & commit the updated URLs redirection list AND push to github
	git add cfPages/.
	git commit -m "Updated URL list"
	git push

check-links: link-checker-setup run-link-checker ## Check links

link-checker-setup:
	curl https://htmltest.wjdp.uk | bash

run-link-checker:
	@echo "$(CCRED)**** The use of link-checked is deprecated. Use container-image instead. ****$(CCEND)"
	bin/htmltest
