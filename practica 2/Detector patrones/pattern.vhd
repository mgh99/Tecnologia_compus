library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pattern is
    Port ( CLK : in  std_logic;
           RST : in  std_logic;
           A   : in  std_logic; 
           Y   : out std_logic
    );
end pattern;
  
  architecture Behavioral of pattern is
    -- Constant and Signals
    constant MAX_C : integer := 10000000;       -- Maximum Number of Clock Cycles to Count
    signal D : std_logic;                       -- FF Input
    signal Q : std_logic;                       -- FF Output
    signal C : integer range 0 to MAX_C;        -- Current Count
begin
    process(CLK) begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                Q <= '0';
                C <= 0;
            else
                if (C = MAX_C) then
                    C <= 0;
                    Q <= D;
                else
                    C <= C + 1;
                end if;
            end if;
        end if;
    end process;
    
    -- Connect Signals
    D <= not A;
    Y <= (A and Q);
end Behavioral;
