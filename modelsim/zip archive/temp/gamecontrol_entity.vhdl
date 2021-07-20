LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY gamecontrol IS
   PORT ( Button                    : IN  std_logic;
          Clock                     : IN  std_logic;
          DiceRolled1               : IN  std_logic;
          DiceRolled2               : IN  std_logic;
          DiceRolled3               : IN  std_logic;
          DiceRolled4               : IN  std_logic;
          Reset                     : IN  std_logic;
          ReadyForRole              : OUT std_logic;
          Role1                     : OUT std_logic;
          Role2                     : OUT std_logic;
          Role3                     : OUT std_logic;
          RollDice                  : OUT std_logic;
          SelectBlock1              : OUT std_logic;
          SelectBlock2              : OUT std_logic;
          SortDice                  : OUT std_logic;
          UnblockDice               : OUT std_logic);
END gamecontrol;

