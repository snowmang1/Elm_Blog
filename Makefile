.PHONY: clean all

all: src/Main.elm
	elm make $< --output=Main.js

clean:
	@rm Main.js
