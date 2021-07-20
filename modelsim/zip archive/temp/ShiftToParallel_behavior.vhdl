architecture behavior of ShiftToParallel is

    Signal s_DFF0: std_logic;
    signal s_DFF1: std_logic;
    signal s_DFF2: std_logic;
    signal s_DFF3: std_logic;

begin

    --implicit processes
    Value <= s_DFF3 & s_DFF2 & s_DFF1 & s_DFF0;

    --explicit processes (one for each D-FF)
    DFF0 : process( Clock, Tick, Reset, s_DFF0)
    begin
        if( rising_edge(Clock) ) then
            if (Reset = '1') then s_DFF0 <= '0';
                else
                    if (Tick = '1') then s_DFF0 <= Din;
                        else s_DFF0 <= s_DFF0;
                    end if;
            end if;
        end if ;
    end process DFF0; -- DFF0 (LSB of random number => MSB(3) of value)
    
    DFF1 : process( Clock, Tick, Reset, s_DFF1)
    begin
        if( rising_edge(Clock) ) then
            if (Reset = '1') then s_DFF1 <= '0';
                else
                    if (Tick = '1') then s_DFF1 <= s_DFF0;
                        else s_DFF1 <= s_DFF1;
                    end if;
            end if;
        end if ;
    end process DFF1; -- DFF1
    
    DFF2 : process( Clock, Tick, Reset, s_DFF2)
    begin
        if( rising_edge(Clock) ) then
            if (Reset = '1') then s_DFF2 <= '0';
                else
                    if (Tick = '1') then s_DFF2 <= s_DFF1;
                        else s_DFF2 <= s_DFF2;
                    end if;
            end if;
        end if ;
    end process DFF2; -- DFF2

    DFF3 : process( Clock, Tick, Reset, s_DFF3)
    begin
        if( rising_edge(Clock) ) then
            if (Reset = '1') then s_DFF3 <= '0';
                else
                    if (Tick = '1') then s_DFF3 <= s_DFF2;
                        else s_DFF3 <= s_DFF3;
                    end if;
            end if;
        end if ;
    end process DFF3; -- DFF3 (MSB of random number => LSB(0) of Value)

end architecture behavior;