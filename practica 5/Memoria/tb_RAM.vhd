-- **********************************************
-- tb_RAM.vhd : RAM (Testbench)
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
entity tb_RAM is
end tb_RAM;

-- **********************************************
-- ARCHITECTURE
-- **********************************************
architecture Behavioral of tb_RAM is
    -- Define RAM Component
    component RAM is
        port( CLK   : in  std_logic;                        -- Clock
              Read  : in  std_logic;                        -- Read
              Write : in  std_logic;                        -- Write
              Addr  : in  std_logic_vector(1 downto 0);     -- Address (2 bits)
              D_in  : in  std_logic_vector(7 downto 0);     -- Data In (8 bits)
              D_out : out std_logic_vector(7 downto 0)      -- Data Out (8 bits)
        );
    end component;
    
    -- Define Signals
    signal CLK, Read, Write : std_logic;
    signal Addr  : std_logic_vector(1 downto 0);
    signal D_in, D_out : std_logic_vector(7 downto 0);
begin
    -- Instantiate RAM
    DUT : RAM port map(
        CLK   => CLK,
        Read  => Read,
        Write => Write,
        Addr  => Addr,
        D_in  => D_in,
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
    
    -- Read/Write Process
    process begin
        Write <= '0'; Read <= '0'; D_in <= (others => '0'); wait for 60 ns;
        Write <= '1'; Read <= '0'; D_in <= "00001111"; wait for 30 ns;
        Write <= '1'; Read <= '0'; D_in <= "11110000"; wait for 40 ns;
        Write <= '0'; Read <= '1'; D_in <= (others => '0'); wait;
    end process;
end Behavioral;
