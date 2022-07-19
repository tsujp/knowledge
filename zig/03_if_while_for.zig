// Control-flow
// zig test 03_if_while_for.zig

// There is no truthy or falsy in Zig. Strict boolean values only.

const expect = @import("std").testing.expect; // expect fails if given false.

// `if` statements can also be used as expressions.

// Only `zig test` sees `test` blocks so you can inline them next to what they
//   test! `zig run` and `zig build` won't see them.
test "if statement" {
    const a = true;
    var x: u16 = 0;

    if (a) {
        x += 1;
    } else {
        x += 2;
    }

    try expect(x == 1);
}

// If a test fails the error and stack trace will be shown.
test "if statement expression" {
    const a = true;
    var x: u16 = 0;
    x += if (a) 1 else 2;
    try expect(x == 1);
}

// `while` statements have a (1) condition (2) block (3) continue expression.

test "while without continue" {
    var i: u8 = 2;
    while (i < 100) {
        i *= 2;
    }
    try expect(i == 128);
}

test "while with continue expression" {
    var sum: u8 = 0;
    var i: u8 = 1;
    while (i <= 10) : (i += 1) {
        sum += i;
    }
    try expect(sum == 55);
}

test "while with continue" {
    var sum: u8 = 0;
    var i: u8 = 0;
    while (i <= 3) : (i += 1) {
        if (i == 2) continue;
        sum += i;
    }
    try expect(sum == 4);
}

test "while with break" {
    var sum: u8 = 0;
    var i: u8 = 0;
    while (i <= 3) : (i += 1) {
        if (i == 2) break;
        sum += i;
    }
    try expect(sum == 1);
}

// `for` statements can iterate over arrays (and other types) and can use
//   keywords `break` and `continue` as `while` does.

test "for" {
    // Character literals are equivalent to integer literals.
    const string = [_]u8{ 'a', 'b', 'c' };

    // Assignments to `_` for throwaway as Zig does not allow unused values.
    for (string) |character, index| {
        _ = character;
        _ = index;
    }

    for (string) |character| {
        _ = character;
    }

    for (string) |_, index| {
        _ = index;
    }

    for (string) |_| {}
}
