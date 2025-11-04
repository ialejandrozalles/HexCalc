#!/usr/bin/env python3
"""
HexCalc - Professional Hexadecimal Calculator
A powerful command-line tool for hexadecimal arithmetic operations

Author: Izai Alejandro Zalles Merino
License: MIT
Version: 1.0.0
"""

import sys
import argparse
import re
from typing import List, Union


class HexCalculator:
    """Main calculator class for hexadecimal operations"""
    
    def __init__(self):
        self.lastResult = None
        
    def parseHexValue(self, value: str) -> int:
        """
        Parse hexadecimal string to integer
        Supports formats: 0x123, 0X123, 123 (auto-detect)
        """
        value = value.strip()
        
        # Check if it's already in hex format
        if value.lower().startswith('0x'):
            return int(value, 16)
        
        # Try to parse as hex without prefix
        try:
            return int(value, 16)
        except ValueError:
            # Try as decimal if hex parsing fails
            try:
                return int(value, 10)
            except ValueError:
                raise ValueError(f"Invalid hexadecimal value: {value}")
    
    def formatOutput(self, value: int, outputFormat: str = 'hex') -> str:
        """Format output based on specified format"""
        if outputFormat == 'hex':
            return hex(value)
        elif outputFormat == 'dec':
            return str(value)
        elif outputFormat == 'bin':
            return bin(value)
        elif outputFormat == 'oct':
            return oct(value)
        elif outputFormat == 'all':
            return f"Hex: {hex(value)}\nDec: {value}\nBin: {bin(value)}\nOct: {oct(value)}"
        else:
            return hex(value)
    
    def add(self, values: List[str]) -> int:
        """Add multiple hexadecimal values"""
        result = 0
        for val in values:
            result += self.parseHexValue(val)
        return result
    
    def subtract(self, values: List[str]) -> int:
        """Subtract multiple hexadecimal values sequentially"""
        if len(values) < 2:
            raise ValueError("Subtraction requires at least 2 values")
        
        result = self.parseHexValue(values[0])
        for val in values[1:]:
            result -= self.parseHexValue(val)
        return result
    
    def multiply(self, values: List[str]) -> int:
        """Multiply multiple hexadecimal values"""
        result = 1
        for val in values:
            result *= self.parseHexValue(val)
        return result
    
    def divide(self, values: List[str], useFloatDivision: bool = False) -> Union[int, float]:
        """Divide multiple hexadecimal values sequentially"""
        if len(values) < 2:
            raise ValueError("Division requires at least 2 values")
        
        result = self.parseHexValue(values[0])
        for val in values[1:]:
            divisor = self.parseHexValue(val)
            if divisor == 0:
                raise ValueError("Division by zero")
            
            if useFloatDivision:
                result = result / divisor
            else:
                result = result // divisor
        return result
    
    def modulo(self, values: List[str]) -> int:
        """Calculate modulo of hexadecimal values"""
        if len(values) != 2:
            raise ValueError("Modulo operation requires exactly 2 values")
        
        dividend = self.parseHexValue(values[0])
        divisor = self.parseHexValue(values[1])
        
        if divisor == 0:
            raise ValueError("Division by zero")
        
        return dividend % divisor
    
    def bitwiseAnd(self, values: List[str]) -> int:
        """Perform bitwise AND on multiple values"""
        result = self.parseHexValue(values[0])
        for val in values[1:]:
            result &= self.parseHexValue(val)
        return result
    
    def bitwiseOr(self, values: List[str]) -> int:
        """Perform bitwise OR on multiple values"""
        result = self.parseHexValue(values[0])
        for val in values[1:]:
            result |= self.parseHexValue(val)
        return result
    
    def bitwiseXor(self, values: List[str]) -> int:
        """Perform bitwise XOR on multiple values"""
        result = self.parseHexValue(values[0])
        for val in values[1:]:
            result ^= self.parseHexValue(val)
        return result
    
    def bitwiseNot(self, value: str, bits: int = 64) -> int:
        """Perform bitwise NOT (with specified bit width)"""
        val = self.parseHexValue(value)
        # Create mask for specified bits
        mask = (1 << bits) - 1
        return (~val) & mask
    
    def leftShift(self, value: str, positions: int) -> int:
        """Perform left shift operation"""
        val = self.parseHexValue(value)
        return val << positions
    
    def rightShift(self, value: str, positions: int) -> int:
        """Perform right shift operation"""
        val = self.parseHexValue(value)
        return val >> positions
    
    def power(self, values: List[str]) -> int:
        """Calculate power (exponentiation)"""
        if len(values) != 2:
            raise ValueError("Power operation requires exactly 2 values (base and exponent)")
        
        base = self.parseHexValue(values[0])
        exponent = self.parseHexValue(values[1])
        return base ** exponent


