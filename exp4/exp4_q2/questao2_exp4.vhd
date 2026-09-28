library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity questao2_exp4 is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        C : in STD_LOGIC;
        D : in STD_LOGIC;
        E : in STD_LOGIC;
        F : in STD_LOGIC;
        G : in STD_LOGIC;
        S : out STD_LOGIC
    );
end questao2_exp4;

architecture estrutural of questao2_exp4 is
    component decoder4x16
        port (
            A : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component mux8x1
        port (
            S : in STD_LOGIC_VECTOR(2 downto 0);
            D : in STD_LOGIC_VECTOR(7 downto 0);
            Y : out STD_LOGIC
        );
    end component;

    signal entrada_decoder : STD_LOGIC_VECTOR(3 downto 0);
    signal saida_decoder   : STD_LOGIC_VECTOR(15 downto 0);
    signal selecao_mux     : STD_LOGIC_VECTOR(2 downto 0);
    signal entrada_mux     : STD_LOGIC_VECTOR(7 downto 0);

    signal ou_d2 : STD_LOGIC;
    signal ou_d4 : STD_LOGIC;
    signal ou_d6 : STD_LOGIC;
begin
    -- ABCD alimenta o decodificador; EFG seleciona o MUX, como pede o roteiro
    entrada_decoder <= A & B & C & D;
    selecao_mux <= E & F & G;

    DEC: decoder4x16
        port map (
            A => entrada_decoder,
            Y => saida_decoder
        );

    -- Tres portas OU.
    -- A expressao do roteiro possui F'.G, o que torna os termos de EFG=001
    -- redundantes. Por isso, a terceira OU abaixo funciona como passagem logica.
    ou_d2 <= saida_decoder(7) or '0';
    ou_d4 <= saida_decoder(9) or saida_decoder(15);
    ou_d6 <= saida_decoder(10) or saida_decoder(11);

    -- Decomposicao usando EFG como selecao:
    -- EFG=000 -> 0
    -- EFG=001 -> 1          (F'.G)
    -- EFG=010 -> m7         (A'.B.C.D)
    -- EFG=011 -> 0
    -- EFG=100 -> m9 + m15
    -- EFG=101 -> 1          (F'.G)
    -- EFG=110 -> m10 + m11  (A.B'.C, independente de D)
    -- EFG=111 -> 0
    entrada_mux(0) <= '0';
    entrada_mux(1) <= '1';
    entrada_mux(2) <= ou_d2;
    entrada_mux(3) <= '0';
    entrada_mux(4) <= ou_d4;
    entrada_mux(5) <= '1';
    entrada_mux(6) <= ou_d6;
    entrada_mux(7) <= '0';

    MUX: mux8x1
        port map (
            S => selecao_mux,
            D => entrada_mux,
            Y => S
        );
end estrutural;
