library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_mux8x1 is
end tb_mux8x1;

architecture test of tb_mux8x1 is

    signal S : STD_LOGIC_VECTOR(2 downto 0);
    signal D : STD_LOGIC_VECTOR(7 downto 0);
    signal Y : STD_LOGIC;

begin

    uut: entity work.mux8x1
        port map (
            S => S,
            D => D,
            Y => Y
        );

    stimulus: process
    begin
        -- D(7 downto 0) = 10101010
        -- Assim, ao variar S, Y alterna entre 0 e 1.
        D <= "10101010";

        for i in 0 to 7 loop
            S <= std_logic_vector(to_unsigned(i, 3));
            wait for 20 ns;
        end loop;

        wait;
    end process;

end test;
