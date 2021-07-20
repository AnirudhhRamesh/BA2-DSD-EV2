architecture behavior of DiceControl is

    Type ControlStateType is (waitIdle, waitTick, waitRand);
    SIGNAL s_cur_state, s_next_state : ControlStateType;
    
    signal s_next_Dice_Value : unsigned(2 downto 0);
    signal s_next_ValidDice : std_logic;

begin
    
    --Explicit processes
    controller : process( Clock )
    begin
        if( rising_edge(Clock) ) then
            s_cur_state <= s_next_state;
            DiceValue <= s_next_Dice_Value;
            s_next_ValidDice <= '0';
            ValidDice <= s_next_ValidDice;
            RollDiceOut <= '0';
        
            if (Reset = '1') then 
                s_cur_state <= waitIdle;
                s_next_ValidDice <= '0';
                ValidDice <= s_next_ValidDice;
                RollDiceOut <= '0';
                DiceValue <= to_unsigned(0,3);
                s_next_Dice_Value <= to_unsigned(0,3);
                DiceValue <= s_next_Dice_Value;
            else
                --Idle state
                if (s_cur_state = waitIdle) then
                    --Do nothing
                end if;

                --Wait for Tick
                if (s_cur_state = waitTick) then
                    if (Tick = '1') then
                        --Roll Dice Out
                        RollDiceOut <= '1';
                    end if;
                end if;
                --Wait for Random Nbr
                if (s_cur_state = waitRand) then
                    if (Done = '1') then
                        if ((ShiftValue(3) = '1') or ((ShiftValue(2 downto 0)) < std_logic_vector(to_unsigned(1,3))) or (ShiftValue(2 downto 0) > std_logic_vector(to_unsigned(6,3)))) then
                            --Invalid Dice
                            s_next_Dice_Value <= to_unsigned(0,3);
                        else
                            s_next_Dice_Value <= unsigned(ShiftValue(2 downto 0));
                            s_next_ValidDice <= '1';
                        end if;
                    end if;
                end if;
            end if;
        end if ;
    end process ; -- controller

    controllerTransition : PROCESS (s_cur_state, RollDiceIn, Tick, Done, ShiftValue) is
        begin
            case (s_cur_state) is
                when waitIdle => If (RollDiceIn = '1') then s_next_state <= waitTick;
                                                        else s_next_state <= waitIdle;
                                                    end if;
                when waitTick => If (Tick = '1') then s_next_state <= waitRand;
                                                        else s_next_state <= waitTick; 
                                                    end if;
                when waitRand => If (Done = '1') then
                                    if ((ShiftValue(3) = '1') or ((ShiftValue(2 downto 0)) < std_logic_vector(to_unsigned(1,3))) or (ShiftValue(2 downto 0) > std_logic_vector(to_unsigned(6,3)))) then s_next_state <= waitTick;
                                                            else s_next_state <= waitIdle;
                                                        end if;
                                                  else s_next_state <= waitRand;
                                                end if;
            end case;
    end process controllerTransition;
end architecture behavior;
