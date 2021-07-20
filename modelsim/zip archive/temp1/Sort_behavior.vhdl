architecture behavior of Sort is

    SIGNAL s_DiceOut1_cell, s_DiceOut2_cell, s_DiceOut3_cell, s_DiceOut4_cell : unsigned(2 downto 0);

    SIGNAL s_Sleft, s_Bleft, s_Sright, s_Bright : unsigned(2 downto 0);

    SIGNAL s_SMidLeft, s_SMidRight : unsigned(2 downto 0);

begin
    
    DiceOut4 <= DiceIn4 when sort = '0' else s_DiceOut4_cell;
    DiceOut3 <= DiceIn3 when sort = '0' else s_DiceOut3_cell;
    DiceOut2 <= DiceIn2 when sort = '0' else s_DiceOut2_cell;
    DiceOut1 <= DiceIn1 when sort = '0' else s_DiceOut1_cell;

    s_Bleft <= DiceIn4 when (DiceIn4 > DiceIn3) else DiceIn3;
    s_Sleft <= DiceIn3 when (DiceIn4 > DiceIn3) else DiceIn4;

    s_Bright <= DiceIn2 when (DiceIn2 > DiceIn1) else DiceIn1;
    s_Sright <= DiceIn1 when (DiceIn2 > DiceIn1) else DiceIn2;

    s_DiceOut4_cell <= s_Bleft when (s_Bleft > s_Bright) else s_Bright;
    s_SMidLeft <= s_Bright when (s_Bleft > s_Bright) else s_Bleft;
    s_SMidRight <= s_Sleft when (s_Sright < s_Sleft) else s_Sright;
    s_DiceOut1_cell <= s_Sright when (s_Sright < s_Sleft) else s_Sleft;

    s_DiceOut3_cell <= s_SMidLeft when (s_SMidLeft > s_SMidRight) else s_SMidRight;
    s_DiceOut2_cell <= s_SMidRight when (s_SMidLeft > s_SMidRight) else s_SMidLeft;

end architecture behavior;