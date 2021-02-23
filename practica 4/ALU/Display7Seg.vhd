-- **********************************************
-- Display7Seg.vhd : 7 Segment Display Controller
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
entity Display7Seg is
    Port ( SIMBOLO : in  std_logic_vector(1 downto 0);      -- Number / Letter to Represent
           DISPLAY : out std_logic_vector(6 downto 0)       -- 7 Segments of the Display
    );
end Display7Seg;

-- **********************************************
-- ARCHITECTURE
-- **********************************************
architecture Behavioral of Display7Seg is
begin
    process(SIMBOLO)
    begin
        case SIMBOLO is
                         --"abcdefg" si está a '1' el segmento se apaga
            when "00" =>
                DISPLAY <= "0000001"; -- 0
            when "01" =>
                DISPLAY <= "1001111"; -- 1 
            when "10" =>
                DISPLAY <= "0010010"; -- 2 
            when "11" =>
                DISPLAY <= "0000110"; -- 3
            when others =>
                DISPLAY <= "1111111";
        end case;
    end process;
end Behavioral;
