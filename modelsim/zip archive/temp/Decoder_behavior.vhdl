architecture behavior of Decoder is

    constant c_one: unsigned(2 downto 0) := "001";
    constant c_two: unsigned(2 downto 0) := "010";
    constant c_three: unsigned(2 downto 0) := "011";
    constant c_four: unsigned(2 downto 0) := "100";
    constant c_five: unsigned(2 downto 0) := "101";
    constant c_six: unsigned(2 downto 0) := "110";

    constant d_one : std_logic_vector (6 downto 0) := "1001111";
    constant d_two : std_logic_vector (6 downto 0) := "0010010";
    constant d_three : std_logic_vector (6 downto 0) := "0000110";
    constant d_four : std_logic_vector (6 downto 0) := "1001100";
    constant d_five : std_logic_vector (6 downto 0) := "0100100";
    constant d_six : std_logic_vector (6 downto 0) := "0100000";
    constant d_off : std_logic_vector (6 downto 0) := "1111111";
begin

    with pips select displ <=
        d_one when c_one,
        d_two when c_two,
        d_three when c_three,
        d_four when c_four,
        d_five when c_five,
        d_six when c_six,
        d_off when others;
    
end architecture behavior;