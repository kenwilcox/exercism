const std = @import("std");

pub fn primes(buffer: []u32, comptime limit: u32) []u32 {
    var sieve = std.StaticBitSet(limit + 1).initEmpty();
    var acc: u32 = 2;
    var idx: u32 = 0;
    while (acc <= limit) : (acc += 1) {
        if (sieve.isSet(acc))
            continue;
        buffer[idx] = acc;
        idx += 1;
        var rest: u32 = acc*acc;
        while(rest <= limit) : (rest += acc) {
            sieve.set(rest);
        }
    }
    return buffer[0..idx];
}
