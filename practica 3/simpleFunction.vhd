-- **********************************************
-- simpleFunction.vhd : Simple Boolean Function
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
entity simpleFunction is
	port( A, B, C : in  std_logic;     -- Inputs
      	  Y : out std_logic            -- Output
    );
end simpleFunction;

-- **********************************************
-- ARCHITECTURE
-- **********************************************
architecture Dataflow of simpleFunction is
begin
    -- Define Function
    Y <= (not(A) and not(B) and not(C)) or (A and not(B) and not(C)) or (A and not(B) and C);
end Dataflow;
