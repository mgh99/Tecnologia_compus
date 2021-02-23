-- **********************************************
-- tb_FSM.vhd : Finite State Machine (Testbench)
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
-- Testbench Entity
entity tb_FSM is
end tb_FSM;

-- **********************************************
-- ARCHITECTURE
-- **********************************************
architecture Behavioral of tb_FSM is
    -- Define FSM Component
    component FSM is
	    port( CLK : in  std_logic;      -- Clock
	          RST : in  std_logic;      -- Reset
	          L   : in  std_logic;      -- Left Button
	          R   : in  std_logic;      -- Right Button
	          Z   : out std_logic       -- Output
	    );
	end component;
    
    -- Define Signals
    signal CLK, RST, L, R, Z : std_logic;
begin
    -- Instantiate Component
    DUT : FSM port map(
        CLK => CLK,
        RST => RST,
        L   => L,
        R   => R,
        Z   => Z
    );
    
    -- Create Input Stimuli Process
    process begin
        L <= '0'; R <= '1'; wait for 50 ns;
        L <= '1'; R <= '0'; wait for 10 ns;
        L <= '0'; R <= '1'; wait for 10 ns;
        L <= '1'; R <= '0'; wait;
    end process;
    
    -- Reset Process
    process begin
        RST <= '0'; wait for 10 ns;
        RST <= '1'; wait for 15 ns;
        RST <= '0'; wait;
    end process;
    
    -- Clock Process
    process begin
        CLK <= '0'; wait for 5 ns;
        CLK <= '1'; wait for 5 ns;
    end process;
end Behavioral;
