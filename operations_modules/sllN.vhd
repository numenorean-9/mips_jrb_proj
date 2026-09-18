----------------------------------------------------------------------------------
-- Company: FUN!
-- Engineer: Jackson Baker
-- 
-- Create Date: 01/13/2022 10:19:24 AM
-- Design Name: 
-- Module Name: sllN- behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Logical left shift for a generic N bit input, shifted by an M bit input
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sllN is
    generic( 
        N : integer := 32
    );
    port(
        input_A : in std_logic_vector(N-1 downto 0);
        shift_amt :  in std_logic_vector(N-1 downto 0);
        out_Y : out std_logic_vector(N-1 downto 0)
    );
end sllN;

architecture behavioral of sllN is 
    type shifty_array is array (N-1 downto 0) of std_logic_vector(N-1 downto 0);
    signal arr : shifty_array := (others => (others => '0'));
begin

    generate_shift_arr: for i in 0 to N-1 generate
        arr(i)(N-1 downto i) <= input_A(N-1-i downto 0);
        zero_appnd: if i > 0 generate 
            arr(i)(i-1 downto 0) <= (others => '0');
        end generate;
    end generate;
    
    out_Y <= arr(to_integer(unsigned(shift_amt)));
end behavioral;