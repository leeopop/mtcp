### GCC ###
CFLAGS += -march=native
CFLAGS += -Wall -fPIC -fgnu89-inline -Werror
CFLAGS += -DNDEBUG -g -O3 -DNETSTAT -DINFO -DDBGERR -DDBGCERR

### LIBRARIES AND INCLUDES ###
CFLAGS += -I../include/mtcp/util
CFLAGS += -I../include/mtcp

### SOURCE CODE ###
SRCS = $(wildcard *.c)

OBJS = $(patsubst %.c,%.o,$(SRCS))
DEPS = $(patsubst %.c,.%.d,$(SRCS))

### COMPILE ###
all: $(OBJS)

$(OBJS): %.o: %.c Makefile
$(DEPS): .%.d: %.c Makefile

-include $(DEPS)

clean:
	rm -rf *~ *.o
