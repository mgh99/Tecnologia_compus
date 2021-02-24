-- **********************************************
-- ROM.vhd : ROM Component
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;                        -- Contains 'conv_integer' Function

-- **********************************************
-- ENTITY
-- **********************************************
entity ROM is
    port( CLK   : in  std_logic;                        -- Clock
          Read  : in  std_logic;                        -- Read
      	  Addr  : in  std_logic_vector(1 downto 0);     -- Address (2 bits)
      	  D_out : out std_logic_vector(7 downto 0)      -- Data Out (8 bits)
    );
end ROM;

-- **********************************************
-- ARCHITECTURE
-- **********************************************
architecture Behavioral of ROM is
    -- Define ROM Content
    type ROM_Array is array (0 to 3) of std_logic_vector(7 downto 0);
    constant ROM_content : ROM_Array := (
        0 => "10000001",                        -- ROM Content at location OH
        1 => "10000010",                        -- ROM Content at location 1H
        2 => "10000011",                        -- ROM Content at location 2H
        3 => "10000100",                        -- ROM Content at location 3H
        others => "11111111"
    );
begin
    -- ROM Process
    process(CLK) begin
        if (rising_edge(CLK)) then
            -- Read Data
            if (Read = '1') then
                D_out <= ROM_content(conv_integer(Addr));
            else
                D_out <= "ZZZZZZZZ";
            end if;
        end if;
    end process;
end Behavioral;
