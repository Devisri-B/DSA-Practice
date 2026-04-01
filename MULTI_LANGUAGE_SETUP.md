# Development Setup Guide for DSA: Python and C++ in VS Code

This guide shows you how to use VS Code with Python and C++.

## Conda Environment + VS Code 

### Why?

- All Python dependencies in one isolated environment
- VS Code as single IDE for both Python and C++
- Easy to share and reproduce
- Professional development workflow
- Works reliably on all platforms including Apple Silicon
- Best balance of simplicity and features

### Setup Steps:

#### Step 1: Install Conda (if not already done)

```bash
# Install Miniconda (lightweight, recommended)
brew install miniconda

# Close and reopen your terminal to activate conda
```

#### Step 2: Initialize Conda for Your Shell

```bash
# For zsh shell (macOS default)
conda init zsh

# Close and reopen your terminal for changes to take effect
```

After reopening terminal, your shell should show `(base)` prefix.

#### Step 3: Create DSA Environment

```bash
# Create environment with Python (no Jupyter needed)
conda create -n dsa python=3.13 -y

# Activate the environment
conda activate dsa

# Verify activation (should show (dsa) prefix)
python --version
```

#### Step 4: Install Python Packages for DSA

```bash
# Make sure dsa environment is active
conda activate dsa
```

#### Step 5: Open VS Code

```bash
# Make sure dsa environment is active
conda activate dsa

# Open VS Code with activated conda environment
code .
```

# Remove environment (if needed)
conda remove -n dsa --all
```

---

## VS Code Extensions Required

### Essential Extensions:

1. **Python** (Microsoft) - REQUIRED
   - Python syntax highlighting and debugging
   - Run Python files directly in VS Code
   - Install: `ms-python.python`

2. **C++ Intellisense** (Microsoft) - REQUIRED
   - Code completion for C++ files
   - Install: `ms-vscode.cpptools`

3. **Code Runner** (Optional but helpful)
   - Run code with Ctrl+Alt+N
   - Install: `formulahendry.code-runner`

### Install Extensions in VS Code:

```bash
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension formulahendry.code-runner
```

---

## C++ Build Tools: Makefile and tasks.json

This workspace includes build tools to make C++ development easier and faster.

### Makefile - Command-Line C++ Compilation

**What it does:**
- Simplifies C++ compilation with easy-to-remember commands
- Automatically handles compiler flags and output directories
- Prevents typing long g++ commands repeatedly

**Location:** `Makefile`

**How to use:**

```bash
# Compile a C++ file
make arrays/bubble_sort

# This compiles: arrays/bubble_sort.cpp
# Outputs to: bin/bubble_sort (executable)

# Run the compiled program
./bin/bubble_sort

# Clean up compiled files
make clean
```

**Why use it:**

Without Makefile, you'd type:
```bash
g++ -std=c++17 -Wall -Wextra -O2 arrays/bubble_sort.cpp -o bin/bubble_sort
```

With Makefile, you just type:
```bash
make arrays/bubble_sort
```

**Available Makefile Commands:**

```bash
make help                    # Show help
make arrays/filename         # Compile arrays/filename.cpp
make binary_search/filename  # Compile binary_search/filename.cpp
make clean                   # Remove all bin/ and obj/ directories
```

---

### tasks.json - VS Code Integration

**What it does:**
- Integrates C++ compilation directly into VS Code
- Compile your code with a keyboard shortcut: `Cmd+Shift+B`
- See output in VS Code terminal immediately
- No need to switch to command line

**Location:** `.vscode/tasks.json`

**How to use:**

1. **Open a C++ file in VS Code**
   - E.g., `arrays/binary_search.cpp`

2. **Press `Cmd+Shift+B` (Mac) or `Ctrl+Shift+B` (Windows/Linux)**

3. **Select task from dropdown:**
   - `Build C++ (Active File)` - Just compile
   - `Run C++ (Active File)` - Compile and run immediately
   - `Clean Build Artifacts` - Remove bin/ and obj/

4. **See results in Terminal panel below**

**Example Workflow:**

1. Edit `arrays/sorting.cpp` in VS Code
2. Press `Cmd+Shift+B`
3. Select "Run C++ (Active File)"
4. Output appears in terminal below
5. Program runs and shows results
6. Fix code if needed, repeat

**Available VS Code Tasks:**

```
Build C++ (Active File)      - Compiles currently open .cpp file
Run C++ (Active File)        - Compiles and runs currently open .cpp file
Python: Run (Active File)    - Runs Python scripts
Clean Build Artifacts       - Removes compiled files
```

---

## Recommended Workflow (Option 3)

### File Structure:

```
.
├── .vscode/
│   ├── tasks.json          # Build tasks (pre-configured)
├── Makefile                # Build configuration
├── MULTI_LANGUAGE_SETUP.md
└── ...
```
---

## Running Python Files in VS Code

### Method 1: Use Python Extension (Built-in)

```bash
# Activate conda environment first
conda activate dsa

# Open file in VS Code
code arrays/sorting.py

# Right-click on editor → Run Python File in Terminal
```

### Method 2: Use Code Runner Extension

```bash
# After installing Code Runner extension
# Open any .py file
# Press Ctrl+Alt+N to run
# Output appears in terminal
```

### Method 3: Use Terminal

```bash
# Terminal is already in your conda environment
# Just run:
python arrays/sorting.py
```

---

## Running C++ Files in VS Code

### Method 1: Use tasks.json (Recommended)

1. Open `.cpp` file in VS Code
2. Press `Cmd+Shift+B` (Mac) or `Ctrl+Shift+B`
3. Select "Run C++ (Active File)"
4. Output appears in terminal

### Method 2: Use Makefile

1. Open Terminal in VS Code (Ctrl+`)
2. Type: `make arrays/filename`
3. Type: `./bin/filename`
4. Program runs

### Method 3: Direct Compilation

```bash
# In VS Code terminal
g++ -std=c++17 -o bin/myprogram arrays/myprogram.cpp
./bin/myprogram
```
