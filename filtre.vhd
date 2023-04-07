library ieee;  
use  ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 

entity filtre is 
  port (
    E  : in std_logic_vector(17 downto 0);
    clk : in std_logic;
    raz : in std_logic;
    ld_coeff : in std_logic;
    S : out std_logic_vector(17 downto 0)
    );
end filtre;		

architecture behavior of filtre is

component multi 
port (
    a: in std_logic_vector(17 downto 0);
    b: in std_logic_vector(17 downto 0);
    s: out std_logic_vector(35 downto 0)
    );
end component; 

component add_reg
  port (E1 : in std_logic_vector (17 downto 0);
	E2 : in std_logic_vector (17 downto 0);
	clk :in std_logic;
	raz :in std_logic; 
	S : out std_logic_vector (17 downto 0));
end component; 

component reg_E
port (	E : in std_logic_vector (17 downto 0);
	clk :in std_logic;
	raz :in std_logic;
	ld_coeff :in std_logic;
	Coeff  : out std_logic_vector (17 downto 0);
	S : out std_logic_vector (15 downto 0));
end component;

signal s_reg16	: std_logic_vector (15 downto 0);
signal in_add   : std_logic_vector (17 downto 0);
signal coeff 	: std_logic_vector (17 downto 0);
signal prod18	: std_logic_vector (17 downto 0);
signal prod36	: std_logic_vector (35 downto 0);
signal S_int 	: std_logic_vector (17 downto 0);

begin

 in_add <= s_reg16 & "00";
 prod18 <= prod36(35 downto 18);
 S <= S_int;

U1 : reg_E port map (E => E, clk =>clk, raz =>raz, ld_coeff => ld_coeff,S => s_reg16, Coeff => coeff); 
U2 : add_reg port map (E1 => in_add, E2 => prod18, clk => clk, raz => raz, S => S_int);
U3 : multi port map (a => S_int, b => coeff, s => prod36);

end behavior;

