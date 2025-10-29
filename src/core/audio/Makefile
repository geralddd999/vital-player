# Compiler to use
CXX = g++

# $(shell ...): Runs 'sdl2-config --cflags' to get SDL2's include paths
CXXFLAGS = -std=c++17 -Wall -g $(shell sdl2-config --cflags)

# Linker flags
# $(shell ...): Runs 'sdl2-config --libs' to get all the SDL2 libraries
# -lav...: Links all the required FFmpeg libraries
LDFLAGS = $(shell sdl2-config --libs) -lavformat -lavcodec -lswresample -lavutil

# The final executable name
TARGET = MyPlayer

# All the C++ source files
SOURCES = main.cpp AudioPlayer.cpp AudioDecoder.cpp

# All the C++ header files
HEADERS = AudioPlayer.h AudioDecoder.h AudioFrame.h

# Object files are automatically generated from the source files
# (e.g., main.cpp -> main.o)
OBJECTS = $(SOURCES:.cpp=.o)

# --- Build Rules ---

# The default rule, called when you just type 'make'
# It depends on the final executable
.PHONY: all
all: $(TARGET)

# Rule to link the final executable
# It depends on all the object files
$(TARGET): $(OBJECTS)
	@echo "Linking $(TARGET)..."
	$(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS)
	@echo "$(TARGET) built successfully!"

# Rule to compile a .cpp file into a .o (object) file
# $< is the source file (e.g., main.cpp)
# $@ is the target file (e.g., main.o)
# This rule also depends on $(HEADERS), so if you change any header file,
# all source files will be recompiled.
%.o: %.cpp $(HEADERS)
	@echo "Compiling $<..."
	$(CXX) $(CXXFLAGS) -c $< -o $@

#erase all the files
.PHONY: clean
clean:
	@echo "Cleaning up..."
	rm -f $(TARGET) $(OBJECTS)
