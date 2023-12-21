.PHONY: clean all

all: src/Main.elm
	elm make $< --output=deploy/Main.js

clean:
	@rm deploy/Main.js
