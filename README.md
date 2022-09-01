Go to https://tinytapeout.com for instructions!

# MicroAsicV

This is TinyTapeout submission on Verilog. It implements 7 oscillators, and divides clock to allow external measurements via slow IO. 
As we only have access to Verilog, to ensure oscillators are not optimized away they use shift register data as second input. 

# In pinout: 
```
0: clock in (for debugging)
1: reset
2: shift register clk
3: shift register data
4-6: clock source id
7: unused
```

# Out pinout: 
```
0: clock divided by 2^9
1: clock divided by 2^13
2: clock divided by 2^17
3: clock divided by 2^21
4: clock divided by 2^25
5: clock divided by 2^29
6: clock divided by 2^31
7: Bit 11 of shift register (to ensure it's not optimized away)
```

# Clock variants:
XOR requires ones in shift register. 

```
b000: clk_in
b001: 3-stage XOR oscillator
b002: 5-stage XOR oscillator
b003: 1-stage XOR oscillator (unlikely to work)
b004: 2-stage XOR oscillator (requires only one '1' in shift register to have single inversion)
b005: 5-stage NAND oscillator
b006: 5-stage NOR oscillator
b007: 5-stage + oscillator
```


