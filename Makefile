UNAME := $(shell uname)
ifeq ($(UNAME), Linux) # Linux
LEAK_CHECK := valgrind --leak-check=full --error-exitcode=1
endif
ifeq ($(UNAME), Darwin) # Mac OS
LEAK_CHECK := leaks -atExit --
endif

.PHONY: all
all:
	@for dir in $(wildcard ex*); do \
		make re -C $$dir; \
		$(LEAK_CHECK) ./$$dir/a.out; \
		if [ $$? -ne 0 ]; then \
			echo "Memory leak detected in $$dir"; \
			exit 1; \
		fi; \
	done

