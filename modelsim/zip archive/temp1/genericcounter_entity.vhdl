LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY genericcounter IS
   GENERIC ( ReloadValue               : INTEGER;
             NrOfBits                  : INTEGER);
   PORT ( Clock                     : IN  std_logic;
          Reset                     : IN  std_logic;
          Tick                      : OUT std_logic);
END genericcounter;

