library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk1_tb is
end jk1_tb;

architecture behavior of jk1_tb is
    -- Component Declaration
    component jk1
        port (j,k,clk : in std_logic;
              q : inout std_logic := '0';
              qbar : inout std_logic := '1');
    end component;
    
    -- Input Signals
    signal j, k : std_logic := '0';
    signal clk : std_logic := '0';
    
    -- Output Signals
    signal q, qbar : std_logic;
    
    -- Clock period definition
    constant clk_period : time := 100 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: jk1 port map (
        j => j,
        k => k,
        clk => clk,
        q => q,
        qbar => qbar
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
        -- Initialize
        wait for clk_period;
        
        -- Test Case 1: No Change (J=0, K=0)
        j <= '0';
        k <= '0';
        wait for clk_period*2;
        
        -- Test Case 2: Set (J=1, K=0)
        j <= '1';
        k <= '0';
        wait for clk_period*2;
        
        -- Test Case 3: No Change (J=0, K=0)
        j <= '0';
        k <= '0';
        wait for clk_period*2;
        
        -- Test Case 4: Reset (J=0, K=1)
        j <= '0';
        k <= '1';
        wait for clk_period*2;
        
        -- Test Case 5: Toggle (J=1, K=1)
        j <= '1';
        k <= '1';
        wait for clk_period*4;  -- Let it toggle twice
        
        -- Test Case 6: No Change (J=0, K=0)
        j <= '0';
        k <= '0';
        wait for clk_period*2;
        
        -- Test all combinations in sequence
        -- Set
        j <= '1';
        k <= '0';
        wait for clk_period;
        
        -- Hold
        j <= '0';
        k <= '0';
        wait for clk_period;
        
        -- Reset
        j <= '0';
        k <= '1';
        wait for clk_period;
        
        -- Toggle
        j <= '1';
        k <= '1';
        wait for clk_period*3;
        
        -- End simulation
        wait;
    end process;
end behavior;
