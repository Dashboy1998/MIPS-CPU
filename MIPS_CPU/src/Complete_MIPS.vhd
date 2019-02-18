library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Complete_MIPS is
  port(CLK, RST: in std_logic;
       A_Out, D_Out: out unsigned(31 downto 0));
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
  signal CS, WE: std_logic;
  signal ADDR, Mem_Data_Write, Mem_Data_Read: unsigned(31 downto 0);
begin
  CPU: MIPS port map (CLK, RST, CS, WE, ADDR, Mem_Data_Write, Mem_Data_Read);
  MEM: Memory port map (CS, WE, CLK, ADDR, Mem_Data_Write, Mem_Data_Read);
  A_Out <= Addr;
  D_Out <= Mem_Data_Read;
end model;