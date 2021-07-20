ARCHITECTURE behavior OF DiceImplementation IS

    SIGNAL s_req, s_CSin, s_CLKin, s_doShift, s_done, s_Dout: std_logic;
    SIGNAL s_ShiftValue : std_logic_vector (3 downto 0);

    COMPONENT requestRandom IS
        PORT(Clock, POR, req, Tick: IN std_logic;
            CSin, CLKin, doShift, done : OUT std_logic);
    END COMPONENT;
    
    COMPONENT ShiftToParallel IS
        PORT(Clock, Reset, Din, Tick : IN std_logic;
            Value : OUT std_logic_vector(3 downto 0));
    END COMPONENT;
    
    COMPONENT DiceControl IS
    PORT(Clock, Reset, RollDiceIn, Tick, Done: IN std_logic;
        ShiftValue : IN std_logic_vector(3 downto 0);
        RollDiceOut, ValidDice : OUT std_logic;
        DiceValue : OUT unsigned(2 downto 0));
    END COMPONENT;
    
    COMPONENT randomNumber IS
    GENERIC( InitialSeed : INTEGER);
    PORT ( Reset : IN  std_logic;
            CSin  : IN  std_logic;
            CLKin : IN  std_logic;
            Dout  : OUT std_logic );
    END COMPONENT;

BEGIN

    requestRandom_1 : requestRandom
        PORT MAP (
            Clock => Clock,
            POR => Reset,
            req => s_req,
            Tick => Tick,
            CSin => s_CSin,
            CLKin => s_CLKin,
            doShift => s_doShift,
            done => s_done
        );
    
    ShiftToParallel_1 : ShiftToParallel
        PORT MAP (
            Clock => Clock,
            Reset => Reset,
            Din => s_Dout,
            Tick => s_doShift,
            Value => s_ShiftValue
        );
    
    DiceControl_1 : DiceControl
        PORT MAP (
            Clock => Clock,
            Reset => Reset,
            RollDiceIn => RollDice,
            Tick => Tick,
            Done => s_done,
            ShiftValue => s_ShiftValue,
            RollDiceOut => s_req,
            ValidDice => DiceRolled,
            DiceValue => DiceValue
        );

    randomNumber_1 : randomNumber
        GENERIC MAP (
            InitialSeed => InitialSeed
        )
        PORT MAP (
            Reset => Reset,
            CSin => s_CSin,
            CLKin => s_CLKin,
            Dout => s_Dout
        );

end ARCHITECTURE behavior;