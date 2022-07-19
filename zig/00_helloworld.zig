// zig run 00_helloworld.zig

// `@import("std")` is a function. It defines a constant identifier called `std`
//   which we can use to access the Zig standard library.
const std = @import("std");

// We can also import a specific function instead.
const print = @import("std").debug.print;

// By default this is program entry. You can specify other entry functions to
//   the compiler too. Libraries need no `main()`.
pub fn main() void {
    // This uses string substitution and all values must be compile-time known
    //   for this to work. The placeholder (here the `{s}`) describes how
    //   the substituted parameter should be.. substituted. The `s` means
    //   "string". Just the `s` is the "specifier", and `{s}` the "placeholder".
    // The second parameter `.{"World"}` is called an Anonymous Struct Literal.
    std.debug.print("Hello, {s}!\n", .{"World"});

    // Specifier types:
    // - `x` and `X`:
    //   - format the non-numeric value as a string of bytes in hexadecimal notation ("binary dump") in either lower case or upper case
    //   - output numeric value in hexadecimal notation
    // - `s`: print a pointer-to-many as a c-string, use zero-termination
    // - `B` and `Bi`: output a memory size in either metric (1000) or power-of-two (1024) based notation. works for both float and integer values.
    // - `e`: output floating point value in scientific notation
    // - `d`: output numeric value in decimal notation
    // - `b`: output integer value in binary notation
    // - `c`: output integer as an ASCII character. Integer type must have 8 bits at max.
    // - `*`: output the address of the value instead of the value itself.

    // There are other format specifiers.
    const bytes = "hello";
    print("{s}\n", .{@typeName(@TypeOf(bytes))}); // *const [5:0]u8
    print("{d}\n", .{bytes.len}); // 5
    print("{c}\n", .{bytes[1]}); // 'e'
    print("{d}\n", .{bytes[5]}); // 0
    print("{}\n", .{'e' == '\x65'}); // true
    print("{d}\n", .{'\u{1f4a9}'}); // 128169
    print("{d}\n", .{'💯'}); // 128175
    print("{}\n", .{std.mem.eql(u8, "hello", "h\x65llo")}); // true
    print("{}\n", .{true});
    print("{}\n", .{false});
    print("0x{x}\n", .{"\xff"[0]}); // non-UTF-8 strings are possible with \xNN notation.
    print("0x{X}\n", .{"\xff"[0]}); // non-UTF-8 strings are possible with \xNN notation.
    print("{u}\n", .{'⚡'});
}

// Further:
//   - https://ziglang.org/documentation/master/#Case-Study-print-in-Zig
//   - https://ziglang.org/documentation/master/#Anonymous-Struct-Literals
//   - https://github.com/ziglang/zig/commit/c71857703f23979334b49f02a5dd4e4eb6f6dea7
