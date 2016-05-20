# Original makefile @see https://gist.github.com/skarllot/13ebe8220822bc19494c8b076aabe9fc

PACKAGES = $(shell find ./ -maxdepth 1 -type d ! -path ".\/" ! -path ".\/\/.git" ! -path ".\/.git" ! -path ".\/\/sql" ! -path ".\/sql")

tests:
	$(foreach pkg,$(PACKAGES),\
		go test -coverprofile=coverage.out -covermode=count $(pkg);)

tests-cover-html:
	echo "mode: count" > coverage-all.out
	$(foreach pkg,$(PACKAGES),\
		go test -coverprofile=coverage.out -covermode=count $(pkg);\
		tail -n +2 coverage.out >> coverage-all.out;)
	go tool cover -html=coverage-all.out
