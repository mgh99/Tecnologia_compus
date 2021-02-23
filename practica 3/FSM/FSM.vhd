-- **********************************************
-- FSM.vhd : Finite State Machine
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
entity FSM is
    port( CLK : in  std_logic;      -- Clock
          RST : in  std_logic;      -- Reset
          L   : in  std_logic;      -- Left Button
          R   : in  std_logic;      -- Right Button
          Z   : out std_logic       -- Output
    );
end FSM;

-- **********************************************
-- ARCHITECTURE
-- **********************************************
architecture Structural of FSM is
    -- Define Flipflop Component
    component flipflopD is
        port( CLK : in  std_logic;
              RST : in  std_logic;
              D   : in  std_logic;
              Q   : out std_logic
        );
    end component;
    
    -- Define Internal Signals
    signal D1, D0, Q1, Q0 : std_logic;
    signal Z_AUX : std_logic;
begin
    -- Instantiate Flipflops
    FF1 : flipflopD port map(
        CLK => CLK,
        RST => RST,
        D   => D1,
        Q   => Q1
    );
    
    FF0 : flipflopD port map(
        CLK => CLK,
        RST => RST,
        D   => D0,
        Q   => Q0
    );
    
    -- Connect Signals using FSM Logic Functions
    D1 <= ((L and not(R) and not(Q1) and Q0) or (not(L) and Q1) or (R and Q1) or (Q1 and not(Q0)));
    D0 <= ((not(L) and R) or (not(L) and Q0) or (R and Q0));
    Z_AUX  <= (L and not(R) and Q1 and Q0);

    -- To Keep Z Output High Forever
    process (CLK) begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                Z <= '0';
            else
                if (Z_AUX = '1') then
                    Z <= '1';
                end if;
            end if;
        end if;
    end process;
end Structural;
