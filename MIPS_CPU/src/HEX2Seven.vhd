library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package HEX2Seven is 
	function display(X: unsigned(3 downto 0)) return std_logic_vector;
end HEX2Seven; 

package body HEX2Seven is
	function display(X: unsigned(3 downto 0)) 
		return std_logic_vector is  
	variable segments: std_logic_vector(0 to 6);
	begin
		case X is
			when "0000" => -- Displays 0
			segments(0) := '0';
			segments(1) := '0';
			segments(2) := '0';
			segments(3) := '0';
			segments(4) := '0';
			segments(5) := '0';
			segments(6) := '1';
			
			when "0001" => -- Displays 1
			segments(0) := '1';
			segments(1) := '0';
			segments(2) := '0';
			segments(3) := '1';
			segments(4) := '1';
			segments(5) := '1';
			segments(6) := '1';
			
			when "0010" => -- Displays 2
			segments(0) := '0';
			segments(1) := '0';
			segments(2) := '1';
			segments(3) := '0';
			segments(4) := '0';
			segments(5) := '1';
			segments(6) := '0';
			
			when "0011" => -- Displays 3
			segments(0) := '0';
			segments(1) := '0';
			segments(2) := '0';
			segments(3) := '0';
			segments(4) := '1';
			segments(5) := '1';
			segments(6) := '0';
			
			when "0100" => -- Displays 4
			segments(0) := '1';
			segments(1) := '0';
			segments(2) := '0';
			segments(3) := '1';
			segments(4) := '1';
			segments(5) := '0';
			segments(6) := '0';
			
			when "0101" => -- Displays 5
			segments(0) := '0';
			segments(1) := '1';
			segments(2) := '0';
			segments(3) := '0';
			segments(4) := '1';
			segments(5) := '0';
			segments(6) := '0';
			
			when "0110" => -- Displays 6
			segments(0) := '0';
			segments(1) := '1';
			segments(2) := '0';
			segments(3) := '0';
			segments(4) := '0';
			segments(5) := '0';
			segments(6) := '0';
			
			when "0111" => -- Displays 7
			segments(0) := '0';
			segments(1) := '0';
			segments(2) := '0';
			segments(3) := '1';
			segments(4) := '1';
			segments(5) := '1';
			segments(6) := '1';
			
			when "1000" => -- Displays 8
			segments(0) := '0';
			segments(1) := '0';
			segments(2) := '0';
			segments(3) := '0';
			segments(4) := '0';
			segments(5) := '0';
			segments(6) := '0';
			
			when "1001" => -- Displays 9
			segments(0) := '0';
			segments(1) := '0';
			segments(2) := '0';
			segments(3) := '0';
			segments(4) := '1';
			segments(5) := '0';
			segments(6) := '0';
			
			when "1010" => -- Displays A
			segments(0) := '0';
			segments(1) := '0';
			segments(2) := '0';
			segments(3) := '1';
			segments(4) := '0';
			segments(5) := '0';
			segments(6) := '0';
			
			when "1011" => -- Displays B
			segments(0) := '1';
			segments(1) := '1';
			segments(2) := '0';
			segments(3) := '0';
			segments(4) := '0';
			segments(5) := '0';
			segments(6) := '0';
			
			when "1100" => -- Displays C
			segments(0) := '0';
			segments(1) := '1';
			segments(2) := '1';
			segments(3) := '0';
			segments(4) := '0';
			segments(5) := '0';
			segments(6) := '1';
			
			when "1101" => -- Displays D
			segments(0) := '1';
			segments(1) := '0';
			segments(2) := '0';
			segments(3) := '0';
			segments(4) := '0';
			segments(5) := '1';
			segments(6) := '0';
			
			when "1110" => -- Displays E
			segments(0) := '0';
			segments(1) := '1';
			segments(2) := '1';
			segments(3) := '0';
			segments(4) := '0';
			segments(5) := '0';
			segments(6) := '0';
			
			when "1111" => -- Displays F
			segments(0) := '0';
			segments(1) := '1';
			segments(2) := '1';
			segments(3) := '1';
			segments(4) := '0';
			segments(5) := '0';
			segments(6) := '0';
			
			when others =>	-- U for Unknown
			segments(0) := '1';
			segments(1) := '0';
			segments(2) := '0';
			segments(3) := '0';
			segments(4) := '0';
			segments(5) := '0';
			segments(6) := '1';
		end case;	
		return segments;
		end display;
end HEX2Seven;