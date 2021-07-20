architecture behavior of ButtonLogic is

    Signal s_DFF1_in, s_DFF1_out : std_logic;
    signal s_DFF2_in, s_DFF2_out : std_logic;
    signal s_DFF3_in, s_DFF3_out : std_logic;
    signal s_DFF4_in, s_DFF4_out : std_logic;
    signal s_DFF5_out : std_logic;
    signal s_and_1, s_xor_1, s_nor_1, s_and_2 : std_logic;

begin

    s_DFF1_in <= not( Reset or Tick or not(s_DFF1_out));
    s_DFF2_in <= (Reset nor not(s_DFF1_out));
    s_DFF3_in <= (Reset nor not(s_DFF2_out));
    s_DFF4_in <= (Reset nor not(s_DFF3_out));

    s_and_1 <= s_DFF3_out and not(s_DFF4_out);
    s_xor_1 <= s_and_1 xor s_DFF5_out;
    s_nor_1 <= UnBlock nor Reset;
    s_and_2 <= s_xor_1 and s_nor_1;

    blk <= s_DFF5_out;

    DFF1 : process( Clock, Button, Reset, Tick, s_DFF1_in)
    begin
        if( Button = '1' ) then s_DFF1_out <= '1';
        elsif( rising_edge(Clock) ) then 
            s_DFF1_out <= s_DFF1_in;
      end if;
    end process DFF1;
    
    DFF2 : process( Clock, Button, Reset, Tick, s_DFF2_in )
    begin
        if( rising_edge(Clock) ) then
            s_DFF2_out <= s_DFF2_in;
        end if ;
    end process DFF2;

    DFF3 : process( Clock, Button, Reset, Tick, s_DFF3_in)
    begin
        if( rising_edge(Clock) ) then
            s_DFF3_out <= s_DFF3_in;
        end if ;
    end process DFF3;

    DFF4 : process( Clock, Button, Reset, Tick, s_DFF4_in)
    begin
        if( rising_edge(Clock) ) then
            s_DFF4_out <= s_DFF4_in;
        end if ;
    end process DFF4;

    DFF5 : process( Clock, Button, Reset, Tick, UnBlock, s_and_2)
    begin
        if( rising_edge(Clock) ) then
            s_DFF5_out <= s_and_2;
        end if ;
    end process DFF5;
end architecture behavior;