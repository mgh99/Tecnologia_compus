-- **********************************************
-- tb_top.vhd : Top Entity (Testbench)
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
entity tb_top is
end tb_top;

-- **********************************************
-- ARCHITECTURE
-- **********************************************
architecture Behavioral of tb_top is
    -- Define top Component
    component top is
        port( CLK   : in  std_logic;                      -- Clock
              RST   : in  std_logic;                      -- Reset
              D_out : out std_logic_vector(7 downto 0)    -- Output Data (8 bits)
        );
    end component;
    
    -- Define Signals
    signal CLK, RST : std_logic;
    signal D_out : std_logic_vector(7 downto 0);
begin
    -- Instantiate DUT
    DUT : top port map(
        CLK   => CLK,
        RST   => RST,
        D_out => D_out
    );
    
    -- Clock Process
    process begin
        CLK <= '0'; wait for 5 ns;
        CLK <= '1'; wait for 5 ns;
    end process;
    
    -- Reset Process
    process begin
        RST <= '0'; wait for 15 ns;
        RST <= '1'; wait for 20 ns;
        RST <= '0'; wait;
    end process;
end Behavioral;
