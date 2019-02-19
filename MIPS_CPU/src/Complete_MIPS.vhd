library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Complete_MIPS is
  port( CLOCK_1 : IN STD_LOGIC; -- 1 MHz Clock
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
  signal A_Out, D_Out: unsigned(31 downto 0); -- Data for Hex
  signal CS, WE: std_logic;
  signal ADDR, Mem_Data_Write, Mem_Data_Read: unsigned(31 downto 0);
begin
  RST <= not KEY(1);
  CLK <= CLOCK_1 when SW(0) = '1' else KEY(0);
  CPU: MIPS port map (CLK, RST, CS, WE, ADDR, Mem_Data_Write, Mem_Data_Read);
  MEM: Memory port map (CS, WE, CLK, ADDR, Mem_Data_Write, Mem_Data_Read);
  A_Out <= Addr;
  D_Out <= Mem_Data_Read;
end model;