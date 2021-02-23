-- **********************************************
-- tb_simpleFunction.vhd : Simple Boolean Function (Testbench)
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
entity tb_simpleFunction is
end tb_simpleFunction;

-- **********************************************
-- ARCHITECTURE
-- **********************************************
architecture Behavior of tb_simpleFunction is
    -- Define Component
    component simpleFunction
        port( A, B, C : in  std_logic;
              Y       : out std_logic
        );
    end component;
    
    -- Declare Signals
    signal A, B, C, Y : std_logic;
begin
    -- Instantiate Device Under Test (DUT)
    DUT : simpleFunction port map(
        A => A,
        B => B,
        C => C,
        Y => Y
    );

    -- Stimuli Process
    process begin
        A <= '0'; B <= '0'; C <= '0'; wait for 10 ns;
        A <= '0'; B <= '0'; C <= '1'; wait for 10 ns;
        A <= '0'; B <= '1'; C <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; C <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; C <= '0'; wait for 10 ns;
        A <= '1'; B <= '0'; C <= '1'; wait for 10 ns;
        A <= '1'; B <= '1'; C <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; C <= '1'; wait for 10 ns;
        wait; -- wait forever
    end process;
end Behavior;