def createParser() -> argparse.ArgumentParser:
    """Create and configure argument parser"""
    parser = argparse.ArgumentParser(
        prog='hexcalc',
        description='HexCalc - Professional Hexadecimal Calculator CLI Tool',
        epilog='Author: Izai Alejandro Zalles Merino | Examples: hexcalc -a 0x100 0xFF | hexcalc -s 0x5bbcfd38e33d 0x96',
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    
    # Operation arguments
    operations = parser.add_argument_group('arithmetic operations')
    operations.add_argument('-a', '--add', nargs='+', metavar='HEX',
                          help='add multiple hexadecimal values')
    operations.add_argument('-s', '--subtract', nargs='+', metavar='HEX',
                          help='subtract hexadecimal values (first - second - third...)')
    operations.add_argument('-m', '--multiply', nargs='+', metavar='HEX',
                          help='multiply multiple hexadecimal values')
    operations.add_argument('-d', '--divide', nargs='+', metavar='HEX',
                          help='divide hexadecimal values (integer division)')
    operations.add_argument('-fd', '--floatDivide', nargs='+', metavar='HEX',
                          help='divide hexadecimal values (float division)')
    operations.add_argument('-mod', '--modulo', nargs=2, metavar='HEX',
                          help='modulo operation (first %% second)')
    operations.add_argument('-p', '--power', nargs=2, metavar='HEX',
                          help='power operation (base ** exponent)')
    
    # Bitwise operations
    bitwise = parser.add_argument_group('bitwise operations')
    bitwise.add_argument('-and', '--bitwiseAnd', nargs='+', metavar='HEX',
                        help='bitwise AND operation')
    bitwise.add_argument('-or', '--bitwiseOr', nargs='+', metavar='HEX',
                        help='bitwise OR operation')
    bitwise.add_argument('-xor', '--bitwiseXor', nargs='+', metavar='HEX',
                        help='bitwise XOR operation')
    bitwise.add_argument('-not', '--bitwiseNot', nargs=1, metavar='HEX',
                        help='bitwise NOT operation')
    bitwise.add_argument('-bits', '--bitWidth', type=int, default=64, metavar='N',
                        help='bit width for NOT operation (default: 64)')
    bitwise.add_argument('-ls', '--leftShift', nargs=2, metavar=('HEX', 'POS'),
                        help='left shift operation (value positions)')
    bitwise.add_argument('-rs', '--rightShift', nargs=2, metavar=('HEX', 'POS'),
                        help='right shift operation (value positions)')
    
    # Output options
    output = parser.add_argument_group('output options')
    output.add_argument('-f', '--format', choices=['hex', 'dec', 'bin', 'oct', 'all'],
                       default='hex', help='output format (default: hex)')
    output.add_argument('-v', '--verbose', action='store_true',
                       help='show verbose output with operation details')
    
    # Version
    parser.add_argument('--version', action='version', version='HexCalc 1.0.0')
    
    return parser


def printBanner():
    """Print application banner"""
    banner = """
    ╔═══════════════════════════════════════════════════════════╗
    ║                                                           ║
    ║   ██╗  ██╗███████╗██╗  ██╗ ██████╗ █████╗ ██╗      ██╗  ║
    ║   ██║  ██║██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██║     ██╔╝  ║
    ║   ███████║█████╗   ╚███╔╝ ██║     ███████║██║    ██╔╝   ║
    ║   ██╔══██║██╔══╝   ██╔██╗ ██║     ██╔══██║██║   ██╔╝    ║
    ║   ██║  ██║███████╗██╔╝ ██╗╚██████╗██║  ██║███████╝      ║
    ║   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝      ║
    ║                                                           ║
    ║         Professional Hexadecimal Calculator CLI          ║
    ║         Author: Izai Alejandro Zalles Merino             ║
    ║                     Version 1.0.0                        ║
    ║                                                           ║
    ╚═══════════════════════════════════════════════════════════╝
    """
    print(banner)


def main():
    """Main application entry point"""
    parser = createParser()
    args = parser.parse_args()
    
    # Check if any operation was specified
    hasOperation = any([
        args.add, args.subtract, args.multiply, args.divide, args.floatDivide,
        args.modulo, args.power, args.bitwiseAnd, args.bitwiseOr,
        args.bitwiseXor, args.bitwiseNot, args.leftShift, args.rightShift
    ])
    
    if not hasOperation:
        printBanner()
        parser.print_help()
        return
    
    calc = HexCalculator()
    
    try:
        result = None
        operation = ""
        
        # Process operations
        if args.add:
            result = calc.add(args.add)
            operation = f"Addition: {' + '.join(args.add)}"
        
        elif args.subtract:
            result = calc.subtract(args.subtract)
            operation = f"Subtraction: {' - '.join(args.subtract)}"
        
        elif args.multiply:
            result = calc.multiply(args.multiply)
            operation = f"Multiplication: {' * '.join(args.multiply)}"
        
        elif args.divide:
            result = calc.divide(args.divide, False)
            operation = f"Division (integer): {' / '.join(args.divide)}"
        
        elif args.floatDivide:
            result = calc.divide(args.floatDivide, True)
            operation = f"Division (float): {' / '.join(args.floatDivide)}"
            # For float division, show decimal result
            if args.verbose:
                print(f"[*] Operation: {operation}")
            print(f"Result: {result}")
            return
        
        elif args.modulo:
            result = calc.modulo(args.modulo)
            operation = f"Modulo: {args.modulo[0]} % {args.modulo[1]}"
        
        elif args.power:
            result = calc.power(args.power)
            operation = f"Power: {args.power[0]} ** {args.power[1]}"
        
        elif args.bitwiseAnd:
            result = calc.bitwiseAnd(args.bitwiseAnd)
            operation = f"Bitwise AND: {' & '.join(args.bitwiseAnd)}"
        
        elif args.bitwiseOr:
            result = calc.bitwiseOr(args.bitwiseOr)
            operation = f"Bitwise OR: {' | '.join(args.bitwiseOr)}"
        
        elif args.bitwiseXor:
            result = calc.bitwiseXor(args.bitwiseXor)
            operation = f"Bitwise XOR: {' ^ '.join(args.bitwiseXor)}"
        
        elif args.bitwiseNot:
            result = calc.bitwiseNot(args.bitwiseNot[0], args.bitWidth)
            operation = f"Bitwise NOT: ~{args.bitwiseNot[0]} ({args.bitWidth} bits)"
        
        elif args.leftShift:
            result = calc.leftShift(args.leftShift[0], int(args.leftShift[1]))
            operation = f"Left Shift: {args.leftShift[0]} << {args.leftShift[1]}"
        
        elif args.rightShift:
            result = calc.rightShift(args.rightShift[0], int(args.rightShift[1]))
            operation = f"Right Shift: {args.rightShift[0]} >> {args.rightShift[1]}"
        
        # Display results
        if result is not None:
            if args.verbose:
                print(f"[*] Operation: {operation}")
                print(f"[*] Output Format: {args.format}")
                print()
            
            formattedResult = calc.formatOutput(result, args.format)
            print(f"Result: {formattedResult}")
    
    except ValueError as e:
        print(f"[ERROR] {str(e)}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"[ERROR] Unexpected error: {str(e)}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
