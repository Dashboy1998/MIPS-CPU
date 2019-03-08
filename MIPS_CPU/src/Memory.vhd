library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;  
use work.mips_program.all;

entity Memory is
  port(CS, WE, Clk: in std_logic;
       ADDR: in unsigned(31 downto 0);
	   Mem_Data_Write: in unsigned(31 downto 0); -- Data Write
	   Mem_Data_Read: out unsigned(31 downto 0)); -- Data Read
end Memory;

architecture Internal of Memory is 
type MEM is array (0 to 3)  of RAMtype(0 to 255);  
signal RAM1: MEM := (program, values, weights, program);  
alias HighAdr is ADDR(9 downto 8);
alias lowAddr is ADDR(7 downto 0);
  --signal RAM1: RAMtype(0 to 1023) := (program & values & weights & program);
begin
  process(Clk)
  begin
    if Clk = '0' and Clk'event then
      if CS = '1' and WE = '1' then
        RAM1(to_integer(HighAdr))(to_integer(lowAddr)) <= Mem_Data_Write;
      end if;
    Mem_Data_Read <= RAM1(to_integer(HighAdr))(to_integer(lowAddr));
    end if;
  end process;
end Internal;