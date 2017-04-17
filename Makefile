CC=emcc
SOURCES:=async_wget_error.cpp
LDFLAGS=-O2 --llvm-opts 2
OUTPUT=async_wget_error.html
EMCC_DEBUG=0

all: $(SOURCES) $(OUTPUT)

$(OUTPUT): $(SOURCES) 
	$(CC) $(SOURCES) -s FORCE_FILESYSTEM=1 -s NO_EXIT_RUNTIME=1 -s DEMANGLE_SUPPORT=1 -s ASSERTIONS=1 --memory-init-file 0 $(LDFLAGS) -o $(OUTPUT)

clean:
	rm $(OUTPUT)
