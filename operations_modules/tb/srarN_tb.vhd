----------------------------------------------------------------------------------
-- Company: FUN!
-- Engineer: Jackson Baker
-- 
-- Create Date: 01/13/2022 10:19:24 AM
-- Design Name: 
-- Module Name: srarN_tb- testbench
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
use ieee.numeric_std.all;

entity srarN_tb is
    generic(
        N : integer : = 32
    );
    port(
        input_A : in std_logic_vector(N-1 downto 0);
        shift_amt: in std_logic_vector(N-1 downto 0);
        out_Y: out std_logic_vector(N-1 downto 0);
    );
end entity;

architecture tb of srarN_tb is
        signal input_A : std_logic_vector(N-1 downto 0)  := (others => '0');
        signal shift_amt: std_logic_vector(N-1 downto 0) := (others => '0');
        signal out_Y: std_logic_vector(N-1 downto 0)     := (others => '0');
    
    type record is record := (
        input_A : std_logic_vector(N-1 downto 0)  
        shift_amt: std_logic_vector(N-1 downto 0)
        out_Y: std_logic_vector(N-1 downto 0) 
    )


begin
