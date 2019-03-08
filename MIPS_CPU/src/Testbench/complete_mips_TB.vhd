library mips_cpu;
library ieee;
use mips_cpu.HEX2Seven.all;	
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity complete_mips_tb is
end complete_mips_tb;

architecture TB_ARCHITECTURE of complete_mips_tb is
	-- Component declaration of the tested unit
	component complete_mips
	port(
		CLOCK_50 : in STD_LOGIC;
		SW : in STD_LOGIC_VECTOR(9 downto 0);
		KEY : in STD_LOGIC_VECTOR(3 downto 0);
		HEX0 : out STD_LOGIC_VECTOR(0 to 6);
		HEX1 : out STD_LOGIC_VECTOR(0 to 6);
		HEX2 : out STD_LOGIC_VECTOR(0 to 6);
		HEX3 : out STD_LOGIC_VECTOR(0 to 6);
		HEX4 : out STD_LOGIC_VECTOR(0 to 6);
		HEX5 : out STD_LOGIC_VECTOR(0 to 6) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal CLOCK_50 : STD_LOGIC;
	signal SW : STD_LOGIC_VECTOR(9 downto 0);
	signal KEY : STD_LOGIC_VECTOR(3 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal HEX0 : STD_LOGIC_VECTOR(0 to 6);
	signal HEX1 : STD_LOGIC_VECTOR(0 to 6);
	signal HEX2 : STD_LOGIC_VECTOR(0 to 6);
	signal HEX3 : STD_LOGIC_VECTOR(0 to 6);
	signal HEX4 : STD_LOGIC_VECTOR(0 to 6);
	signal HEX5 : STD_LOGIC_VECTOR(0 to 6);

	-- Add your code here ...
	alias Clk_1Mhz is <<signal UUT.CLOCK_1 : std_logic>>;
begin

	-- Unit Under Test port map
	UUT : complete_mips
		port map (
			CLOCK_50 => CLOCK_50,
			SW => SW,
			KEY => KEY,
			HEX0 => HEX0,
			HEX1 => HEX1,
			HEX2 => HEX2,
			HEX3 => HEX3,
			HEX4 => HEX4,
			HEX5 => HEX5
		);

	-- Add your stimulus here ...
	
	process	-- System Clock
	begin		
		CLOCK_50 <= '0';
		wait for 10 ns;
		CLOCK_50 <= '1';
		wait for 10 ns;
	end process;
	
	process
	begin	
		SW <= "0000000001";
		KEY <= "1111";
		wait until Clk_1Mhz = '1' and Clk_1Mhz'event;
		wait until Clk_1Mhz = '1' and Clk_1Mhz'event;
		KEY <= "1101";
		wait until Clk_1Mhz = '1' and Clk_1Mhz'event;
		wait until Clk_1Mhz = '1' and Clk_1Mhz'event;  
		KEY <= "1111";
		
		for i in 0 to 20 loop -- About 1 instruction
			wait until Clk_1Mhz = '1' and Clk_1Mhz'event;
			wait until Clk_1Mhz = '1' and Clk_1Mhz'event; 
			wait until Clk_1Mhz = '1' and Clk_1Mhz'event;
			wait until Clk_1Mhz = '1' and Clk_1Mhz'event; 
			wait until Clk_1Mhz = '1' and Clk_1Mhz'event;
		end loop;
		assert false  
    	report "Testing Finished:"
		severity failure;
	end process;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_complete_mips of complete_mips_tb is
	for TB_ARCHITECTURE
		for UUT : complete_mips
			use entity work.complete_mips(model);
		end for;
	end for;
end TESTBENCH_FOR_complete_mips;

