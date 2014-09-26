-- File automatically generated by "cdfg2hdl".
-- Filename: testrounding_tb.vhd
-- Date: 28 April 2011 02:50:35 PM
-- Author: Nikolaos Kavvadias (C) 2009, 2010, 2011, 2012, 2013, 2014

library IEEE, STD;
use STD.textio.all;
use IEEE.numeric_std.all;
use WORK.fixed_float_types.all;
use WORK.fixed_pkg.all;
use WORK.fixed_extensions_pkg.all;
use IEEE.std_logic_1164.all;

entity testrounding_tb is
end testrounding_tb;

architecture tb_arch of testrounding_tb is
  component testrounding
    port (
      clk : in std_logic;
      reset : in std_logic;
      start : in std_logic;
      ok : out sfixed(3 downto -4)
    );
  end component;
  signal clk : std_logic;
  signal reset : std_logic;
  signal start : std_logic;
  signal ok : sfixed(3 downto -4);
  -- Profiling signals
  signal ncycles : integer;
  -- Constant declarations
  constant CLK_PERIOD : time := 10 ns;
begin
  uut : testrounding
    port map (
      clk => clk,
      reset => reset,
      start => start,
      ok => ok
    );
    
  CLK_GEN_PROC: process(clk)
  begin
    if (clk = 'U') then
      clk <= '1';
    else
      clk <= not clk after CLK_PERIOD/2;
    end if;
  end process CLK_GEN_PROC;    

  RESET_START_STIM: process
  begin
    reset <= '1';
    start <= '0';
    wait for CLK_PERIOD;
    reset <= '0';
    start <= '1';
    wait for 2000*CLK_PERIOD;
    -- Automatic end of the current simulation.
    assert false
      report "NONE. End simulation time reached"
      severity failure;    
  end process RESET_START_STIM;

end tb_arch;
