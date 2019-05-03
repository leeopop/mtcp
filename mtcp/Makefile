ifeq ($(RTE_SDK),)
$(error "Please define RTE_SDK environment variable")
endif
ifeq ($(RTE_TARGET),)
$(error "Please define RTE_TARGET environment variable")
endif

CFLAGS = -I$(RTE_SDK)/$(RTE_TARGET)/include
LDFLAGS = -L$(RTE_SDK)/$(RTE_TARGET)/lib


include $(RTE_SDK)/mk/rte.vars.mk

CFLAGS += -march=native
CFLAGS += -Wall -fPIC -fgnu89-inline -Werror
CFLAGS += -DNDEBUG -g -O3 -DNETSTAT -DINFO -DDBGERR -DDBGCERR

CFLAGS += -I./include
CFLAGS += -I../include/mtcp
CFLAGS += -I../include/mtcp/internal
CFLAGS += -I../include/mtcp/util

### SOURCE CODE ###
SRCS = $(wildcard *.c)

OBJS = $(patsubst %.c,%.o,$(SRCS))
DEPS = $(patsubst %.c,.%.d,$(SRCS))

### GOALS ###
all: $(OBJS)

$(OBJS): %.o: %.c Makefile
$(DEPS): .%.d: %.c Makefile

-include $(DEPS)

clean:
	rm -f *.o *~ core
	rm -f .*.d
