library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ShiftToParallel is
    port(Clock, Reset, Din, Tick : in std_logic;
        Value : out std_logic_vector(3 downto 0));

end entity ShiftToParallel;
