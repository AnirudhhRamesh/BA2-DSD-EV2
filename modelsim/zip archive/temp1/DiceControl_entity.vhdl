library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DiceControl is
    port(Clock, Reset, RollDiceIn, Tick, Done: in std_logic;
        ShiftValue : in std_logic_vector(3 downto 0);
        RollDiceOut, ValidDice : out std_logic;
        DiceValue : out unsigned(2 downto 0));

end entity DiceControl;