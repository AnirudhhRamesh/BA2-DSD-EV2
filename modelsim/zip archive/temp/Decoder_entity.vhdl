library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Decoder is
    port(pips : in unsigned(2 downto 0);
    displ : out std_logic_vector(6 downto 0));
    --Output driving the display.
     --6 5 4 3 2 1 0
     --a b c d e f g

end entity Decoder;
