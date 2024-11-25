library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mod10_counter_tb is
end mod10_counter_tb;

architecture behav of mod10_counter_tb is
    -- Component Declaration
    component mod10_counter is
        port(
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            dout : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    
    -- Signals
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal dout : std_logic_vector(3 downto 0);
    
    -- Clock period definition
    constant clk_period : time := 10 ns;
    
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: mod10_counter port map (
        clk => clk,
        reset => reset,
        dout => dout
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
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        
        -- Let it count for a while (enough to see multiple cycles)
        wait for 200 ns;
        
        -- Reset again to verify reset functionality
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        
        -- Let it count again
        wait for 100 ns;
        
        wait;
    end process;
end behav;
