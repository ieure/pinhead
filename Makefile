PINOUTS := $(wildcard pinouts/*.json)

lint: $(PINOUTS:%=%.lint)

%.lint:
	python -mjson.tool $* > /dev/null
