library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_decoder4x16 is
end tb_decoder4x16;

architecture test of tb_decoder4x16 is

    signal A : STD_LOGIC_VECTOR(3 downto 0);
    signal Y : STD_LOGIC_VECTOR(15 downto 0);

begin

    uut: entity work.decoder4x16
        port map (
            A => A,
            Y => Y
        );

    stimulus: process
    begin
        for i in 0 to 15 loop
            A <= std_logic_vector(to_unsigned(i, 4));
            wait for 20 ns;
        end loop;

        wait;
    end process;

end test;
