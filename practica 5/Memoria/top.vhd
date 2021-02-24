-- **********************************************
-- top.vhd : Top Entity
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
entity top is
    port( CLK   : in  std_logic;                      -- Clock
          RST   : in  std_logic;                      -- Reset
          D_out : out std_logic_vector(7 downto 0)    -- Output Data (8 bits)
    );
end top;

-- **********************************************
-- ARCHITECTURE
-- **********************************************
architecture Structural of top is
    -- Define FSM Component
    component FSM is
        port( CLK   : in  std_logic;                        -- Clock
              RST   : in  std_logic;                        -- Read
              Addr  : out std_logic_vector(1 downto 0);     -- Address (2 bits)
              R_ROM : out std_logic;                        -- Read from ROM
              W_RAM : out std_logic;                        -- Write to RAM
              R_RAM : out std_logic                         -- Read from RAM
        );
    end component;
    
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
    
    -- Define ROM Component
    component ROM is
        port( CLK   : in  std_logic;                        -- Clock
              Read  : in  std_logic;                        -- Read
              Addr  : in  std_logic_vector(1 downto 0);     -- Address (2 bits)
              D_out : out std_logic_vector(7 downto 0)      -- Data Out (8 bits)
        );
    end component;
    
    -- Signals Definition
    signal Addr_aux : std_logic_vector(1 downto 0);
    signal R_ROM_aux, W_RAM_aux, R_RAM_aux : std_logic;
    signal D_aux : std_logic_vector(7 downto 0);
begin
    -- Instantiate FSM
    FSM1 : FSM port map(
        CLK   => CLK,
        RST   => RST,
        Addr  => Addr_aux,
        R_ROM => R_ROM_aux,
        W_RAM => W_RAM_aux,
        R_RAM => R_RAM_aux
    );
    
    -- Instantiate RAM
    RAM1 : RAM port map(
        CLK   => CLK,
        Read  => R_RAM_aux,
        Write => W_RAM_aux,
        Addr  => Addr_aux,
        D_in  => D_aux,
        D_out => D_out
    );
    
    -- Instantiate ROM
    ROM1 : ROM port map(
        CLK   => CLK,
        Read  => R_ROM_aux,
        Addr  => Addr_aux,
        D_out => D_aux
    );
end Structural;
