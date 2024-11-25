library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec is
    Port ( i : in STD_LOGIC_VECTOR (1 downto 0);
           o : out STD_LOGIC_VECTOR (3 downto 0);
           en : in STD_LOGIC);
end dec;

architecture Behavioral of dec is
begin
    process (en,i)
    begin
        if (en = '1') then
            if ( i = "00" ) then
                o <= "0001";
            elsif (i = "01") then
                o <= "0010";
            elsif (i = "10") then
                o <= "0100";
            else 
                o <= "1000";
            end if;
        else 
            o <= "0000";
        end if;
    end process;
end Behavioral;
