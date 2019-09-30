import { Add, Subtract, Multiply, Divide } from './index';

test('Add', () => {
    expect(Add(1, 1)).toBe(2);
});

test('Subtract', () => {
    expect(Subtract(5, 2)).toBe(3);
});

test('Multiply', () => {
    expect(Multiply(5, 2)).toBe(10);
});

test('Divide', () => {
    expect(Divide(10, 2)).toBe(5);
    expect(Divide(10, 0)).toBe(10);
});