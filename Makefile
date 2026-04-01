.PHONY: help clean

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -O2
SRCDIR = .
OBJDIR = obj
BINDIR = bin

# Create directories if they don't exist
$(OBJDIR):
	mkdir -p $(OBJDIR)

$(BINDIR):
	mkdir -p $(BINDIR)

# Build rule for any CPP file
%: %.cpp $(OBJDIR) $(BINDIR)
	$(CXX) $(CXXFLAGS) -o $(BINDIR)/$@ $<

# Help command
help:
	@echo "DSA Workspace Build Commands"
	@echo "============================="
	@echo "make FILE           - Compile FILE.cpp to FILE executable"
	@echo "                      Example: make arrays/basic"
	@echo "make clean          - Remove all compiled files and directories"
	@echo ""
	@echo "Example usage:"
	@echo "  make arrays/my_program    # Compiles arrays/my_program.cpp"
	@echo "  ./bin/my_program          # Run the compiled executable"

# Clean build artifacts
clean:
	rm -rf $(OBJDIR) $(BINDIR)

# Default target
.DEFAULT_GOAL := help
