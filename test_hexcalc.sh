#!/bin/bash
# HexCalc Test Suite
# Author: Izai Alejandro Zalles Merino
# Comprehensive testing script for all HexCalc operations

echo "╔════════════════════════════════════════════════════════════╗"
echo "║          HEXCALC COMPREHENSIVE TEST SUITE                  ║"
echo "║     Testing all operations with 2 and 3+ operands          ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

HEXCALC="./hexcalc.py"
PASS=0
FAIL=0

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Test function
run_test() {
    local test_name="$1"
    local command="$2"
    local expected="$3"
    
    echo -e "${YELLOW}[TEST]${NC} $test_name"
    echo "Command: $command"
    
    result=$(eval "$command" 2>&1)
    
    if echo "$result" | grep -q "$expected"; then
        echo -e "${GREEN}[PASS]${NC} Expected: $expected | Got: $result"
        ((PASS++))
    else
        echo -e "${RED}[FAIL]${NC} Expected: $expected | Got: $result"
        ((FAIL++))
    fi
    echo ""
}

echo "════════════════════════════════════════════════════════════"
echo "1. ARITHMETIC OPERATIONS - ADDITION"
echo "════════════════════════════════════════════════════════════"

run_test "Addition with 2 operands" \
    "$HEXCALC -a 0x100 0xFF" \
    "0x1ff"

run_test "Addition with 3 operands" \
    "$HEXCALC -a 0x100 0xFF 0x50" \
    "0x24f"

run_test "Addition with 4 operands" \
    "$HEXCALC -a 0x10 0x20 0x30 0x40" \
    "0xa0"

run_test "Addition with 5 operands" \
    "$HEXCALC -a 0x1 0x2 0x3 0x4 0x5" \
    "0xf"

echo "════════════════════════════════════════════════════════════"
echo "2. ARITHMETIC OPERATIONS - SUBTRACTION"
echo "════════════════════════════════════════════════════════════"

run_test "Subtraction with 2 operands (original example)" \
    "$HEXCALC -s 0x5bbcfd38e33d 0x96" \
    "0x5bbcfd38e2a7"

run_test "Subtraction with 2 operands (simple)" \
    "$HEXCALC -s 0x1000 0x100" \
    "0xf00"

run_test "Subtraction with 3 operands" \
    "$HEXCALC -s 0x1000 0x100 0x50" \
    "0xeb0"

run_test "Subtraction with 4 operands" \
    "$HEXCALC -s 0xFFFF 0x1000 0x100 0x10" \
    "0xeeef"

echo "════════════════════════════════════════════════════════════"
echo "3. ARITHMETIC OPERATIONS - MULTIPLICATION"
echo "════════════════════════════════════════════════════════════"

run_test "Multiplication with 2 operands" \
    "$HEXCALC -m 0x10 0x10" \
    "0x100"

run_test "Multiplication with 3 operands" \
    "$HEXCALC -m 0x10 0x10 0x2" \
    "0x200"

run_test "Multiplication with 4 operands" \
    "$HEXCALC -m 0x2 0x3 0x4 0x5" \
    "0x78"

run_test "Multiplication with 5 operands" \
    "$HEXCALC -m 0x2 0x2 0x2 0x2 0x2" \
    "0x20"

echo "════════════════════════════════════════════════════════════"
echo "4. ARITHMETIC OPERATIONS - DIVISION (INTEGER)"
echo "════════════════════════════════════════════════════════════"

run_test "Division with 2 operands" \
    "$HEXCALC -d 0x1000 0x10" \
    "0x100"

run_test "Division with 3 operands" \
    "$HEXCALC -d 0x1000 0x10 0x2" \
    "0x80"

run_test "Division with 4 operands" \
    "$HEXCALC -d 0x10000 0x10 0x10 0x10" \
    "0x10"

echo "════════════════════════════════════════════════════════════"
echo "5. ARITHMETIC OPERATIONS - DIVISION (FLOAT)"
echo "════════════════════════════════════════════════════════════"

run_test "Float division with 2 operands" \
    "$HEXCALC -fd 0x64 0xA" \
    "10.0"

run_test "Float division with 3 operands" \
    "$HEXCALC -fd 0x64 0x2 0x5" \
    "10.0"

echo "════════════════════════════════════════════════════════════"
echo "6. ARITHMETIC OPERATIONS - MODULO"
echo "════════════════════════════════════════════════════════════"

run_test "Modulo operation" \
    "$HEXCALC -mod 0xFF 0x10" \
    "0xf"

run_test "Modulo operation (larger)" \
    "$HEXCALC -mod 0x1234 0x100" \
    "0x34"

echo "════════════════════════════════════════════════════════════"
echo "7. ARITHMETIC OPERATIONS - POWER"
echo "════════════════════════════════════════════════════════════"

run_test "Power operation (2^8)" \
    "$HEXCALC -p 0x2 0x8" \
    "0x100"

run_test "Power operation (16^2)" \
    "$HEXCALC -p 0x10 0x2" \
    "0x100"

echo "════════════════════════════════════════════════════════════"
echo "8. BITWISE OPERATIONS - AND"
echo "════════════════════════════════════════════════════════════"

run_test "Bitwise AND with 2 operands" \
    "$HEXCALC -and 0xFF 0x0F" \
    "0xf"

