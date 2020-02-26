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
