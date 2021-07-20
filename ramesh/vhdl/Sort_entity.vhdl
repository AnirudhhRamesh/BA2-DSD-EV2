library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Sort is
    port(sort : in std_logic;
        DiceIn1, DiceIn2, DiceIn3, DiceIn4 : in unsigned(2 downto 0);
        DiceOut1, DiceOut2, DiceOut3, DiceOut4 : out unsigned(2 downto 0));

end entity Sort;