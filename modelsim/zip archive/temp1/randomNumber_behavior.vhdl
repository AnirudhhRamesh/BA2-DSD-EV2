ARCHITECTURE emulator OF randomNumber IS

  SIGNAL s_LFSR  : std_logic_vector( 15 DOWNTO 0 );
  SIGNAL s_count : unsigned(2 DOWNTO 0);

BEGIN
  LFSR : PROCESS ( Reset , CSin ) IS
  BEGIN
    IF (Reset = '1') THEN s_LFSR <= std_logic_vector(to_unsigned(InitialSeed,16));
    ELSIF (falling_edge(CSin)) THEN
      s_LFSR(15 DOWNTO 1) <= s_LFSR(14 DOWNTO 0);
      s_LFSR(0) <= s_LFSR(10) XOR (s_LFSR(12) XOR (s_LFSR(13) XOR s_LFSR(15)));
    END IF;
  END PROCESS LFSR;
  
  count : PROCESS( CSin , CLKin ) IS
  BEGIN
    IF (CSin = '1') THEN s_count <= to_unsigned(0,3);
    ELSIF (rising_edge(CLKin)) THEN s_count <= s_count + 1;
    END IF;
  END PROCESS count;
  
  Dout <= s_LFSR(0) WHEN s_count = "001" ELSE
          s_LFSR(2) WHEN s_count = "010" ELSE
          s_LFSR(5) WHEN s_count = "011" ELSE
          s_LFSR(9) WHEN s_count = "100" ELSE s_LFSR(15);
END emulator;
