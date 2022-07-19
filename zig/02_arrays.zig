// Arrays

// Syntax:
// [N]T

// `N` -- count of elements in array. For array literals `_` can be used to
//        infer the size of the array.
// `T` -- type of elements in array. Also called the "array's child type".

// `len` field provides length of array.

const a = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
const b = [_]u8{ 'w', 'o', 'r', 'l', 'd' };

const array = [_]u8{ 'h', 'e', 'l', 'l', 'o' };
const length = array.len; // 5
