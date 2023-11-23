CLIENTNAME	:= client

SERVERNAME	:= server

CFLAGS	:= -Wextra -Wall -Werror

HEADERS	:= -I ./include

LIB := ./lib/libftprintf.a

CLIENTDIR := ./client_dir/

SERVERDIR := ./server_dir/

CLIENTSRCS	:=  $(CLIENTDIR)main.c

SERVERSRCS	:=  $(SERVERDIR)main.c

CLIENTOBJS	:= ${CLIENTSRCS:.c=.o}

SERVEROBJS	:= ${SERVERSRCS:.c=.o}

CC		:= cc

all: $(CLIENTNAME) $(SERVERNAME)

lib:
	make -C ./lib

%.o: %.c
	@$(CC) $(CFLAGS) -o $@ -c $< $(HEADERS)

$(CLIENTNAME): $(CLIENTOBJS) lib
	@$(CC) $(CLIENTOBJS) $(LIB) $(HEADERS) -o $(CLIENTNAME)

$(SERVERNAME): $(SERVEROBJS) lib
	@$(CC) $(SERVEROBJS) $(LIB) $(HEADERS) -o $(SERVERNAME)

clean:
	make -C ./lib clean
	rm -rf $(CLIENTOBJS) $(SERVEROBJS)

fclean: clean
	make -C ./lib fclean
	rm -rf $(CLIENTNAME) $(SERVERNAME)

re: clean all

.PHONY: all, clean, fclean, re, lib