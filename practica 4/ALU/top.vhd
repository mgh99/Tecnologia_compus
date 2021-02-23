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
    port( A : in  std_logic_vector(1 downto 0);         -- Input A
          B : in  std_logic_vector(1 downto 0);         -- Input B
      	  S : in  std_logic_vector(1 downto 0);         -- Control Signal
      	  D : out std_logic_vector(6 downto 0)          -- 7-Segment Display
    );
end top;

-- **********************************************
-- ARCHITECTURE
-- **********************************************
architecture Structural of top is
    -- Define ALU Component
    component ALU is
        port( A : in  std_logic_vector(1 downto 0);     -- Input A
              B : in  std_logic_vector(1 downto 0);     -- Input B
              S : in  std_logic_vector(1 downto 0);     -- Control Signal
              R : out std_logic_vector(1 downto 0);     -- Result
              C : out std_logic                         -- Carry Out
        );
    end component;
    
    -- Define Display7Seg Component
    component Display7Seg is
        Port ( SIMBOLO : in  std_logic_vector(1 downto 0);   -- Number / Letter to Represent
               DISPLAY : out std_logic_vector(6 downto 0)    -- 7 Segments of the Display
        );
    end component;
    
    -- Signal Definition
    signal AUX : std_logic_vector(1 downto 0);
begin
    -- Instantiate ALU
    ALU1 : ALU port map(
        A => A,
        B => B,
        S => S,
        R => AUX,
        C => open
    );
    -- Instantiate 7-Seg Decoder
    DISP : Display7Seg port map(
        SIMBOLO => AUX,
        DISPLAY => D
    );
end Structural;
