library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package mips_program is
	/*type Iarr is array(0 to 15) of unsigned(31 downto 0); 
	constant Instr_List: Iarr := (
    x"30000000", -- andi $0, $0, 0  => 0. $0 = 0
	x"30040000", -- andi $4, $0, 0  => 1. $4 = 0
	x"30050000", -- andi $5, $0, 0  => 2. $5 = 0
	x"30060000", -- andi $6, $0, 0  => 3. $6 = 0
	x"8CC10200", -- lw $1, 512($6)   =>  4. $1 = MEM[$6 + 512]
	x"10200007", -- beq $1, $0, 7	 =>  5. PC = PC + 7 
	x"00812020", -- add $4, $4, $1 	 =>  6. $4 = $4 + $1 
	x"8CC20100", -- lw $2, 256($6)   =>  7. $2 = MEM[$6 + 256]
	x"00410819", -- multu $2, $1	 =>  8.
	x"00001812", -- mflo $3			 =>  9. $3 = mflo
	x"00A32820", -- add $5, $5, $3 	 => 10. $5 = $5 + $3
	x"20C60001", -- addi $6, $6, 1 	 => 11. $6 = $6 + 1
	x"08000004", -- j 4				 => 12. PC = 4
	x"00A4001B", -- divu $5, $4		 => 13.
	x"00003812", -- mflo $7			 => 14. $7 = mflo
	x"0800000F"  -- j 15			 => 15. PC = 15
);*/

type RAMtype is array (natural range<>) of unsigned(31 downto 0);
constant program: RAMtype(0 to 255) := (x"30000000", -- andi $0, $0, 0  => 0. $0 = 0
	x"30040000", -- andi $4, $0, 0  => 1. $4 = 0
	x"30050000", -- andi $5, $0, 0  => 2. $5 = 0
	x"30060000", -- andi $6, $0, 0  => 3. $6 = 0
	x"8CC10200", -- lw $1, 512($6)   =>  4. $1 = MEM[$6 + 512]
	x"10200007", -- beq $1, $0, 7	 =>  5. PC = PC + 7 
	x"00812020", -- add $4, $4, $1 	 =>  6. $4 = $4 + $1 
	x"8CC20100", -- lw $2, 256($6)   =>  7. $2 = MEM[$6 + 256]
	x"00410819", -- multu $2, $1	 =>  8.
	x"00001812", -- mflo $3			 =>  9. $3 = mflo
	x"00A32820", -- add $5, $5, $3 	 => 10. $5 = $5 + $3
	x"20C60001", -- addi $6, $6, 1 	 => 11. $6 = $6 + 1
	x"08000004", -- j 4				 => 12. PC = 4
	x"00A4001B", -- divu $5, $4		 => 13.
	x"00003812", -- mflo $7			 => 14. $7 = mflo
	x"0800000F",  -- j 15			 => 15. PC = 15
	others => (others => '0'));

constant values: RAMtype(0 to 255) := (X"00000002",X"00000001",X"00000007",X"00000004",X"00000005",X"00000002",X"00000003",X"0000000A", others => (others => '0'));  
constant weights: RAMtype(0 to 255) := (X"00000003",X"00000003",X"00000003",X"00000005",X"00000004",X"00000001",X"00000002",X"00000001", others => (others => '0')); 
constant blank: RAMtype(0 to 255) := (others => (others => '0'));


end package;