# HexCalc

```
╔═══════════════════════════════════════════════════════════╗
║                                                           ║
║    ██╗  ██╗███████╗██╗  ██╗ ██████╗ █████╗ ██╗      ██╗ ║
║    ██║  ██║██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██║     ██╔╝ ║
║    ███████║█████╗   ╚███╔╝ ██║     ███████║██║    ██╔╝  ║
║    ██╔══██║██╔══╝   ██╔██╗ ██║     ██╔══██║██║   ██╔╝   ║
║    ██║  ██║███████╗██╔╝ ██╗╚██████╗██║  ██║███████╔╝    ║
║    ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝     ║
║                      HEXCALC                              ║
║                                                           ║
║         Professional Hexadecimal Calculator CLI          ║
║         Author: Izai Alejandro Zalles Merino             ║
║                     Version 1.0.0                        ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
```

A powerful, professional command-line tool for performing hexadecimal arithmetic and bitwise operations with support for multiple operands and various output formats.

[![GitHub release](https://img.shields.io/github/v/release/ialejandrozalles/HexCalc)](https://github.com/ialejandrozalles/HexCalc/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python](https://img.shields.io/badge/python-3.6+-blue.svg)](https://www.python.org/downloads/)

## 🌟 Features

### Arithmetic Operations
- **Addition** (`-a`, `--add`) - Add multiple hexadecimal values
- **Subtraction** (`-s`, `--subtract`) - Subtract values sequentially
- **Multiplication** (`-m`, `--multiply`) - Multiply multiple values
- **Division** (`-d`, `--divide`) - Integer division
- **Float Division** (`-fd`, `--floatDivide`) - Floating-point division
- **Modulo** (`-mod`, `--modulo`) - Modulo operation
- **Power** (`-p`, `--power`) - Exponentiation

### Bitwise Operations
- **AND** (`-and`, `--bitwiseAnd`) - Bitwise AND operation
- **OR** (`-or`, `--bitwiseOr`) - Bitwise OR operation
- **XOR** (`-xor`, `--bitwiseXor`) - Bitwise XOR operation
- **NOT** (`-not`, `--bitwiseNot`) - Bitwise NOT with configurable bit width
- **Left Shift** (`-ls`, `--leftShift`) - Shift bits to the left
- **Right Shift** (`-rs`, `--rightShift`) - Shift bits to the right

### Output Formats
- **Hexadecimal** (`hex`) - Default format (0x...)
- **Decimal** (`dec`) - Base 10 output
- **Binary** (`bin`) - Binary representation (0b...)
- **Octal** (`oct`) - Octal representation (0o...)
- **All** (`all`) - Display all formats simultaneously

### Additional Features
- ✅ Support for multiple operands (not limited to 2)
- ✅ Flexible input formats (0x, 0X, or plain hex)
- ✅ Verbose mode for detailed operation information
- ✅ Comprehensive error handling
- ✅ Professional CLI interface
- ✅ Cross-platform compatibility (Linux, macOS, BSD)

## 📦 Installation

### Quick Install (Recommended)

#### Option 1: Download Pre-built Debian Package
```bash
# Download the latest .deb package
wget https://github.com/ialejandrozalles/HexCalc/releases/download/v1.0.0/hexcalc_1.0.0-1_all.deb

# Install the package
sudo dpkg -i hexcalc_1.0.0-1_all.deb

# Verify installation
hexcalc --version
```

#### Option 2: Install from Source
```bash
# Clone the repository
git clone https://github.com/ialejandrozalles/HexCalc.git
cd HexCalc

# Install system-wide
sudo cp hexcalc.py /usr/bin/hexcalc
sudo chmod +x /usr/bin/hexcalc

# Verify installation
hexcalc --version
```

#### Option 3: Download Single File
```bash
# Download hexcalc.py directly
wget https://raw.githubusercontent.com/ialejandrozalles/HexCalc/main/hexcalc.py

# Install system-wide
sudo cp hexcalc.py /usr/bin/hexcalc
sudo chmod +x /usr/bin/hexcalc
```

### Prerequisites
- Python 3.6 or higher
- Linux/Unix-based operating system

### User-local Installation (No sudo required)
```bash
# Clone repository
git clone https://github.com/ialejandrozalles/HexCalc.git
cd HexCalc

# Install to local bin
mkdir -p ~/.local/bin
cp hexcalc.py ~/.local/bin/hexcalc
chmod +x ~/.local/bin/hexcalc

# Add to PATH if not already present
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## 🚀 Usage

### Basic Syntax
```bash
hexcalc [operation] [operands] [options]
```

### Quick Start Examples

#### Arithmetic Operations

```bash
# Addition with multiple operands
hexcalc -a 0x100 0xFF 0x50
# Result: 0x24f

# Subtraction (sequential)
hexcalc -s 0x5bbcfd38e33d 0x96
# Result: 0x5bbcfd38e2a7

# Multiplication
hexcalc -m 0x10 0x10 0x2
# Result: 0x200

# Division (integer)
hexcalc -d 0x1000 0x10
# Result: 0x100

# Float division
hexcalc -fd 0x64 0xA
# Result: 10.0

# Modulo operation
hexcalc -mod 0xFF 0x10
# Result: 0xf

# Power operation
hexcalc -p 0x2 0x8
# Result: 0x100 (2^8 = 256)
```

#### Bitwise Operations

```bash
# Bitwise AND
hexcalc -and 0xFF 0x0F
# Result: 0xf

# Bitwise OR
hexcalc -or 0x0F 0xF0
# Result: 0xff

# Bitwise XOR
hexcalc -xor 0xFF 0x0F
# Result: 0xf0

# Bitwise NOT (8 bits)
hexcalc -not 0x0F -bits 8
# Result: 0xf0

# Left shift
hexcalc -ls 0xFF 8
# Result: 0xff00

# Right shift
hexcalc -rs 0xFF00 8
# Result: 0xff
```

#### Output Formats

```bash
# Hexadecimal output (default)
hexcalc -a 0x10 0x20
# Result: 0x30

# Decimal output
hexcalc -a 0x10 0x20 -f dec
# Result: 48

# Binary output
hexcalc -a 0x10 0x20 -f bin
# Result: 0b110000

# Octal output
hexcalc -a 0x10 0x20 -f oct
# Result: 0o60

# All formats at once
hexcalc -a 0x10 0x20 -f all
# Result:
# Hex: 0x30
# Dec: 48
# Bin: 0b110000
# Oct: 0o60
```

#### Verbose Mode

```bash
# Get detailed operation information
hexcalc -s 0x1000 0x100 -v
# Output:
# [*] Operation: Subtraction: 0x1000 - 0x100
# [*] Output Format: hex
# 
# Result: 0xf00
```

## 📖 Command-Line Options

### Operation Flags

| Flag | Long Form | Description | Min Operands |
|------|-----------|-------------|--------------|
| `-a` | `--add` | Addition | 1+ |
| `-s` | `--subtract` | Subtraction | 2+ |
| `-m` | `--multiply` | Multiplication | 1+ |
| `-d` | `--divide` | Integer division | 2+ |
| `-fd` | `--floatDivide` | Float division | 2+ |
| `-mod` | `--modulo` | Modulo operation | 2 |
| `-p` | `--power` | Exponentiation | 2 |
| `-and` | `--bitwiseAnd` | Bitwise AND | 2+ |
| `-or` | `--bitwiseOr` | Bitwise OR | 2+ |
| `-xor` | `--bitwiseXor` | Bitwise XOR | 2+ |
| `-not` | `--bitwiseNot` | Bitwise NOT | 1 |
| `-ls` | `--leftShift` | Left shift | 2 |
| `-rs` | `--rightShift` | Right shift | 2 |

### General Options

| Flag | Long Form | Description |
|------|-----------|-------------|
| `-f` | `--format` | Output format: `hex`, `dec`, `bin`, `oct`, `all` (default: hex) |
| `-v` | `--verbose` | Show detailed operation information |
| `-bits` | `--bitWidth` | Bit width for NOT operation (default: 64) |
| `-h` | `--help` | Show help message |
| | `--version` | Show version information |

## 🔧 Advanced Usage

### Working with Large Numbers

```bash
# Large hexadecimal calculations
hexcalc -a 0xFFFFFFFFFFFFFFFF 0x1
# Result: 0x10000000000000000

# Multiple large number operations
hexcalc -m 0x100000000 0x100000000
# Result: 0x10000000000000000
```

### Chain Operations (using output)

```bash
# Store result in variable for further operations
RESULT=$(hexcalc -a 0x100 0xFF | grep -oP '0x[0-9a-f]+')
hexcalc -m $RESULT 0x2
```

### Input Format Flexibility

```bash
# All these are equivalent
hexcalc -a 0xFF 0xFF     # Standard format
hexcalc -a 0XFF 0XFF     # Uppercase X
hexcalc -a FF FF         # Without prefix (auto-detected as hex)
```

### Complex Bitwise Operations

```bash
# Combine multiple bitwise operations
hexcalc -and 0xFFFF 0xFF00 0xF0F0 0xAAAA
# Result: 0xa000

# Create bit masks
hexcalc -ls 0x1 16
# Result: 0x10000 (useful for creating masks)
```

## 🧪 Testing

A comprehensive test suite is included to verify all operations:

```bash
# Download and run test suite
wget https://raw.githubusercontent.com/ialejandrozalles/HexCalc/main/test_hexcalc.sh
chmod +x test_hexcalc.sh
./test_hexcalc.sh
```

The test suite includes:
- Tests for 2, 3, 4, and 5+ operands
- All arithmetic operations
- All bitwise operations
- All output formats
- Verbose mode
- Mixed input formats

## 🎯 Use Cases

### Penetration Testing
```bash
# Calculate memory offsets
hexcalc -s 0x7fffffff 0x1000

# Create buffer overflow payloads
hexcalc -a 0x41414141 0x42424242
```

### Reverse Engineering
```bash
# Calculate addresses
hexcalc -a 0x400000 0x1234

# XOR decode operations
hexcalc -xor 0x5A 0x3C
```

### Network Engineering
```bash
# Subnet calculations
hexcalc -and 0xC0A80164 0xFFFFFF00
```

### General Development
```bash
# Quick hex conversions
hexcalc -a 0x0 -f all

# Bit manipulation
hexcalc -or 0x01 0x02 0x04 0x08
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Development Guidelines
- Follow PEP 8 style guidelines
- Use camelCase for variable names
- Add tests for new features
- Update documentation accordingly

### Building Debian Package

```bash
# Clone the repository
git clone https://github.com/ialejandrozalles/HexCalc.git
cd HexCalc

# Build the package
dpkg-buildpackage -us -uc -b

# The .deb file will be created in the parent directory
```

## 📝 License

MIT License

Copyright (c) 2024-2025 Izai Alejandro Zalles Merino

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## 👤 Author

**Izai Alejandro Zalles Merino**

- GitHub: [@ialejandrozalles](https://github.com/ialejandrozalles)
- Repository: [HexCalc](https://github.com/ialejandrozalles/HexCalc)

## 📞 Support

If you encounter any issues or have questions:
1. Check the help message: `hexcalc -h`
2. Review the examples above
3. [Open an issue](https://github.com/ialejandrozalles/HexCalc/issues) on GitHub

## ⭐ Show Your Support

If you find HexCalc useful, please consider giving it a star on GitHub!

## 📊 Roadmap

- [ ] Interactive mode
- [ ] History of calculations
- [ ] Save/load calculation sessions
- [ ] Custom base conversions (base 2-36)
- [ ] Scripting support
- [ ] Configuration file support
- [ ] Package for other distributions (Arch, Fedora, etc.)

## ⚡ Performance

HexCalc is optimized for speed and can handle:
- ✅ Arbitrarily large numbers (limited only by Python's integer implementation)
- ✅ Multiple operands without performance degradation
- ✅ Complex nested operations
- ✅ Batch processing via shell scripts

## 🔗 Links

- [GitHub Repository](https://github.com/ialejandrozalles/HexCalc)
- [Latest Release](https://github.com/ialejandrozalles/HexCalc/releases/latest)
- [Issue Tracker](https://github.com/ialejandrozalles/HexCalc/issues)
- [Download .deb Package](https://github.com/ialejandrozalles/HexCalc/releases/download/v1.0.0/hexcalc_1.0.0-1_all.deb)

---

**Made with ❤️ by Izai Alejandro Zalles Merino**

*HexCalc - Making hexadecimal calculations simple and powerful*
