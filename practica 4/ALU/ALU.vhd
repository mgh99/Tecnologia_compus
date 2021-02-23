-- **********************************************
-- ALU.vhd : 2-bit ALU Component
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
use IEEE.NUMERIC_STD.ALL;

-- **********************************************
-- ENTITY
-- **********************************************
entity ALU is
    port ( A, B : in std_logic_vector( 1 downto 0 );
           S : in  std_logic_vector( 1 downto 0 );
           R : out std_logic_vector( 1 downto 0 );
           C : out std_logic
    );
end ALU;

-- **********************************************
-- ARCHITECTURE
-- **********************************************
architecture Behavioral of ALU is
    signal R_aux : unsigned( 2 downto 0 );
begin
    process(A,B,S,R_aux) begin
        case S is
            when "00" =>    -- Suma
                R_aux <= unsigned('0' & A) + unsigned('0' & B);
                C <= R_aux(2);
                R <= std_logic_vector(R_aux(1 downto 0));
                --R <= R_aux(1) & R_aux(0);
            when "01" =>    -- Resta
                R_aux <= unsigned('0' & A) - unsigned('0' & B);
                C <= R_aux(2);
                R <= std_logic_vector(R_aux(1 downto 0));
                --R <= R_aux(1) & R_aux(0);
            when "10" =>    -- NAND
                C <= '0';
                R <= A nand B;
            when "11" =>    -- NOR
                C <= '0';
                R <= A nor B;
            when others =>
                C <= '0';
                R <= "00";
        end case;
    end process;
end Behavioral;
