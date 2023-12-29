.PHONY: clean all

all: src/Main.elm
	elm make $< --output=deploy/Main.js

deploy: src/Main.elm
	elm make $< --optimize --output=deploy/Main.js

clean:
	@rm deploy/Main.js
