--==============================================================================
--== Logisim goes FPGA automatic generated VHDL code                          ==
--==                                                                          ==
--==                                                                          ==
--== Project   : golden                                                       ==
--== Component : toplevel                                                     ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE PlatformIndependent OF toplevel IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
   COMPONENT buttonlogic
      PORT ( Button                    : IN  std_logic;
             Clock                     : IN  std_logic;
             Reset                     : IN  std_logic;
             Tick                      : IN  std_logic;
             UnBlock                   : IN  std_logic;
             blk                       : OUT std_logic);
   END COMPONENT;

   COMPONENT sort
      PORT ( DiceIn1                   : IN  unsigned( 2 DOWNTO 0 );
             DiceIn2                   : IN  unsigned( 2 DOWNTO 0 );
             DiceIn3                   : IN  unsigned( 2 DOWNTO 0 );
             DiceIn4                   : IN  unsigned( 2 DOWNTO 0 );
             sort                      : IN  std_logic;
             DiceOut1                  : OUT unsigned( 2 DOWNTO 0 );
             DiceOut2                  : OUT unsigned( 2 DOWNTO 0 );
             DiceOut3                  : OUT unsigned( 2 DOWNTO 0 );
             DiceOut4                  : OUT unsigned( 2 DOWNTO 0 ));
   END COMPONENT;

   COMPONENT decoder
      PORT ( pips                      : IN  unsigned( 2 DOWNTO 0 );
             displ                     : OUT std_logic_vector( 6 DOWNTO 0 ));
   END COMPONENT;

   COMPONENT genericcounter
      GENERIC ( ReloadValue               : INTEGER;
                NrOfBits                  : INTEGER);
      PORT ( Clock                     : IN  std_logic;
             Reset                     : IN  std_logic;
             Tick                      : OUT std_logic);
   END COMPONENT;

   COMPONENT gamecontrol
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
   END COMPONENT;

   COMPONENT DiceImplementation
     GENERIC( InitialSeed               : INTEGER );
     PORT ( Clock                     : IN  std_logic;
             Reset                     : IN  std_logic;
             RollDice                  : IN  std_logic;
             Tick                      : IN  std_logic;
             DiceRolled                : OUT std_logic;
             DiceValue                 : OUT unsigned( 2 DOWNTO 0 ));
   END COMPONENT;


   -----------------------------------------------------------------------------
   -- Here all used signals are defined                                       --
   -----------------------------------------------------------------------------
   SIGNAL s_LOGISIM_BUS_0                    : unsigned( 2 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_15                   : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_39                   : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_40                   : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_47                   : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_48                   : unsigned( 2 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_55                   : std_logic_vector( 6 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_56                   : unsigned( 2 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_62                   : unsigned( 2 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_65                   : unsigned( 2 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_69                   : unsigned( 2 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_7                    : unsigned( 2 DOWNTO 0 );
   SIGNAL s_LOGISIM_BUS_78                   : unsigned( 2 DOWNTO 0 );
   SIGNAL s_LOGISIM_NET_10                   : std_logic;
   SIGNAL s_LOGISIM_NET_11                   : std_logic;
   SIGNAL s_LOGISIM_NET_13                   : std_logic;
   SIGNAL s_LOGISIM_NET_14                   : std_logic;
   SIGNAL s_LOGISIM_NET_16                   : std_logic;
   SIGNAL s_LOGISIM_NET_17                   : std_logic;
   SIGNAL s_LOGISIM_NET_18                   : std_logic;
   SIGNAL s_LOGISIM_NET_19                   : std_logic;
   SIGNAL s_LOGISIM_NET_2                    : std_logic;
   SIGNAL s_LOGISIM_NET_20                   : std_logic;
   SIGNAL s_LOGISIM_NET_23                   : std_logic;
   SIGNAL s_LOGISIM_NET_26                   : std_logic;
   SIGNAL s_LOGISIM_NET_31                   : std_logic;
   SIGNAL s_LOGISIM_NET_32                   : std_logic;
   SIGNAL s_LOGISIM_NET_33                   : std_logic;
   SIGNAL s_LOGISIM_NET_34                   : std_logic;
   SIGNAL s_LOGISIM_NET_4                    : std_logic;
   SIGNAL s_LOGISIM_NET_44                   : std_logic;
   SIGNAL s_LOGISIM_NET_46                   : std_logic;
   SIGNAL s_LOGISIM_NET_50                   : std_logic;
   SIGNAL s_LOGISIM_NET_51                   : std_logic;
   SIGNAL s_LOGISIM_NET_57                   : std_logic;
   SIGNAL s_LOGISIM_NET_59                   : std_logic;
   SIGNAL s_LOGISIM_NET_60                   : std_logic;
   SIGNAL s_LOGISIM_NET_66                   : std_logic;
   SIGNAL s_LOGISIM_NET_68                   : std_logic;
   SIGNAL s_LOGISIM_NET_70                   : std_logic;
   SIGNAL s_LOGISIM_NET_72                   : std_logic;
   SIGNAL s_LOGISIM_NET_73                   : std_logic;
   SIGNAL s_LOGISIM_NET_74                   : std_logic;
   SIGNAL s_LOGISIM_NET_75                   : std_logic;
   SIGNAL s_LOGISIM_NET_76                   : std_logic;
   SIGNAL s_LOGISIM_NET_79                   : std_logic;
   SIGNAL s_LOGISIM_NET_81                   : std_logic;
   SIGNAL s_LOGISIM_NET_82                   : std_logic;
   SIGNAL s_LOGISIM_NET_83                   : std_logic;
   SIGNAL s_LOGISIM_NET_84                   : std_logic;
   SIGNAL s_LOGISIM_NET_9                    : std_logic;

BEGIN

   -----------------------------------------------------------------------------
   -- Here all input connections are defined                                  --
   -----------------------------------------------------------------------------
   s_LOGISIM_NET_20                    <= Clock_0;
   s_LOGISIM_NET_4                     <= NOT n_Reset_0;

   -----------------------------------------------------------------------------
   -- Here all in-lined components are defined                                --
   -----------------------------------------------------------------------------
   die4_Segment_A <= s_LOGISIM_BUS_40(6);
   die4_Segment_B <= s_LOGISIM_BUS_40(5);
   die4_Segment_C <= s_LOGISIM_BUS_40(4);
   die4_Segment_D <= s_LOGISIM_BUS_40(3);
   die4_Segment_E <= s_LOGISIM_BUS_40(2);
   die4_Segment_F <= s_LOGISIM_BUS_40(1);
   die4_Segment_G <= s_LOGISIM_BUS_40(0);
   die4_DecimalPoint <= s_LOGISIM_NET_11;
   die3_Segment_A <= s_LOGISIM_BUS_55(6);
   die3_Segment_B <= s_LOGISIM_BUS_55(5);
   die3_Segment_C <= s_LOGISIM_BUS_55(4);
   die3_Segment_D <= s_LOGISIM_BUS_55(3);
   die3_Segment_E <= s_LOGISIM_BUS_55(2);
   die3_Segment_F <= s_LOGISIM_BUS_55(1);
   die3_Segment_G <= s_LOGISIM_BUS_55(0);
   die3_DecimalPoint <= s_LOGISIM_NET_19;
   die2_Segment_A <= s_LOGISIM_BUS_47(6);
   die2_Segment_B <= s_LOGISIM_BUS_47(5);
   die2_Segment_C <= s_LOGISIM_BUS_47(4);
   die2_Segment_D <= s_LOGISIM_BUS_47(3);
   die2_Segment_E <= s_LOGISIM_BUS_47(2);
   die2_Segment_F <= s_LOGISIM_BUS_47(1);
   die2_Segment_G <= s_LOGISIM_BUS_47(0);
   die2_DecimalPoint <= s_LOGISIM_NET_23;
   die1_Segment_A <= s_LOGISIM_BUS_39(6);
   die1_Segment_B <= s_LOGISIM_BUS_39(5);
   die1_Segment_C <= s_LOGISIM_BUS_39(4);
   die1_Segment_D <= s_LOGISIM_BUS_39(3);
   die1_Segment_E <= s_LOGISIM_BUS_39(2);
   die1_Segment_F <= s_LOGISIM_BUS_39(1);
   die1_Segment_G <= s_LOGISIM_BUS_39(0);
   die1_DecimalPoint <= s_LOGISIM_NET_9;
   s_LOGISIM_NET_57 <= NOT n_Block_die_1_0;
   s_LOGISIM_NET_26 <= NOT n_Block_die_2_0;
   s_LOGISIM_NET_82 <= NOT n_Block_die_3_0;
   s_LOGISIM_NET_72 <= NOT n_Block_die_4_0;
   s_LOGISIM_NET_79 <= NOT n_Mode_0;
   L1_0 <= s_LOGISIM_NET_44;
   L2_0 <= s_LOGISIM_NET_50;
   L3_0 <= s_LOGISIM_NET_68;
   L4_0 <= s_LOGISIM_NET_74;
   L5_0 <= s_LOGISIM_NET_76;
   L6_0 <= s_LOGISIM_NET_18;

   -----------------------------------------------------------------------------
   -- Here all normal components are defined                                  --
   -----------------------------------------------------------------------------
   s_LOGISIM_NET_33 <= NOT s_LOGISIM_NET_11;
   s_LOGISIM_NET_84 <= NOT s_LOGISIM_NET_9;
   s_LOGISIM_NET_75 <= NOT s_LOGISIM_NET_23;
   s_LOGISIM_NET_60 <= NOT s_LOGISIM_NET_19;
   s_LOGISIM_NET_73 <= s_LOGISIM_NET_34 AND s_LOGISIM_NET_33;
   s_LOGISIM_NET_59 <= s_LOGISIM_NET_34 AND s_LOGISIM_NET_84;
   s_LOGISIM_NET_31 <= s_LOGISIM_NET_34 AND s_LOGISIM_NET_75;
   s_LOGISIM_NET_83 <= s_LOGISIM_NET_34 AND s_LOGISIM_NET_60;
   s_LOGISIM_NET_81 <= s_LOGISIM_NET_34 AND s_LOGISIM_NET_9;
   s_LOGISIM_NET_70 <= s_LOGISIM_NET_34 AND s_LOGISIM_NET_23;
   s_LOGISIM_NET_51 <= s_LOGISIM_NET_34 AND s_LOGISIM_NET_19;
   s_LOGISIM_NET_17 <= s_LOGISIM_NET_34 AND s_LOGISIM_NET_11;
   s_LOGISIM_BUS_15(0) <= s_LOGISIM_NET_81 OR s_LOGISIM_NET_16;
   s_LOGISIM_BUS_15(1) <= s_LOGISIM_NET_70 OR s_LOGISIM_NET_66;
   s_LOGISIM_BUS_15(2) <= s_LOGISIM_NET_51 OR s_LOGISIM_NET_46;
   s_LOGISIM_BUS_15(3) <= s_LOGISIM_NET_17 OR s_LOGISIM_NET_2;

   VHDL_1 : buttonlogic
      PORT MAP ( Button                             => s_LOGISIM_NET_57,
                 Clock                              => s_LOGISIM_NET_20,
                 Reset                              => s_LOGISIM_NET_4,
                 Tick                               => s_LOGISIM_NET_10,
                 UnBlock                            => s_LOGISIM_NET_13,
                 blk                                => s_LOGISIM_NET_9);

   VHDL_2 : buttonlogic
      PORT MAP ( Button                             => s_LOGISIM_NET_26,
                 Clock                              => s_LOGISIM_NET_20,
                 Reset                              => s_LOGISIM_NET_4,
                 Tick                               => s_LOGISIM_NET_10,
                 UnBlock                            => s_LOGISIM_NET_13,
                 blk                                => s_LOGISIM_NET_23);

   VHDL_3 : buttonlogic
      PORT MAP ( Button                             => s_LOGISIM_NET_82,
                 Clock                              => s_LOGISIM_NET_20,
                 Reset                              => s_LOGISIM_NET_4,
                 Tick                               => s_LOGISIM_NET_10,
                 UnBlock                            => s_LOGISIM_NET_13,
                 blk                                => s_LOGISIM_NET_19);

   VHDL_4 : buttonlogic
      PORT MAP ( Button                             => s_LOGISIM_NET_72,
                 Clock                              => s_LOGISIM_NET_20,
                 Reset                              => s_LOGISIM_NET_4,
                 Tick                               => s_LOGISIM_NET_10,
                 UnBlock                            => s_LOGISIM_NET_13,
                 blk                                => s_LOGISIM_NET_11);

   VHDL_5 : sort
      PORT MAP ( DiceIn1                            => s_LOGISIM_BUS_0(2 DOWNTO 0),
                 DiceIn2                            => s_LOGISIM_BUS_48(2 DOWNTO 0),
                 DiceIn3                            => s_LOGISIM_BUS_7(2 DOWNTO 0),
                 DiceIn4                            => s_LOGISIM_BUS_56(2 DOWNTO 0),
                 DiceOut1                           => s_LOGISIM_BUS_65(2 DOWNTO 0),
                 DiceOut2                           => s_LOGISIM_BUS_62(2 DOWNTO 0),
                 DiceOut3                           => s_LOGISIM_BUS_69(2 DOWNTO 0),
                 DiceOut4                           => s_LOGISIM_BUS_78(2 DOWNTO 0),
                 sort                               => s_LOGISIM_NET_14);

   VHDL_6 : decoder
      PORT MAP ( displ                              => s_LOGISIM_BUS_39(6 DOWNTO 0),
                 pips                               => s_LOGISIM_BUS_65(2 DOWNTO 0));

   VHDL_7 : decoder
      PORT MAP ( displ                              => s_LOGISIM_BUS_47(6 DOWNTO 0),
                 pips                               => s_LOGISIM_BUS_62(2 DOWNTO 0));

   VHDL_8 : decoder
      PORT MAP ( displ                              => s_LOGISIM_BUS_55(6 DOWNTO 0),
                 pips                               => s_LOGISIM_BUS_69(2 DOWNTO 0));

   VHDL_9 : decoder
      PORT MAP ( displ                              => s_LOGISIM_BUS_40(6 DOWNTO 0),
                 pips                               => s_LOGISIM_BUS_78(2 DOWNTO 0));

   VHDL_10 : genericcounter
      GENERIC MAP ( NrOfBits                           => 17,
                    ReloadValue                        => 93750)
      PORT MAP ( Clock                              => s_LOGISIM_NET_20,
                 Reset                              => s_LOGISIM_NET_4,
                 Tick                               => s_LOGISIM_NET_10);

   VHDL_11 : gamecontrol
      PORT MAP ( Button                             => s_LOGISIM_NET_32,
                 Clock                              => s_LOGISIM_NET_20,
                 DiceRolled1                        => s_LOGISIM_BUS_15(0),
                 DiceRolled2                        => s_LOGISIM_BUS_15(1),
                 DiceRolled3                        => s_LOGISIM_BUS_15(2),
                 DiceRolled4                        => s_LOGISIM_BUS_15(3),
                 ReadyForRole                       => s_LOGISIM_NET_44,
                 Reset                              => s_LOGISIM_NET_4,
                 Role1                              => s_LOGISIM_NET_50,
                 Role2                              => s_LOGISIM_NET_74,
                 Role3                              => s_LOGISIM_NET_18,
                 RollDice                           => s_LOGISIM_NET_34,
                 SelectBlock1                       => s_LOGISIM_NET_68,
                 SelectBlock2                       => s_LOGISIM_NET_76,
                 SortDice                           => s_LOGISIM_NET_14,
                 UnblockDice                        => s_LOGISIM_NET_13);

   VHDL_12 : buttonlogic
      PORT MAP ( Button                             => s_LOGISIM_NET_79,
                 Clock                              => s_LOGISIM_NET_20,
                 Reset                              => s_LOGISIM_NET_4,
                 Tick                               => s_LOGISIM_NET_10,
                 UnBlock                            => s_LOGISIM_NET_32,
                 blk                                => s_LOGISIM_NET_32);


   -----------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                       --
   -----------------------------------------------------------------------------
   DiceImplementation_1 : DiceImplementation
      GENERIC MAP( InitialSeed => 25 )
      PORT MAP ( Clock                              => s_LOGISIM_NET_20,
                 DiceRolled                         => s_LOGISIM_NET_16,
                 DiceValue                          => s_LOGISIM_BUS_0(2 DOWNTO 0),
                 Reset                              => s_LOGISIM_NET_4,
                 RollDice                           => s_LOGISIM_NET_59,
                 Tick                               => s_LOGISIM_NET_10);

   DiceImplementation_2 : DiceImplementation
      GENERIC MAP( InitialSeed => -25 )
      PORT MAP ( Clock                              => s_LOGISIM_NET_20,
                 DiceRolled                         => s_LOGISIM_NET_66,
                 DiceValue                          => s_LOGISIM_BUS_48(2 DOWNTO 0),
                 Reset                              => s_LOGISIM_NET_4,
                 RollDice                           => s_LOGISIM_NET_31,
                 Tick                               => s_LOGISIM_NET_10);

   DiceImplementation_3 : DiceImplementation
      GENERIC MAP( InitialSeed => 123456 )
      PORT MAP ( Clock                              => s_LOGISIM_NET_20,
                 DiceRolled                         => s_LOGISIM_NET_46,
                 DiceValue                          => s_LOGISIM_BUS_7(2 DOWNTO 0),
                 Reset                              => s_LOGISIM_NET_4,
                 RollDice                           => s_LOGISIM_NET_83,
                 Tick                               => s_LOGISIM_NET_10);

   DiceImplementation_4 : DiceImplementation
      GENERIC MAP( InitialSeed => 765432 )
      PORT MAP ( Clock                              => s_LOGISIM_NET_20,
                 DiceRolled                         => s_LOGISIM_NET_2,
                 DiceValue                          => s_LOGISIM_BUS_56(2 DOWNTO 0),
                 Reset                              => s_LOGISIM_NET_4,
                 RollDice                           => s_LOGISIM_NET_73,
                 Tick                               => s_LOGISIM_NET_10);


END PlatformIndependent;
