CC  = gcc
LD  = ${CC}

CFLAGS   = -Wall -static -O2
LDFLAGS  = ${CFLAGS}
LIBS = -ltomcrypt

SOURCES = gcgen.c
OBJECTS = $(addsuffix .o, $(basename ${SOURCES}))
TARGET_BIN = $(word 1, $(basename ${SOURCES}))

all: ${TARGET_BIN}

%.o: %.c
	${CC} -c ${CFLAGS} ${SYMBOLS} -o $@ $<

${TARGET_BIN}: ${OBJECTS}
	${LD} ${LDFLAGS} -o $@ $(OBJECTS) ${LIBS}

clean:
	rm -f *.o *~ *.out goldcard.img ${TARGET_BIN}
