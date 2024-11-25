library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk1 is
    port (j,k,clk : in std_logic;
          q : inout std_logic := '0';
          qbar : inout std_logic := '1');
end jk1;

architecture behav of jk1 is
begin
    process (j,k,clk)
        variable s1,r1: std_logic;
    begin
        s1 := '0';
        r1 := '1';
        if (clk = '1' and clk'event) then
            s1 := (j and qbar) or (not(k) and q);
            r1 := not(s1);
            q <= s1;
            qbar <= r1;
        else
            q <= q;
            qbar <= qbar;
        end if;
    end process;
end behav;
