library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity updown_count_tb is
end updown_count_tb;

architecture behavior of updown_count_tb is
    -- Component Declaration
    component updown_count
        Port ( clk,rst,updown : in STD_LOGIC;
               count : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    -- Inputs
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal updown : std_logic := '0';
    
    -- Outputs
    signal count : std_logic_vector(3 downto 0);
    
    -- Clock period definition
    constant clk_period : time := 10 ns;
    
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: updown_count PORT MAP (
        clk => clk,
        rst => rst,
        updown => updown,
        count => count
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
        -- Reset
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        
        -- Count up
        updown <= '0';
        wait for 160 ns;
        
        -- Count down
        updown <= '1';
        wait for 160 ns;
        
        -- Reset again
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        
        wait;
    end process;
end behavior;
