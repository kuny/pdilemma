#--------------------------------------------------
# Project:
# Purpose:
#--------------------------------------------------

.PHONY: run test

run:
	@chez --libdirs /Users/kuny/scheme/libs:src:. --script src/main.ss

test:
	@chez --libdirs /Users/kuny/scheme/libs:src:. --script test/test.ss

