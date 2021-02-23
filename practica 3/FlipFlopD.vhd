-- **********************************************
-- flipflopD.vhd : D Flip-flop Component
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
entity flipflopD is
	port( CLK : in  std_logic;    		 -- Clock
          RST : in  std_logic;           -- Reset
      	  D   : in  std_logic;           -- Input
      	  Q   : out std_logic            -- Output
    );
end flipflopD;

-- **********************************************
-- ARCHITECTURE
-- **********************************************
architecture Behavioral of flipflopD is
begin
    -- Process
    process(CLK) begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                Q <= '0';
            else
                Q <= D;
            end if;
        end if;
    end process;
end Behavioral;
