library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec_tb is
end dec_tb;

architecture behavior of dec_tb is
    -- Component Declaration
    component dec
        Port ( i : in STD_LOGIC_VECTOR (1 downto 0);
               o : out STD_LOGIC_VECTOR (3 downto 0);
               en : in STD_LOGIC);
    end component;
    
    -- Input Signals
    signal i : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal en : STD_LOGIC := '0';
    
    -- Output Signals
    signal o : STD_LOGIC_VECTOR (3 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: dec port map (
        i => i,
        o => o,
        en => en
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test with enable = 0
        en <= '0';
        i <= "00";
        wait for 100 ns;
        
        -- Test with enable = 1
        en <= '1';
        
        -- Test all input combinations
        i <= "00";
        wait for 100 ns;
        
        i <= "01";
        wait for 100 ns;
        
        i <= "10";
        wait for 100 ns;
        
        i <= "11";
        wait for 100 ns;
        
        -- End simulation
        wait;
    end process;
end behavior;

