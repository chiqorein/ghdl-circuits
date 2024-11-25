library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parallel_adder is
    port ( a,b : in std_logic_vector (3 downto 0);
           cin : in std_logic;
           o : out std_logic_vector (4 downto 0));
end parallel_adder;

architecture behavior of parallel_adder is
begin
    process(a,b,cin)
        variable c : std_logic;
    begin
        c := cin;
        for i in 0 to 3 loop
            o(i) <= a(i) xor b(i) xor c;
            c := (a(i) and b(i)) or (a(i) and c) or (b(i) and c);
        end loop;
        o(4) <= c;
    end process;
end behavior;
