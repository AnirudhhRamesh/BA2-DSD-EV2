ARCHITECTURE functional OF GenericCounter IS

  SIGNAL s_next, s_current : unsigned( (NrOfBits-1) DOWNTO 0 );
  SIGNAL s_zero            : std_logic;

BEGIN

  s_next <= to_unsigned(ReloadValue,NrOfBits) WHEN Reset = '1' OR s_zero = '1' ELSE
            s_current - 1;
  Tick   <= s_zero;
  s_zero <= '1' WHEN s_current = to_unsigned(0,NrOfBits) ELSE '0';

  flipflops : PROCESS( Clock ) IS
  BEGIN
    IF (rising_edge(Clock)) THEN s_current <= s_next;
    END IF;
  END PROCESS flipflops;

END functional;