run_test "Bitwise AND with 3 operands" \
    "$HEXCALC -and 0xFF 0xF0 0xF0" \
    "0xf0"

run_test "Bitwise AND with 4 operands" \
    "$HEXCALC -and 0xFFFF 0xFF00 0xF0F0 0xAAAA" \
    "0xa000"

echo "════════════════════════════════════════════════════════════"
echo "9. BITWISE OPERATIONS - OR"
echo "════════════════════════════════════════════════════════════"

run_test "Bitwise OR with 2 operands" \
    "$HEXCALC -or 0x0F 0xF0" \
    "0xff"

run_test "Bitwise OR with 3 operands" \
    "$HEXCALC -or 0x01 0x02 0x04" \
    "0x7"

run_test "Bitwise OR with 4 operands" \
    "$HEXCALC -or 0x1 0x2 0x4 0x8" \
    "0xf"

run_test "Bitwise OR with 5 operands" \
    "$HEXCALC -or 0x1 0x10 0x100 0x1000 0x10000" \
    "0x11111"

echo "════════════════════════════════════════════════════════════"
echo "10. BITWISE OPERATIONS - XOR"
echo "════════════════════════════════════════════════════════════"

run_test "Bitwise XOR with 2 operands" \
    "$HEXCALC -xor 0xFF 0x0F" \
    "0xf0"

run_test "Bitwise XOR with 3 operands" \
    "$HEXCALC -xor 0xFF 0xF0 0x0F" \
    "0x0"

run_test "Bitwise XOR with 4 operands" \
    "$HEXCALC -xor 0xAAAA 0x5555 0xFFFF 0x0000" \
    "0x0"

echo "════════════════════════════════════════════════════════════"
echo "11. BITWISE OPERATIONS - NOT"
echo "════════════════════════════════════════════════════════════"

run_test "Bitwise NOT (8 bits)" \
    "$HEXCALC -not 0x0F -bits 8" \
    "0xf0"

run_test "Bitwise NOT (16 bits)" \
    "$HEXCALC -not 0x00FF -bits 16" \
    "0xff00"

run_test "Bitwise NOT (32 bits)" \
    "$HEXCALC -not 0x0000FFFF -bits 32" \
    "0xffff0000"

echo "════════════════════════════════════════════════════════════"
echo "12. BITWISE OPERATIONS - LEFT SHIFT"
echo "════════════════════════════════════════════════════════════"

run_test "Left shift by 1" \
    "$HEXCALC -ls 0x1 1" \
    "0x2"

run_test "Left shift by 4" \
    "$HEXCALC -ls 0xF 4" \
    "0xf0"

run_test "Left shift by 8" \
    "$HEXCALC -ls 0xFF 8" \
    "0xff00"

echo "════════════════════════════════════════════════════════════"
echo "13. BITWISE OPERATIONS - RIGHT SHIFT"
echo "════════════════════════════════════════════════════════════"

run_test "Right shift by 1" \
    "$HEXCALC -rs 0x10 1" \
    "0x8"

run_test "Right shift by 4" \
    "$HEXCALC -rs 0xF0 4" \
    "0xf"

run_test "Right shift by 8" \
    "$HEXCALC -rs 0xFF00 8" \
    "0xff"

echo "════════════════════════════════════════════════════════════"
echo "14. OUTPUT FORMATS"
echo "════════════════════════════════════════════════════════════"

run_test "Hexadecimal format (default)" \
    "$HEXCALC -a 0x10 0x20" \
    "0x30"

run_test "Decimal format" \
    "$HEXCALC -a 0x10 0x20 -f dec" \
    "48"

run_test "Binary format" \
    "$HEXCALC -a 0x10 0x20 -f bin" \
    "0b110000"

run_test "Octal format" \
    "$HEXCALC -a 0x10 0x20 -f oct" \
    "0o60"

run_test "All formats" \
    "$HEXCALC -a 0x10 0x20 -f all" \
    "Hex: 0x30"

echo "════════════════════════════════════════════════════════════"
echo "15. VERBOSE MODE"
echo "════════════════════════════════════════════════════════════"

run_test "Verbose mode" \
    "$HEXCALC -a 0x100 0xFF -v" \
    "Operation:"

echo "════════════════════════════════════════════════════════════"
echo "16. MIXED INPUT FORMATS"
echo "════════════════════════════════════════════════════════════"

run_test "Mixed formats (0x prefix)" \
    "$HEXCALC -a 0xFF FF" \
    "0x1fe"

run_test "Without 0x prefix" \
    "$HEXCALC -a FF 10" \
    "0x10f"

run_test "Uppercase hex" \
    "$HEXCALC -a 0XFF 0X10" \
    "0x10f"

echo ""
echo "════════════════════════════════════════════════════════════"
echo "                    TEST SUMMARY"
echo "════════════════════════════════════════════════════════════"
echo -e "${GREEN}PASSED: $PASS${NC}"
echo -e "${RED}FAILED: $FAIL${NC}"
TOTAL=$((PASS + FAIL))
echo "TOTAL:  $TOTAL"
echo ""

if [ $FAIL -eq 0 ]; then
    echo -e "${GREEN}✓ ALL TESTS PASSED!${NC}"
    exit 0
else
    echo -e "${RED}✗ SOME TESTS FAILED!${NC}"
    exit 1
fi
