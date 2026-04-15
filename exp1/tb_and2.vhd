entity testbench1 is end;

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

architecture tb_and2 of testbench1 is

signal entrada1 : std_logic;
signal entrada2 : std_logic;
signal saida_tb : std_logic;

begin

and1: entity work.and2
port map (
    a => entrada1,
    b => entrada2,
    s => saida_tb
);

estimulo : process
begin
    wait for 5 ns; entrada1 <= '0'; entrada2 <= '0';
    wait for 5 ns; entrada1 <= '1';
    wait for 5 ns; entrada2 <= '1';
    wait for 5 ns; entrada1 <= '0';
    wait;
end process estimulo;

end tb_and2;
