library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DiceImplementation is
    generic (InitialSeed : INTEGER);
    port(Clock, Reset, Tick, RollDice : IN std_logic;
        DiceRolled : OUT std_logic;
        DiceValue : OUT unsigned(2 downto 0));

end entity DiceImplementation;