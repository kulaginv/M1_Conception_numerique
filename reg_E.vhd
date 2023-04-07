--------------------------------------------------------------------------
-- File:        Registre d'entree RAZ asynchrone                                               --
-- Category:    Behavioral VHDL for simulation and synthesis            --
-- Synopsis:    N/A                                                     --
-- Description: registre d'entre et coeff.                                     --
--                                                                      --
-- Author:      O. Rossetto                                             --
--------------------------------------------------------------------------

library ieee;  
use  ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
      
   entity reg_E is
        port (	E : in std_logic_vector (17 downto 0);
		clk :in std_logic;
		raz :in std_logic;
		ld_coeff :in std_logic;
		Coeff  : out std_logic_vector (17 downto 0);
		S : out std_logic_vector (15 downto 0):="0000000000000000");

     end reg_E;
     
architecture behavior of reg_E is
signal etat : std_logic_vector(17 downto 0):="000000000000000000";
begin
	process(clk, raz)
	begin
		if raz = '1' then
			S <= (others => '0');
			Coeff <= (others => '0');
		elsif rising_edge(clk) then 
			if ld_coeff = '1' then
				Coeff <= E;
				etat <= E;
			else
				if E /= etat then
					S <= E(17 downto 2);
				end if;
			end if;
		end if;
	end process;
end behavior;
