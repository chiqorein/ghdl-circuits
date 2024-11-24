library IEEE;
use IEEE.std_logic_1164.all;

entity siso is
    Port (d,clk,clear : in std_logic; q : inout std_logic);
end siso;

architecture behav of siso is
    signal x : std_logic_vector(3 downto 0) := "0000";
begin
    process(x,clk,clear)
    begin
        if (clear = '1') then
            q <= '0';
            x <= "0000";
        elsif (rising_edge(clk)) then
            x(0) <= d;
            for i in 0 to 2 loop
                x(i+1) <= x(i);
            end loop;
            q <= x(3);
        else 
            q <= q;
        end if;
    end process;
end behav;
