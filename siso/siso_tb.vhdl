library IEEE;
use IEEE.std_logic_1164.all;

entity siso_tb is
end siso_tb;

architecture behavior of siso_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component siso
        Port (d,clk,clear : in std_logic; q : inout std_logic);
    end component;
    
    -- Inputs
    signal d : std_logic := '0';
    signal clk : std_logic := '0';
    signal clear : std_logic := '0';
    
    -- BiDirs
    signal q : std_logic;
    
    -- Clock period definitions
    constant clk_period : time := 10 ns;
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: siso PORT MAP (
        d => d,
        clk => clk,
        clear => clear,
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
        wait for 10 ns;
        wait for clk_period*1;
        -- Initialize
        d <= '1', '0' after 30 ns, '1' after 50 ns, '0' after 90 ns;
        clear <= '1', '0' after 10 ns;
        wait;
        end process;
end;
