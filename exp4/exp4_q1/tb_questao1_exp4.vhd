library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_questao1_exp4 is
end tb_questao1_exp4;

architecture teste of tb_questao1_exp4 is
    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';
    signal C : STD_LOGIC := '0';
    signal X : STD_LOGIC;
    signal Y : STD_LOGIC;
begin
    UUT: entity work.questao1_exp4
        port map (
            A => A,
            B => B,
            C => C,
            X => X,
            Y => Y
        );

    stimulus: process
        variable v     : STD_LOGIC_VECTOR(2 downto 0);
        variable exp_x : STD_LOGIC;
        variable exp_y : STD_LOGIC;
    begin
        -- Testa as 8 combinacoes de A, B e C
        for i in 0 to 7 loop
            v := STD_LOGIC_VECTOR(to_unsigned(i, 3));

            A <= v(2);
            B <= v(1);
            C <= v(0);

            exp_x := ((not v(2)) and v(1) and v(0)) or
                     (v(2) and (not v(1)) and (not v(0))) or
                     (v(2) and v(1));

            exp_y := ((not v(2)) and (not v(1))) or
                     ((not v(2)) and v(1) and (not v(0))) or
                     (v(2) and v(1) and v(0));

            wait for 20 ns;

            assert X = exp_x
                report "Erro em X na combinacao " & integer'image(i)
                severity error;

            assert Y = exp_y
                report "Erro em Y na combinacao " & integer'image(i)
                severity error;
        end loop;

        report "Questao 1: todas as combinacoes testadas com sucesso." severity note;
        wait;
    end process;
end teste;
