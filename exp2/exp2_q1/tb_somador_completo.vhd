library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_somador_completo is
end tb_somador_completo;

architecture sim of tb_somador_completo is

    component somador_completo
        port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Cin  : in  STD_LOGIC;
            S    : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component;

    signal A_tb, B_tb, Cin_tb : STD_LOGIC := '0';
    signal S_tb, Cout_tb      : STD_LOGIC;

begin

    uut: somador_completo
        port map (
            A    => A_tb,
            B    => B_tb,
            Cin  => Cin_tb,
            S    => S_tb,
            Cout => Cout_tb
        );

    stim_proc: process
    begin
        A_tb <= '0'; B_tb <= '0'; Cin_tb <= '0'; wait for 10 ns;
        A_tb <= '0'; B_tb <= '0'; Cin_tb <= '1'; wait for 10 ns;
        A_tb <= '0'; B_tb <= '1'; Cin_tb <= '0'; wait for 10 ns;
        A_tb <= '0'; B_tb <= '1'; Cin_tb <= '1'; wait for 10 ns;
        A_tb <= '1'; B_tb <= '0'; Cin_tb <= '0'; wait for 10 ns;
        A_tb <= '1'; B_tb <= '0'; Cin_tb <= '1'; wait for 10 ns;
        A_tb <= '1'; B_tb <= '1'; Cin_tb <= '0'; wait for 10 ns;
        A_tb <= '1'; B_tb <= '1'; Cin_tb <= '1'; wait for 10 ns;

        wait;
    end process;

end sim;
