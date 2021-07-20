library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Decoder is
    port(pips : in unsigned(2 downto 0);
    displ : out std_logic_vector(6 downto 0));

end entity Decoder;
