
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_ALU is
end tb_ALU;

architecture Behavioral of tb_ALU is
    component ALU is
        port ( A, B : in std_logic_vector( 1 downto 0 );
               S : in  std_logic_vector( 1 downto 0 );
               R : out std_logic_vector( 1 downto 0 );
               C : out std_logic
        );
    end component;
    
    signal A, B, S, R : std_logic_vector(1 downto 0);
    signal C : std_logic;
begin
    DUT : ALU port map(A => A, B => B, S => S, R => R, C => C);
    
    process begin
        A <= "10"; B <= "00"; S <= "00"; wait for 10ns;
        A <= "11"; B <= "11"; S <= "00"; wait for 10ns;
        A <= "11"; B <= "11"; S <= "01"; wait for 10ns;
        A <= "11"; B <= "01"; S <= "01"; wait for 10ns;
        A <= "11"; B <= "00"; S <= "10"; wait for 10ns;
        A <= "01"; B <= "10"; S <= "11"; wait;
    end process;

end Behavioral;
