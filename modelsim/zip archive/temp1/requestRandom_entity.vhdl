library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity requestRandom is
    port(Clock, POR, req, Tick: in std_logic;
        CSin, CLKin, doShift, done : out std_logic);

end entity requestRandom;
