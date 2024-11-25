library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4to1_tb is
end mux4to1_tb;

architecture behavior of mux4to1_tb is
    -- Component Declaration
    component mux4to1
        port ( w0, w1, w2, w3 : in std_logic;
               s : in std_logic_vector(1 downto 0);
               f : out std_logic );
    end component;
    
    -- Input Signals
    signal w0, w1, w2, w3 : std_logic := '0';
    signal s : std_logic_vector(1 downto 0) := "00";
    
    -- Output Signal
    signal f : std_logic;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: mux4to1 port map (
        w0 => w0,
        w1 => w1,
        w2 => w2,
        w3 => w3,
        s => s,
        f => f
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test Case 1: Select w0 (s = "00")
        w0 <= '1'; w1 <= '0'; w2 <= '0'; w3 <= '0';
        s <= "00";
        wait for 100 ns;
        
        -- Test Case 2: Select w1 (s = "01")
        w0 <= '0'; w1 <= '1'; w2 <= '0'; w3 <= '0';
        s <= "01";
        wait for 100 ns;
        
        -- Test Case 3: Select w2 (s = "10")
        w0 <= '0'; w1 <= '0'; w2 <= '1'; w3 <= '0';
        s <= "10";
        wait for 100 ns;
        
        -- Test Case 4: Select w3 (s = "11")
        w0 <= '0'; w1 <= '0'; w2 <= '0'; w3 <= '1';
        s <= "11";
        wait for 100 ns;
        
        -- Test Case 5: All inputs high
        w0 <= '1'; w1 <= '1'; w2 <= '1'; w3 <= '1';
        -- Test all select combinations
        s <= "00";
        wait for 100 ns;
        s <= "01";
        wait for 100 ns;
        s <= "10";
        wait for 100 ns;
        s <= "11";
        wait for 100 ns;
        
        -- End simulation
        wait;
    end process;
end behavior;
