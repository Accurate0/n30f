CC       ?= gcc
PREFIX   ?= /usr
TARGET    = n30f
BINPREFIX = $(PREFIX)/bin
OBJ       = n30f.o cairo_jpg.o
LDLIBS   += -lcairo -lxcb -lxcb-render -ljpeg

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^ $(LDLIBS)

n30f.o: n30f.c
	$(CC) -o $@ -c $(CFLAGS) $(LDFLAGS) $^

cairo_jpg.o: cairo_jpg/src/cairo_jpg.c
	$(CC) -o $@ -c $(CFLAGS) $(LDFLAGS) $^

install: $(TARGET)
	mkdir -p "$(DESTDIR)$(BINPREFIX)"
	install -m 755 n30f "$(DESTDIR)$(BINPREFIX)"

clean:
	rm -f $(TARGET) $(OBJ)
