library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Memory is
  port(CS, WE, Clk: in std_logic;
       ADDR: in unsigned(31 downto 0);
	   Mem_Data_Write: in unsigned(31 downto 0); -- Data Write
	   Mem_Data_Read: out unsigned(31 downto 0)); -- Data Read
end Memory;

architecture Internal of Memory is
  type RAMtype is array (0 to 127) of unsigned(31 downto 0);
  signal RAM1: RAMtype := (others => (others => '0'));
begin
  process(Clk)
  begin
    if Clk = '0' and Clk'event then
      if CS = '1' and WE = '1' then
        RAM1(to_integer(ADDR(6 downto 0))) <= Mem_Data_Write;
      end if;
    Mem_Data_Read <= RAM1(to_integer(ADDR(6 downto 0)));
    end if;
  end process;
end Internal;