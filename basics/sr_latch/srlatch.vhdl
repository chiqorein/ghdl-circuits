library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity srlatch is
    port(r,s : in std_logic;
         q,qbar : out std_logic);
end srlatch;

architecture behav of srlatch is
begin
    process (s,r)
        variable s1: std_logic := '0';
        variable r1: std_logic := '1';
    begin
        s1 := s nand r1;
        r1 := r nand s1;
        q <= s1;
        qbar <= r1;
    end process;
end behav;
