.PHONY: all

OUTPUT_DIR = public_html
PHR = vendor/farazdagi/phrozn/bin/phrozn.php

build: vendor
	mkdir -p $(OUTPUT_DIR) && php $(PHR) up . $(OUTPUT_DIR)

composer.phar:
	curl -s https://getcomposer.org/installer | php
	touch composer.phar

vendor: composer.phar
	php ./composer.phar install
	touch vendor

clean:
	rm composer.phar
	rm -rf vendor
	rm -rf $(OUTPUT_DIR)/*

pull:
	git pull

deploy: pull build
