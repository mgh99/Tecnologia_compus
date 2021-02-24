-- **********************************************
-- FSM.vhd : FSM Controller to Transfer info from ROM to RAM
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
    port( CLK   : in  std_logic;                        -- Clock
          RST   : in  std_logic;                        -- Read
      	  Addr  : out std_logic_vector(1 downto 0);     -- Address (2 bits)
      	  R_ROM : out std_logic;                        -- Read from ROM
      	  W_RAM : out std_logic;                        -- Write to RAM
      	  R_RAM : out std_logic                         -- Read from RAM
    );
end FSM;

-- **********************************************
-- ARCHITECTURE
-- **********************************************
architecture Behavioral of FSM is
    -- Define FSM States
    type state_type is (S0, S1, S2, S3, S4, S5, S6, S7);
    signal currentState, nextState : state_type;
begin
    -- State Change Process
    process(CLK, RST)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                currentState <= S0;
            else
                currentState <= nextState;
            end if;
        end if;
    end process;

    -- FSM Process
    process(currentState)
    begin
        case currentState is
            -- Transfer Data Content from ROM to RAM 
            when S0 => 
                nextState <= S1; Addr <= "00";
                R_ROM <= '1'; W_RAM <= '1'; R_RAM <= '0';
            when S1 => 
                nextState <= S2; Addr <= "01";
                R_ROM <= '1'; W_RAM <= '1'; R_RAM <= '0';
            when S2 => 
                nextState <= S3; Addr <= "10";
                R_ROM <= '1'; W_RAM <= '1'; R_RAM <= '0';
            when S3 => 
                nextState <= S4; Addr <= "11";
                R_ROM <= '1'; W_RAM <= '1'; R_RAM <= '0';
            -- Read from RAM
            when S4 => 
                nextState <= S5; Addr <= "00";
                R_ROM <= '0'; W_RAM <= '0'; R_RAM <= '1';
            when S5 => 
                nextState <= S6; Addr <= "01";
                R_ROM <= '0'; W_RAM <= '0'; R_RAM <= '1';
            when S6 => 
                nextState <= S7; Addr <= "10";
                R_ROM <= '0'; W_RAM <= '0'; R_RAM <= '1';
            when S7 => 
                nextState <= S0; Addr <= "11";
                R_ROM <= '0'; W_RAM <= '0'; R_RAM <= '1';
            when others =>
                nextState <= S0; Addr <= "00";
                R_ROM <= '0'; W_RAM <= '0'; R_RAM <= '0';
        end case;
    end process;
end Behavioral;
