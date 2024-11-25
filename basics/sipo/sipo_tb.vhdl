library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sipo_tb is
end sipo_tb;

architecture behavior of sipo_tb is
    -- Component Declaration
    component sipo
        port(
            clk, clear : in std_logic;
            Input_Data: in std_logic;
            Q: inout std_logic_vector(3 downto 0)
        );
    end component;
    
    -- Input Signals
    signal clk : std_logic := '0';
    signal clear : std_logic := '0';
    signal Input_Data : std_logic := '0';
    
    -- Output Signal
    signal Q : std_logic_vector(3 downto 0);
    
    -- Clock period definition
    constant clk_period : time := 100 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: sipo port map (
        clk => clk,
        clear => clear,
        Input_Data => Input_Data,
        Q => Q
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
        clear <= '1';
        wait for clk_period;
        clear <= '0';
        wait for clk_period;

        -- Test Case 1: Shift in "1010"
        Input_Data <= '1';
        wait for clk_period;
        Input_Data <= '0';
        wait for clk_period;
        Input_Data <= '1';
        wait for clk_period;
        Input_Data <= '0';
        wait for clk_period;
        
        -- Hold for observation
        wait for clk_period*2;
        
        -- Test Case 2: Reset during operation
        Input_Data <= '1';
        wait for clk_period;
        clear <= '1';
        wait for clk_period;
        clear <= '0';
        
        -- Test Case 3: Shift in "1111"
        Input_Data <= '1';
        wait for clk_period*4;
        
        -- Hold for observation
        wait for clk_period*2;
        
        -- Test Case 4: Shift in "0000"
        Input_Data <= '0';
        wait for clk_period*4;
        
        -- Test Case 5: Alternating pattern
        for i in 0 to 7 loop
            Input_Data <= not Input_Data;
            wait for clk_period;
        end loop;
        
        -- Test Case 6: Quick reset test
        clear <= '1';
        wait for clk_period/2;
        clear <= '0';
        
        -- Test Case 7: Random pattern "1011"
        Input_Data <= '1';
        wait for clk_period;
        Input_Data <= '0';
        wait for clk_period;
        Input_Data <= '1';
        wait for clk_period;
        Input_Data <= '1';
        wait for clk_period;
        
        -- End simulation
        wait;
    end process;
end behavior;
