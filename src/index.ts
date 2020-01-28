/**
 * Returns the result of `a` add `b`.
 *
 * @param a - The first input number
 * @param b - The second input number
 * @returns The artihmetic result of `a` add `b`
 */
export const Add = (a: number, b: number): number => {
  return a + b;
};

/**
 * Returns the result of `a` subtract `b`.
 *
 * @param a - The first input number
 * @param b - The second input number
 * @returns The artihmetic result of `a` subtract `b`
 */
export const Subtract = (a: number, b: number): number => {
  return a - b;
};

/**
 * Returns the result of `a` multiplied by `b`.
 *
 * @param a - The first input number
 * @param b - The second input number
 * @returns The artihmetic result of `a` multiplied by `b`
 */
export const Multiply = (a: number, b: number): number => {
  return a * b;
};

/**
 * Returns the result of `a` divide by `b`.
 *
 * @param a - The first input number
 * @param a - The second input number
 * @returns The artihmetic result of `a` divided by `b`
 */
export const Divide = (a: number, b: number): number => {
  if (b === 0) {
    b = 1;
  }
  return a / b;
};
