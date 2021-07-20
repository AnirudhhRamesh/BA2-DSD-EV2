ARCHITECTURE theo OF GameControl IS

  SIGNAL s_current, s_next       : std_logic_vector( 3 DOWNTO 0 );
  SIGNAL s_rolled, s_rolled_next : std_logic_vector( 3 DOWNTO 0 );

BEGIN

  RollDice     <= '1' WHEN s_current = X"1" OR s_current = X"4" OR s_current = X"8" ELSE '0';
  UnblockDice  <= '1' WHEN s_current = X"0" ELSE '0';
  SortDice     <= '1' WHEN s_current = X"0" ELSE '0';
  ReadyForRole <= '1' WHEN s_current = X"0" ELSE '0';
  Role1        <= '1' WHEN s_current = X"1" OR s_current = X"2" ELSE '0';
  SelectBlock1 <= '1' WHEN s_current = X"3" ELSE '0';
  Role2        <= '1' WHEN s_current = X"4" OR s_current = X"5" ELSE '0';
  SelectBlock2 <= '1' WHEN s_current = X"6" ELSE '0';
  Role3        <= '1' WHEN s_current = X"7" OR s_current = X"8" ELSE '0';
  
  s_rolled_next(0) <= '1' WHEN DiceRolled1 = '1' ELSE
                      '0' WHEN s_current = X"1" OR s_current = X"4" OR s_current = X"8" ELSE
                      s_rolled(0);
  s_rolled_next(1) <= '1' WHEN DiceRolled2 = '1' ELSE
                      '0' WHEN s_current = X"1" OR s_current = X"4" OR s_current = X"8" ELSE
                      s_rolled(1);
  s_rolled_next(2) <= '1' WHEN DiceRolled3 = '1' ELSE
                      '0' WHEN s_current = X"1" OR s_current = X"4" OR s_current = X"8" ELSE
                      s_rolled(2);
  s_rolled_next(3) <= '1' WHEN DiceRolled4 = '1' ELSE
                      '0' WHEN s_current = X"1" OR s_current = X"4" OR s_current = X"8" ELSE
                      s_rolled(3);
  
  datup : PROCESS( s_current, Button, s_rolled ) IS
  BEGIN
    CASE (s_current) IS
       WHEN X"0"    => IF (Button = '1') THEN s_next <= X"1";
                                         ELSE s_next <= X"0";
                       END IF;
       WHEN X"1"    => s_next <= X"2";
       WHEN X"2"    => IF (s_rolled = X"F") THEN s_next <= X"3";
                                            ELSE s_next <= X"2";
                       END IF;
       WHEN X"3"    => IF (Button = '1') THEN s_next <= X"4";
                                         ELSE s_next <= X"3";
                       END IF;
       WHEN X"4"    => s_next <= X"5";
       WHEN X"5"    => IF (s_rolled = X"F") THEN s_next <= X"6";
                                            ELSE s_next <= X"5";
                       END IF;
       WHEN X"6"    => IF (Button = '1') THEN s_next <= X"7";
                                         ELSE s_next <= X"6";
                       END IF;
       WHEN X"7"    => s_next <= X"8";
       WHEN X"8"    => IF (s_rolled = X"F") THEN s_next <= X"9";
                                            ELSE s_next <= X"8";
                       END IF;
       WHEN X"9"    => IF (Button = '1') THEN s_next <= X"0";
                                         ELSE s_next <= X"9";
                       END IF;
       WHEN OTHERS  => s_next <= X"0";
     END CASE;
  END PROCESS datup;

  flipflops : PROCESS( Clock ) IS
  BEGIN
    IF (rising_edge(clock)) THEN
      IF (Reset = '1') THEN s_rolled  <= X"0";
                            s_current <= X"0";
                       ELSE s_rolled  <= s_rolled_next;
                            s_current <= s_next;
      END IF;
    END IF;
  END PROCESS flipflops;
END theo;
