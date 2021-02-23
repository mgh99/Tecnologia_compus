-- **********************************************
-- tb_flipflopD.vhd : D Flip-flop (Testbench)
--
-- Prof. Dr. Luis A. Aranda
--
-- Universidad Nebrija
--
-- **********************************************
-- LIBRARIES
-- **********************************************
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- **********************************************
-- ENTITY
-- **********************************************
entity tb_flipflopD is
end tb_flipflopD;

-- **********************************************
-- ARCHITECTURE
-- **********************************************
architecture Behavioral of tb_flipflopD is
    -- Define Flipflop D Component
    component flipflopD is
        port( CLK : in  std_logic;    		 -- Clock
              RST : in  std_logic;           -- Reset
              D   : in  std_logic;           -- Input
              Q   : out std_logic            -- Output
        );
    end component;
    
    -- Define Signals
    signal CLK, RST, D, Q : std_logic;
begin
    -- Instantiate Component
    DUT : flipflopD port map(
        CLK => CLK,
        RST => RST,
        D   => D,
        Q   => Q
    );
    
    -- Create Input Stimuli Process
    process begin
        D <= '0'; wait for 10 ns;
        D <= '1'; wait for 40 ns;
        D <= '0'; wait for 30 ns;
        D <= '1'; wait;
    end process;
    
    -- Reset Process
    process begin
        RST <= '0'; wait for  5 ns;
        RST <= '1'; wait for 10 ns;
        RST <= '0'; wait;
    end process;
    
    -- Clock Process
    process begin
        CLK <= '0'; wait for 5 ns;
        CLK <= '1'; wait for 5 ns;
    end process;
end Behavioral;
