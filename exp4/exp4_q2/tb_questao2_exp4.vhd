library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_questao2_exp4 is
end tb_questao2_exp4;

architecture teste of tb_questao2_exp4 is
    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';
    signal C : STD_LOGIC := '0';
    signal D : STD_LOGIC := '0';
    signal E : STD_LOGIC := '0';
    signal F : STD_LOGIC := '0';
    signal G : STD_LOGIC := '0';
    signal S : STD_LOGIC;
begin
    UUT: entity work.questao2_exp4
        port map (
            A => A,
            B => B,
            C => C,
            D => D,
            E => E,
            F => F,
            G => G,
            S => S
        );

    stimulus: process
        variable v     : STD_LOGIC_VECTOR(6 downto 0);
        variable exp_s : STD_LOGIC;
    begin
        -- Testa as 128 combinacoes de A, B, C, D, E, F e G
        for i in 0 to 127 loop
            v := STD_LOGIC_VECTOR(to_unsigned(i, 7));

            A <= v(6);
            B <= v(5);
            C <= v(4);
            D <= v(3);
            E <= v(2);
            F <= v(1);
            G <= v(0);

            -- Funcao exatamente como aparece no roteiro:
            -- S = F'.G
            --   + A.B.C.D.E'.F'.G
            --   + A'.B'.C'.D'.E'.F'.G
            --   + A.B'.C.E.F.G'
            --   + A'.B.C.D.E'.F.G'
            --   + A.B.C.D.E.F'.G'
            --   + A.B'.C'.D.E.F'.G'
            exp_s := ((not v(1)) and v(0)) or
                     (v(6) and v(5) and v(4) and v(3) and (not v(2)) and (not v(1)) and v(0)) or
                     ((not v(6)) and (not v(5)) and (not v(4)) and (not v(3)) and (not v(2)) and (not v(1)) and v(0)) or
                     (v(6) and (not v(5)) and v(4) and v(2) and v(1) and (not v(0))) or
                     ((not v(6)) and v(5) and v(4) and v(3) and (not v(2)) and v(1) and (not v(0))) or
                     (v(6) and v(5) and v(4) and v(3) and v(2) and (not v(1)) and (not v(0))) or
                     (v(6) and (not v(5)) and (not v(4)) and v(3) and v(2) and (not v(1)) and (not v(0)));

            wait for 10 ns;

            assert S = exp_s
                report "Erro na Questao 2, combinacao decimal " & integer'image(i)
                severity error;
        end loop;

        report "Questao 2: todas as 128 combinacoes testadas com sucesso." severity note;
        wait;
    end process;
end teste;
