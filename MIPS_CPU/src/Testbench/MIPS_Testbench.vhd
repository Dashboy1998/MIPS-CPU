library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.mips_program.all;

entity MIPS_Testbench is
end MIPS_Testbench;

architecture test of MIPS_Testbench is
  component MIPS
    port(CLK, RST: in std_logic; 
         CS, WE: out std_logic;
         ADDR: out unsigned (31 downto 0);
         Mem_Data_Write: out unsigned(31 downto 0);
	   	 Mem_Data_Read: in unsigned(31 downto 0));
  end component;
  component Memory
    port(CS, WE, CLK: in std_logic;
         ADDR: in unsigned(31 downto 0);
         Mem_Data_Write: in unsigned(31 downto 0); 
	   	 Mem_Data_Read: out unsigned(31 downto 0));
  end component;
 
  signal CS, WE, CLK: std_logic := '0';
  signal Mem_Data_Write, Mem_Data_Read, Address: unsigned(31 downto 0);
  signal RST: std_logic; 
  alias PC is 
    <<signal CPU.PC : unsigned(31 downto 0)>>;
begin
  CPU: MIPS port map (CLK, RST, CS, WE, Address, Mem_Data_Write, Mem_Data_Read);
  MEM: Memory port map (CS, WE, CLK, Address, Mem_Data_Write, Mem_Data_Read);

  CLK <= not CLK after 10 ns; 
	  
  process
  begin  
    rst <= '1';
    wait until CLK = '1' and CLK'event;
    rst <= '0';
    wait until CLK = '1' and CLK'event;
   
	wait until PC = x"0000000F"; 
	wait until CLK = '1' and CLK'event;
	wait until CLK = '1' and CLK'event;	
	wait until CLK = '1' and CLK'event;
	wait until CLK = '1' and CLK'event;
	wait until CLK = '1' and CLK'event;
	wait until CLK = '1' and CLK'event;
	wait until CLK = '1' and CLK'event;
	wait until CLK = '1' and CLK'event;
	assert false  
    	report "Testing Finished:"
	severity failure;
  end process;
end test;