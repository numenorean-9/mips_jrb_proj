----------------------------------------------------------------------------------
-- Company: FUN!
-- Engineer: Jackson Baker
-- 
-- Create Date: 01/13/2022 10:19:24 AM
-- Design Name: 
-- Module Name: sllN_tb- testbench
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

entity sllN_tb is
    generic(
        N : integer := 32
    );
end entity sllN_tb;

architecture tb of sllN_tb is
component sllN is
    port(
        input_A : in std_logic_vector(N-1 downto 0);
        shift_amt :  in std_logic_vector(N-1 downto 0);
        out_Y : out std_logic_vector(N-1 downto 0)
    );
end component;

signal input_A : std_logic_vector(N-1 downto 0) := (others => '0');
signal shift_amt : std_logic_vector(N-1 downto 0) := (others => '0');
signal out_Y : std_logic_vector(N-1 downto 0) := (others => '0');

type sll_tests is record
    input_A : std_logic_vector(N-1 downto 0);
    shift_amt : std_logic_vector(N-1 downto 0);
    out_Y : std_logic_vector(N-1 downto 0);
end record;

type test_array is array (natural range <>) of sll_tests;

constant tests : test_array := (
    --input_A        shift_amt        out_y --
    (x"00000001",   x"00000005",    x"00000020"),
    (x"00000001",   x"00000004",    x"00000010")


);

function vec2str(vec: std_logic_vector) return string is
    variable stmp : string(vec'high+1 downto 1);
    variable counter: integer := 1;
    begin
    for i in vec'reverse_range loop
        stmp(counter) := std_logic'image(vec(i))(2);
        counter := counter +1;
     end loop;
     return stmp;
    end vec2str;  

begin
    dut : entity work.sllN
    port map(input_A => input_A, shift_amt => shift_amt, out_Y => out_Y );

    stim_process : process begin
        for i in tests'range loop
            input_A <= tests(i).input_A;
            shift_amt <= tests(i).shift_amt;
            wait for 100ns;
            assert (tests(i).out_Y = out_Y) report "error in output,product is: " & vec2str(out_Y) & ", and should be: "& vec2str(tests(i).out_Y);
        end loop;

        assert false
		report "Testbench Concluded."
		severity failure;
    end process;

end;