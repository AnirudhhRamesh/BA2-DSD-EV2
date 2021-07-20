LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY randomNumber IS
  GENERIC( InitialSeed : INTEGER);
  PORT ( Reset : IN  std_logic;
         CSin  : IN  std_logic;
         CLKin : IN  std_logic;
         Dout  : OUT std_logic );
END randomNumber;
