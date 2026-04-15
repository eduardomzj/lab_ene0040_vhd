library IEEE;
use IEEE.std_logic_1164.all;

entity and2 is
    port (
        a : in std_logic;
        b : in std_logic;
        s : out std_logic
    );
end and2;

architecture rtl of and2 is
begin
    s <= a and b;
end rtl;
