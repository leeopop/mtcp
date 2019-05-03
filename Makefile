MTCP_SRCS = $(wildcard mtcp/*.c)
UTIL_SRCS = $(wildcard util/*.c)

MTCP_OBJS = $(patsubst %.c,%.o,$(MTCP_SRCS))
UTIL_OBJS = $(patsubst %.c,%.o,$(UTIL_SRCS))

HEADERS = include mtcp/include

### GOALS ###
all: lib/libmtcp.a

lib/libmtcp.a: $(MTCP_OBJS) $(UTIL_OBJS)
	ar rvs lib/libmtcp.a $(MTCP_OBJS) $(UTIL_OBJS)

$(UTIL_OBJS):
	$(MAKE) -C util

$(MTCP_OBJS):
	$(MAKE) -C mtcp

clean:
	rm lib/*.a
	$(MAKE) -C mtcp clean
	$(MAKE) -C util clean