library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity questao1_exp4 is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        C : in STD_LOGIC;
        X : out STD_LOGIC;
        Y : out STD_LOGIC
    );
end questao1_exp4;

architecture estrutural of questao1_exp4 is
    component mux_4x1
        Port (
            S : in STD_LOGIC_VECTOR(1 downto 0);
            D : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC
        );
    end component;

    signal sel   : STD_LOGIC_VECTOR(1 downto 0);
    signal dx    : STD_LOGIC_VECTOR(3 downto 0);
    signal dy    : STD_LOGIC_VECTOR(3 downto 0);
    signal c_bar : STD_LOGIC;
begin
    -- Unica porta inversora pedida no roteiro
    c_bar <= not C;

    -- A e B sao os seletores dos dois MUX 4x1
    sel <= A & B;

    -- X = A'.B.C + A.B'.C' + A.B
    -- AB=00 -> 0; AB=01 -> C; AB=10 -> C'; AB=11 -> 1
    dx(0) <= '0';
    dx(1) <= C;
    dx(2) <= c_bar;
    dx(3) <= '1';

    -- Y = A'.B' + A'.B.C' + A.B.C
    -- AB=00 -> 1; AB=01 -> C'; AB=10 -> 0; AB=11 -> C
    dy(0) <= '1';
    dy(1) <= c_bar;
    dy(2) <= '0';
    dy(3) <= C;

    MUX_X: mux_4x1
        port map (
            S => sel,
            D => dx,
            Y => X
        );

    MUX_Y: mux_4x1
        port map (
            S => sel,
            D => dy,
            Y => Y
        );
end estrutural;
