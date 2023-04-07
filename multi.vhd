--------------------------------------------------------------------------
-- File:        multi.vhd multiplieur COMBINATOIRE                                              --
-- Category:    Behavioral VHDL for simulation and synthesis            --
-- Synopsis:    N/A                                                     --
-- Description: multiplieur 16 bits                                     --
--                                                                      --
-- Author:      O. Rossetto                                             --
--------------------------------------------------------------------------


library ieee;  
use  ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 

entity multi is
  port (
    a: in std_logic_vector(17 downto 0);
    b: in std_logic_vector(17 downto 0);
    s: out std_logic_vector(35 downto 0)
    );
end multi;

architecture behavior of multi is

begin
  process(a,b)
  begin
	s <= a*b;
  end process;
end behavior;
