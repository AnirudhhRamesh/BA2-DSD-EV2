architecture behavior of requestRandom is

    Type StateType is (idle, S1, S2, S3, S4, S5, S6, S7, S8, S9);
    SIGNAL s_cur_state, s_next_state : StateType;

    SIGNAL s_is_done : std_logic;
    SIGNAL s_is_DoShift : std_logic;
    SIGNAL s_CLKin : std_logic;

begin

    CLKin <= s_CLKin;

    
    FSM : process( Clock, POR )
    begin
        if( POR = '1' ) then 
            s_cur_state <= idle;
            s_is_doShift <= '0';
            s_is_done <= '0';

        elsif( rising_edge(Clock) ) then
            s_cur_state <= s_next_state;

            if (s_cur_state = idle) then CSin <= '1'; else CSin <= '0';
            end if;

            if (s_cur_state = S2 or s_cur_state = S4 or s_cur_state = S6 or s_cur_state = S8) then s_CLKin <= '1'; else s_CLKin <= '0';
            end if;

            doShift <= '0';
            if (s_is_doShift = '1') then
                if (s_CLKin = '0') then
                    doShift <= '1';
                    s_is_doShift <= '0';
                end if;
            else
                if (s_CLKin = '1') then
                    s_is_doShift <= '1';
                end if;
            end if;

            done <= '0';
            if (s_is_done = '1') then
                if (s_next_state = idle) then 
                    done <= '1';
                    s_is_done <= '0';
                end if;
            else
                if (s_next_state = s1) then
                    s_is_done <= '1';
                end if; 
            end if;
            
        end if ;
    end process ;
    
    transition : PROCESS (req, Tick, s_cur_state) is
    begin
        case (s_cur_state) is
            when idle => If (req = '1') then s_next_state <= S1;
                                        else s_next_State <= idle;
                        end if;
            when S1 => if (Tick = '1') then s_next_state <= S2;
                                        else s_next_state <= S1;
                                        end if;
            when S2 => if (Tick = '1') then s_next_state <= S3;
                                        else s_next_state <= S2;
                                        end if;
            when S3 => if (Tick = '1') then s_next_state <= S4;
                                        else s_next_state <= S3;
                                    end if;
            when S4 => if (Tick = '1') then s_next_state <= S5;
                                        else s_next_state <= S4;
                                    end if;
            when S5 => if (Tick = '1') then s_next_state <= S6;
                                        else s_next_state <= S5;
                                    end if;
            when S6 => if (Tick = '1') then s_next_state <= S7;
                                        else s_next_state <= S6;                            
                                    end if;
            when S7 => if (Tick = '1') then s_next_state <= S8;
                                        else s_next_state <= S7;                            
                                    end if;
            when S8 => if (Tick = '1') then s_next_state <= S9;
                                        else s_next_state <= S8;                            
                                    end if;
            when S9 => if (Tick = '1') then s_next_state <= idle;
                                        else s_next_state <= S9;                            
                                    end if;
            when others => s_next_state <= idle;
        end case;
    end process transition;       

end architecture behavior;