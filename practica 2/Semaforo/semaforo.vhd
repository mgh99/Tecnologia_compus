library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity semaforo is
    Port ( CLK      : in  std_logic;
           RST      : in  std_logic;
           R1,G1    : out std_logic;
           R2,G2    : out std_logic
    );
end semaforo;
  
architecture Behavioral of semaforo is
    constant CLK_FREQ : integer := 100000000;
    constant MAX_COUNT : integer := CLK_FREQ * 19;          -- 19 is the maximum time to count in seconds for the whole machine
    type statetype is (S0, S1, S2, S3);
    signal currentState, nextState : statetype;
    signal count : integer range 0 to MAX_COUNT;
begin
    -- State and Counter
    process(CLK) begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                count <= 0;
                currentState <= S0;
            else
                currentState <= nextState;
                -- Increase Counter
                if (count = MAX_COUNT) then
                    count <= 0;
                else
                    count <= count + 1;
                end if;
            end if;
        end if;
    end process;
    
    -- Next State Logic
    process(currentState, count)
    begin
        case currentState is
            when S0 =>
                if (count = CLK_FREQ * 10) then
                    nextState <= S1;
                else
                    nextState <= S0;
                end if;
                -- Outputs
                R1 <= '0'; G1 <= '1';
                R2 <= '1'; G2 <= '0';
            when S1 => 
                if (count = CLK_FREQ * 12) then
                    nextState <= S2;
                else
                    nextState <= S1;
                end if;
                -- Outputs
                R1 <= '1'; G1 <= '1';
                R2 <= '1'; G2 <= '0';
            when S2 => 
                if (count = CLK_FREQ * 17) then
                    nextState <= S3;
                else
                    nextState <= S2;
                end if;
                -- Outputs
                R1 <= '1'; G1 <= '0';
                R2 <= '0'; G2 <= '1';
            when S3 => 
                if (count = MAX_COUNT) then
                    nextState <= S0;
                else
                    nextState <= S3;
                end if;
                -- Outputs
                R1 <= '1'; G1 <= '0';
                R2 <= '1'; G2 <= '1';
            when others => 
                nextState <= S0;
                -- Outputs
                R1 <= '0'; G1 <= '0';
                R2 <= '0'; G2 <= '0';
        end case;
    end process;
end Behavioral;  
