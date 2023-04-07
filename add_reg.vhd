--------------------------------------------------------------------------
-- File:        multi.vhd                                               --
-- Category:    Behavioral VHDL for simulation and synthesis            --
-- Synopsis:    N/A                                                     --
-- Description: additionneur avec registre de sortie                                    --
--                                                                      --
-- Author:      O. Rossetto                                             --
--------------------------------------------------------------------------

library ieee;  
use  ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 

     entity add_reg is
        port (	E1 : in std_logic_vector (17 downto 0);
		E2 : in std_logic_vector (17 downto 0);
		clk :in std_logic;
		raz :in std_logic; 
		S : out std_logic_vector (17 downto 0));

     end add_reg;
   
     
architecture behavior of add_reg is

begin
        process (clk, raz)
	begin
		if raz = '1' then
			S <= (others => '0');
		elsif rising_edge(clk) then 
			S <= E1 + E2;
		end if;
		
        end process;
end behavior;
