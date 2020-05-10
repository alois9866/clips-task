.PHONY: all try run start

all: run

try:
	clips -f2 main.clp

run:
	clips -f2 main.clp -f2 run.clp -f2 exit.clp

start:
	clips -f2 main.clp -f2 run.clp
