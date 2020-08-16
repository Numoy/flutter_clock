import 'dart:math' as math;

const digitSymbol = {
    0: [
        '┌---┐',
        '|┌-┐|',
        '||,||',
        '||,||',
        '|└-┘|',
        '└---┘'
    ],
    1: [
        ',,┌┐,',
        ',,||,',
        ',,||,',
        ',,||,',
        ',,||,',
        ',,└┘,'
    ],
    2: [
        '┌---┐',
        '└--┐|',
        '┌--┘|',
        '|┌--┘',
        '|└--┐',
        '└---┘'
    ],
    3: [
        '┌---┐',
        '└--┐|',
        '┌--┘|',
        '└--┐|',
        '┌--┘|',
        '└---┘'
    ],
    4: [
        '┌┐,┌┐',
        '||,||',
        '|└-┘|',
        '└--┐|',
        ',,,||',
        ',,,└┘'
    ],
    5: [
        '┌---┐',
        '|┌--┘',
        '|└--┐',
        '└--┐|',
        '┌--┘|',
        '└---┘'
    ],
    6: [
        '┌---┐',
        '|┌--┘',
        '|└--┐',
        '|┌-┐|',
        '|└-┘|',
        '└---┘'
    ],
    7: [
        '┌--┐,',
        '└-┐|,',
        ',,||,',
        ',,||,',
        ',,||,',
        ',,└┘,'
    ],
    8: [
        '┌---┐',
        '|┌-┐|',
        '|└-┘|',
        '|┌-┐|',
        '|└-┘|',
        '└---┘'
    ],
    9: [
        '┌---┐',
        '|┌-┐|',
        '|└-┘|',
        '└--┐|',
        '┌--┘|',
        '└---┘'
    ],
    ':': [
        ',,',
        '┌┐',
        '└┘',
        '┌┐',
        '└┘',
        ',,',
    ],
    'start': [
        '|',
        '|',
        '|',
        '|',
        '|',
        '|',
    ],
    'end': [
        '|',
        '|',
        '|',
        '|',
        '|',
        '|',
    ],
    'line': [
        '|----------------------|',
    ],
    'top': [
        '┌----------------------┐',
        '|----------------------|',
    ],
    'bottom': [
        '|----------------------|',
        '└----------------------┘',
    ]
};

const double zero = 0;
const double halfPi = math.pi / 2;
const double pi = math.pi;
const double oneHalfPi = math.pi * 1.5;
const double twoPi = math.pi * 2;
const double fiil = math.pi * 3 / 4;

const symbolMap = {
    '┌': [zero, halfPi],
    '┐': [halfPi, pi],
    '└': [zero, oneHalfPi],
    '┘': [pi, oneHalfPi],
    '-': [zero, pi],
    '|': [halfPi, oneHalfPi],
    ',': [fiil, fiil]
};