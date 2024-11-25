library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity piso_tb is
end piso_tb;

architecture behavior of piso_tb is
    -- Component Declaration
    component piso
        port (clk, clr, en : in std_logic;
              pin : in std_logic_vector(3 downto 0);
              q : inout std_logic);
    end component;
    
    -- Input Signals
    signal clk : std_logic := '0';
    signal clr : std_logic := '0';
    signal en : std_logic := '1';  -- Start with parallel load enabled
    signal pin : std_logic_vector(3 downto 0) := "0000";
    
    -- Output Signal
    signal q : std_logic;
    
    -- Clock period definition
    constant clk_period : time := 100 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: piso port map (
        clk => clk,
        clr => clr,
        en => en,
        pin => pin,
        q => q
    );

    -- Clock process
    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initial reset
        clr <= '1';
        wait for clk_period*2;
        clr <= '0';
        wait for clk_period;

        -- Test Case 1: Load and shift "1010"
        pin <= "1010";
        en <= '1';  -- Enable parallel load
        wait for clk_period;
        en <= '0';  -- Start shifting
        wait for clk_period*4;  -- Wait for complete shift out
        
        -- Test Case 2: Load and shift "1111"
        pin <= "1111";
        en <= '1';  -- Enable parallel load
        wait for clk_period;
        en <= '0';  -- Start shifting
        wait for clk_period*4;  -- Wait for complete shift out
        
        -- Test Case 3: Clear during operation
        pin <= "1100";
        en <= '1';
        wait for clk_period;
        en <= '0';
        wait for clk_period;
        clr <= '1';  -- Clear during shifting
        wait for clk_period;
        clr <= '0';
        wait for clk_period*2;
        
        -- Test Case 4: Load and shift "0101"
        pin <= "0101";
        en <= '1';
        wait for clk_period;
        en <= '0';
        wait for clk_period*4;
        
        -- Test Case 5: Change parallel input during shifting
        pin <= "1001";
        en <= '1';
        wait for clk_period;
        en <= '0';
        wait for clk_period;
        pin <= "0110";  -- Change input during shifting (should not affect output)
        wait for clk_period*3;
        
        -- Test Case 6: Multiple load-shift operations
        for i in 0 to 1 loop
            pin <= "1010";
            en <= '1';
            wait for clk_period;
            en <= '0';
            wait for clk_period*2;
            pin <= "0101";
            en <= '1';
            wait for clk_period;
            en <= '0';
            wait for clk_period*2;
        end loop;
        
        -- End simulation
        wait;
    end process;
end behavior;

