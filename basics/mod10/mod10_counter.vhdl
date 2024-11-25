library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mod10_counter is
    port(
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        dout : out STD_LOGIC_VECTOR(3 downto 0)
    );
end mod10_counter;

architecture behav of mod10_counter is
begin
    counter : process (clk, reset) is
        variable m : integer range 0 to 15 := 0;
    begin
        if (reset = '1') then
            m := 0;
        elsif (rising_edge(clk)) then
            if (m = 9) then
                m := 0;
            else
                m := m + 1;
            end if;
        end if;
        dout <= std_logic_vector(to_unsigned(m, 4));
    end process counter;
end behav;

