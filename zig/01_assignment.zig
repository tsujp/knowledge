// Assignment

// Syntax:
// (const|var) identifier[: type] = value

// `const` -- immutable.
// `var` -- muteable.
// type annotation can be omitted if the type of value can be inferred.

// `const` generally preferred over `var`.

const constant: i32 = 5; // signed 32-bit constant
var variable: u32 = 5000; // unsigned 32-bit variable

// @as performs an explicit type coercion
const inferred_constant = @as(i32, 5);
var inferred_variable = @as(u32, 5000);

// Constants and variables must have values. Special value `undefined` may be
//   given if explicitly annotated. Value `undefined` coercs to any type.

const a: i32 = undefined; // `undefined` is any type .'. a valid i32.
var b: u32 = undefined;
