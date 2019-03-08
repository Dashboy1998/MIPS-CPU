library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.HEX2Seven.all;

entity Complete_MIPS is
  port( CLOCK_50 : IN STD_LOGIC; -- 1 MHz Clock
 		SW : IN STD_LOGIC_VECTOR(9 downto 0); -- switches
		KEY : IN STD_LOGIC_VECTOR(3 downto 0); -- push buttons
		HEX0 : OUT STD_LOGIC_VECTOR(0 to 6);
		HEX1 : OUT STD_LOGIC_VECTOR(0 to 6);
		HEX2 : OUT STD_LOGIC_VECTOR(0 to 6);
		HEX3 : OUT STD_LOGIC_VECTOR(0 to 6);
		HEX4 : OUT STD_LOGIC_VECTOR(0 to 6);
		HEX5 : OUT STD_LOGIC_VECTOR(0 to 6));
end Complete_MIPS;
 
architecture model of Complete_MIPS is 
  component MIPS is
    port(CLK, RST: in std_logic;
         CS, WE: out std_logic;
         ADDR: out unsigned(31 downto 0);
         Mem_Data_Write: out unsigned(31 downto 0);
	   	 Mem_Data_Read: in unsigned(31 downto 0));
  end component;
  component Memory is
    port(CS, WE, Clk: in std_logic;
         ADDR: in unsigned(31 downto 0);
         Mem_Data_Write: in unsigned(31 downto 0); 
	   	 Mem_Data_Read: out unsigned(31 downto 0));
  end component;
  signal RST: std_logic; -- Reset Key
  signal CLK: std_logic; -- Selected Clock signal
  --signal A_Out, D_Out: unsigned(31 downto 0); -- Data for Hex
  signal CS, WE: std_logic;
  signal ADDR, Mem_Data_Write, Mem_Data_Read: unsigned(31 downto 0); 
  signal CLOCK_1: std_logic; -- 1MHz clock from PLL
  signal dataAddr : unsigned(31 downto 0);
  alias upper_dataAddr : unsigned(15 downto 0) is dataAddr(31 downto 16);
  alias lower_dataAddr : unsigned(15 downto 0) is dataAddr(15 downto 0);
  alias ul : std_logic is SW(9); -- Upper/Lower 
  alias sel : std_logic_vector(1 downto 0) is SW(2 downto 1);
  signal displayData : unsigned(15 downto 0);
begin
  RST <= not KEY(1);
  CLK <= CLOCK_1 when SW(0) = '1' else KEY(0);
  CPU: MIPS port map (CLK, RST, CS, WE, ADDR, Mem_Data_Write, Mem_Data_Read);
  MEM: Memory port map (CS, WE, CLK, ADDR, Mem_Data_Write, Mem_Data_Read);
  
  dataAddr <= ADDR when sel = "00" else -- Address
  		  Mem_Data_Read when sel = "01" else -- data in
	  	  Mem_Data_Write when sel = "10" else -- data out
		  x"00000000"; -- Else 0
  displayData <= upper_dataAddr when ul = '1' else -- Display upper data
	  			 lower_dataAddr when ul = '0'; -- Display lower data
  HEX0 <= display(x"A") when sel = "00" else -- Display A for address
  		  "1111000" when sel = "01" else -- Display 1- for data in
	  	  "1001110" when sel = "10" else -- Display -1 for data out
		  "1000001"; -- Display U for unknown		
  HEX1 <= display(x"1") when ul = '1' else -- Display 1 for upper
	  	  display(x"0"); -- Display 0 for lower
  HEX2 <= display(displayData(3 downto 0));
  HEX3 <= display(displayData(7 downto 4));
  HEX4 <= display(displayData(11 downto 8));
  HEX5 <= display(displayData(15 downto 12));
			  
end model;