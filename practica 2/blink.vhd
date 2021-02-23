library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blink is
    Port ( CLK : in  std_logic;
           LED : out std_logic
    );
end blink;
  
architecture Behavioral of blink is
    -- Constants and Signals
    constant CLK_FREQ  : integer := 100000000;              -- Clock Frequency in Hz
    constant BLINK_FREQ : integer := 1;                     -- Desired Blinking Frequency in Seconds
    constant MAX_COUNT : integer := CLK_FREQ * BLINK_FREQ;  -- Maximum Number of Clock Cycles to Count
    signal COUNT : integer range 0 to MAX_COUNT;            -- Current Count
    signal AUX_SIG : std_logic := '0';                      -- Auxiliar Signal
begin
    process(CLK) begin
        if (rising_edge(CLK)) then
            if (COUNT = MAX_COUNT) then
                COUNT <= 0;
                AUX_SIG <= not AUX_SIG;
            else
                COUNT <= COUNT + 1;
            end if;
        end if;
    end process;
    
    LED <= AUX_SIG;
end Behavioral;
