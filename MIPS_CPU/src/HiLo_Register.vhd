library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity HiLo is
	port(CLK: in std_logic;
	Write_HiLo: in unsigned(63 downto 0);
	Read_HiLoReg: out unsigned(31 downto 0);
	Write_En: in std_logic; 
	Read_HiLo: in std_logic);
end entity;

architecture behavioral of HiLo is
signal REG: unsigned(63 downto 0);
alias HiReg: unsigned(31 downto 0) is REG(63 downto 32);
alias LoReg: unsigned(31 downto 0) is REG(31 downto 0);
begin
	process(clk)
	begin
		if CLK = '1' and CLK'event then
			if Write_En = '1' then
				REG <= Write_HiLo;
			end if;
		end if;
	end process;
Read_HiLoReg <= HiReg when Read_HiLo = '1' else 
				LoReg when Read_HiLo = '0'; --asynchronous read
end behavioral;