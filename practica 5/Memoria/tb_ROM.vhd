-- **********************************************
-- tb_ROM.vhd : ROM (Testbench)
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
entity tb_ROM is
end tb_ROM;

-- **********************************************
-- ARCHITECTURE
-- **********************************************
architecture Behavioral of tb_ROM is
    -- Define ROM Component
    component ROM is
        port( CLK   : in  std_logic;                        -- Clock
              Read  : in  std_logic;                        -- Read
              Addr  : in  std_logic_vector(1 downto 0);     -- Address (2 bits)
              D_out : out std_logic_vector(7 downto 0)      -- Data Out (8 bits)
        );
    end component;
    
    -- Define Signals
    signal CLK, Read : std_logic;
    signal Addr  : std_logic_vector(1 downto 0);
    signal D_out : std_logic_vector(7 downto 0);
begin
    -- Instantiate ROM
    DUT : ROM port map(
        CLK   => CLK,
        Read  => Read,
        Addr  => Addr,
        D_out => D_out
    );
    
    -- Clock Process
    process begin
        CLK <= '0'; wait for 5 ns;
        CLK <= '1'; wait for 5 ns;
    end process;
    
    -- Address Process
    process begin
        Addr <= "00"; wait for 15 ns;
        Addr <= "01"; wait for 15 ns;
        Addr <= "10"; wait for 15 ns;
        Addr <= "11"; wait for 15 ns;
    end process;
    
    -- Read Process
    process begin
        Read <= '0'; wait for 60 ns;
        Read <= '1'; wait for 60 ns;
        Read <= '0'; wait;
    end process;
end Behavioral;
