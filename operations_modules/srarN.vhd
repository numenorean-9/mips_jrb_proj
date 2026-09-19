----------------------------------------------------------------------------------
-- Company: FUN!
-- Engineer: Jackson Baker
-- 
-- Create Date: 01/13/2022 10:19:24 AM
-- Design Name: 
-- Module Name: srarN- behavioral
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

entity srarN is
    generic (
        N : integer := 32
    );
    port(
        input_A : std_logic_vector(N-1 downto 0);
        shift_amt: std_logic_vector(N-1 downto 0);
        out_Y : std_logic_vector(N-1 downto 0)
    );
end entity;

architecture behavioral of srarN is
    type shift_array is array (natural range <>) of std_logic_vector(N-1 downto 0);
    signal arr: shifty_array := (others => (others => '0'));
begin

    generate_shift_array: for i in 0 to N-1 generate
        arr(i)(N-1-i downto 0) <= input_A(N-1 downto i);
        sign_extnd : if i > 0 generate
            arr(i)(N-1 downto i)
        end generate;
    end generate;
    
    out_Y <= arr(to_integer(unsigned(shift_amt)));

end behavioral;