library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux_4x1 is
end tb_mux_4x1;

architecture teste of tb_mux_4x1 is

    component mux_4x1
        Port (
            S : in  STD_LOGIC_VECTOR(1 downto 0);
            D : in  STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC
        );
    end component;

    signal S : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal D : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Y : STD_LOGIC;

begin

    uut: mux_4x1
        port map (
            S => S,
            D => D,
            Y => Y
        );

    process
    begin
        D <= "0001"; S <= "00"; wait for 20 ns;
        D <= "0010"; S <= "01"; wait for 20 ns;
        D <= "0100"; S <= "10"; wait for 20 ns;
        D <= "1000"; S <= "11"; wait for 20 ns;
        wait;
    end process;

end teste;
