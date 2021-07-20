library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ButtonLogic is
    port(UnBlock, Button, Reset, Tick, Clock : in std_logic;
        blk : out std_logic);

end entity ButtonLogic;
