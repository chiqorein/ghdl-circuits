library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity piso is
    port (clk, clr, en : in std_logic;
          pin : in std_logic_vector(3 downto 0);
          q : inout std_logic);
end piso;

architecture behav of piso is
    signal q1 : std_logic_vector(3 downto 0) := "0000";
begin
    process(clk, clr, q1, pin, en)
    begin
        if (clr = '1') then
            q <= '0';
            q1 <= "0000";
        elsif (clk = '1' and clk'event) then
            q1(3) <= pin(3);
            for i in 2 downto 0 loop
                if (en = '0') then
                    q1(i) <= q1(i+1);
                else 
                    q1(i) <= pin(i);
                end if;
            end loop;
            q <= q1(0);
        else 
            q <= q;
        end if;
    end process;
end behav;
