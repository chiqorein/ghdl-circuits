library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity srlatch_tb is
end srlatch_tb;

architecture behavior of srlatch_tb is
    -- Component Declaration
    component srlatch
        port(r,s : in std_logic;
             q,qbar : out std_logic);
    end component;
    
    -- Input Signals
    signal r : std_logic := '1';
    signal s : std_logic := '1';
    
    -- Output Signals
    signal q, qbar : std_logic;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: srlatch port map (
        r => r,
        s => s,
        q => q,
        qbar => qbar
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Initial state (No change) S=1, R=1
        s <= '1';
        r <= '1';
        wait for 100 ns;
        
        -- Set state (S=0, R=1)
        s <= '0';
        r <= '1';
        wait for 100 ns;
        
        -- Hold state (S=1, R=1)
        s <= '1';
        r <= '1';
        wait for 100 ns;
        
        -- Reset state (S=1, R=0)
        s <= '1';
        r <= '0';
        wait for 100 ns;
        
        -- Hold state (S=1, R=1)
        s <= '1';
        r <= '1';
        wait for 100 ns;
        
        -- Invalid state (S=0, R=0)
        s <= '0';
        r <= '0';
        wait for 100 ns;
        
        -- Return to hold state (S=1, R=1)
        s <= '1';
        r <= '1';
        wait for 100 ns;
        
        -- Test sequence
        -- Set
        s <= '0';
        r <= '1';
        wait for 50 ns;
        
        -- Hold
        s <= '1';
        r <= '1';
        wait for 50 ns;
        
        -- Reset
        s <= '1';
        r <= '0';
        wait for 50 ns;
        
        -- Hold
        s <= '1';
        r <= '1';
        wait for 50 ns;
        
        -- End simulation
        wait;
    end process;
end behavior;
