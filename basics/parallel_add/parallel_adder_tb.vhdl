library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity parallel_adder_tb is
end parallel_adder_tb;

architecture behavior of parallel_adder_tb is
    -- Component Declaration
    component parallel_adder
        port ( a,b : in std_logic_vector (3 downto 0);
               cin : in std_logic;
               o : out std_logic_vector (4 downto 0));
    end component;
    
    -- Input Signals
    signal a, b : std_logic_vector(3 downto 0) := (others => '0');
    signal cin : std_logic := '0';
    
    -- Output Signal
    signal o : std_logic_vector(4 downto 0);
    
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: parallel_adder port map (
        a => a,
        b => b,
        cin => cin,
        o => o
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test Case 1: Simple addition without carry
        a <= "0001"; -- 1
        b <= "0010"; -- 2
        cin <= '0';
        wait for 100 ns;
        
        -- Test Case 2: Addition with carry in
        a <= "0001"; -- 1
        b <= "0010"; -- 2
        cin <= '1';  -- +1
        wait for 100 ns;
        
        -- Test Case 3: Addition resulting in carry out
        a <= "1111"; -- 15
        b <= "0001"; -- 1
        cin <= '0';
        wait for 100 ns;
        
        -- Test Case 4: Maximum value addition
        a <= "1111"; -- 15
        b <= "1111"; -- 15
        cin <= '1';  -- +1
        wait for 100 ns;
        
        -- Test Case 5: Zero addition
        a <= "0000";
        b <= "0000";
        cin <= '0';
        wait for 100 ns;
        
        -- Test Case 6: Random values
        a <= "1010"; -- 10
        b <= "0101"; -- 5
        cin <= '1';  -- +1
        wait for 100 ns;
        
        -- Additional test cases with varying inputs
        for i in 0 to 3 loop
            a <= std_logic_vector(to_unsigned(i, 4));
            b <= std_logic_vector(to_unsigned(i*2, 4));
            cin <= '0';
            wait for 100 ns;
            cin <= '1';
            wait for 100 ns;
        end loop;
        
        -- End simulation
        wait;
    end process;
end behavior;
