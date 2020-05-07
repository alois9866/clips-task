.PHONY: all run start

all: run

run:
	clips -f2 rules.clp -f2 exit.clp

start:
	clips -f2 rules.clp
