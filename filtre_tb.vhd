library ieee;  
use  ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 

entity filtre_tb is 
end filtre_tb;

architecture simu of filtre_tb is
signal E_in   : std_logic_vector(17 downto 0):="000000000000000000";
signal clk_in : std_logic :='1';
signal raz_in : std_logic :='0';
signal ld_coeff_in : std_logic := '0';
signal S_out  : std_logic_vector(17 downto 0);

component filtre 
port (
    E  : in std_logic_vector(17 downto 0);
    clk : in std_logic;
    raz : in std_logic;
    ld_coeff : in std_logic;
    S : out std_logic_vector(17 downto 0)
    );
end component;
begin
	
  	DUT : filtre port map(clk => clk_in, raz => raz_in, ld_coeff => ld_coeff_in, S => S_out, E => E_in);

	raz_in <= '1' after 1 ns, '0' after 5 ns;
	E_in<= "101001100110011001" after 30 ns, "000000001000000000" after 200 ns;
	ld_coeff_in <= '1' after 10 ns, '0' after 70 ns; 

process
	begin
		clk_in<='0';
		wait for 20 ns;
		clk_in<='1';
		wait for 20 ns;
end process;

end simu;
