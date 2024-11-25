library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4to1 is
port ( w0, w1, w2, w3 : in std_logic;
       s : in std_logic_vector(1 downto 0);
       f : out std_logic );
end mux4to1;

architecture behavior of mux4to1 is
begin
    process(s,w0,w1,w2,w3)
    begin
        case s is
            when "00" => f <= w0;
            when "01" => f <= w1;
            when "10" => f <= w2;
            when others => f <= w3;
        end case;
    end process;
end behavior;
