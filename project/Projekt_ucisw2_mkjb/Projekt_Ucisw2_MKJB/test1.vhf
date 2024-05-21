--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : test1.vhf
-- /___/   /\     Timestamp : 05/21/2024 10:37:58
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl E:/repo/Typingtutor-S3E/project/Projekt_ucisw2_mkjb/Projekt_Ucisw2_MKJB/test1.vhf -w E:/repo/Typingtutor-S3E/project/Projekt_ucisw2_mkjb/Projekt_Ucisw2_MKJB/test1.sch
--Design Name: test1
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity test1 is
   port ( btn_south : in    std_logic; 
          Clk_50MHz : in    std_logic; 
          PS2_Clk   : in    std_logic; 
          PS2_Data  : in    std_logic; 
          SW_0      : in    std_logic; 
          SW_1      : in    std_logic; 
          SW_2      : in    std_logic; 
          LED_0     : out   std_logic; 
          LED_1     : out   std_logic; 
          VGA_B     : out   std_logic; 
          VGA_G     : out   std_logic; 
          VGA_HS    : out   std_logic; 
          VGA_R     : out   std_logic; 
          VGA_VS    : out   std_logic);
end test1;

architecture BEHAVIORAL of test1 is
   attribute BOX_TYPE   : string ;
   signal XLXN_2      : std_logic_vector (7 downto 0);
   signal XLXN_21     : std_logic;
   signal XLXN_23     : std_logic;
   signal XLXN_47     : std_logic;
   signal XLXN_51     : std_logic_vector (7 downto 0);
   signal XLXN_52     : std_logic;
   signal XLXN_54     : std_logic;
   signal XLXN_57     : std_logic;
   signal XLXN_59     : std_logic;
   signal LED_0_DUMMY : std_logic;
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component VGAtxt48x20
      port ( Char_DI     : in    std_logic_vector (7 downto 0); 
             Home        : in    std_logic; 
             NewLine     : in    std_logic; 
             Goto00      : in    std_logic; 
             Clk_Sys     : in    std_logic; 
             Clk_50MHz   : in    std_logic; 
             CursorOn    : in    std_logic; 
             ScrollEn    : in    std_logic; 
             ScrollClear : in    std_logic; 
             Busy        : out   std_logic; 
             VGA_HS      : out   std_logic; 
             VGA_VS      : out   std_logic; 
             VGA_RGB     : out   std_logic; 
             Char_WE     : in    std_logic);
   end component;
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component PS2_Kbd
      port ( PS2_Clk   : in    std_logic; 
             PS2_Data  : in    std_logic; 
             Clk_50MHz : in    std_logic; 
             E0        : out   std_logic; 
             F0        : out   std_logic; 
             DO_Rdy    : out   std_logic; 
             DO        : out   std_logic_vector (7 downto 0); 
             Clk_Sys   : in    std_logic);
   end component;
   
   component String_printer_2
      port ( Clk      : in    std_logic; 
             Reset    : in    std_logic; 
             TxBusy   : in    std_logic; 
             DIRdy    : in    std_logic; 
             F0       : in    std_logic; 
             DI       : in    std_logic_vector (7 downto 0); 
             DORdy    : out   std_logic; 
             Finished : out   std_logic; 
             Busy     : out   std_logic; 
             DO       : out   std_logic_vector (7 downto 0));
   end component;
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
begin
   LED_0 <= LED_0_DUMMY;
   XLXI_7 : GND
      port map (G=>XLXN_23);
   
   XLXI_9 : VGAtxt48x20
      port map (Char_DI(7 downto 0)=>XLXN_2(7 downto 0),
                Char_WE=>XLXN_59,
                Clk_Sys=>Clk_50MHz,
                Clk_50MHz=>Clk_50MHz,
                CursorOn=>SW_0,
                Goto00=>XLXN_23,
                Home=>XLXN_23,
                NewLine=>XLXN_23,
                ScrollClear=>SW_2,
                ScrollEn=>SW_1,
                Busy=>XLXN_52,
                VGA_HS=>VGA_HS,
                VGA_RGB=>XLXN_21,
                VGA_VS=>VGA_VS);
   
   XLXI_14 : BUF
      port map (I=>XLXN_21,
                O=>VGA_G);
   
   XLXI_15 : BUF
      port map (I=>XLXN_21,
                O=>VGA_B);
   
   XLXI_16 : BUF
      port map (I=>XLXN_21,
                O=>VGA_R);
   
   XLXI_17 : PS2_Kbd
      port map (Clk_Sys=>Clk_50MHz,
                Clk_50MHz=>Clk_50MHz,
                PS2_Clk=>PS2_Clk,
                PS2_Data=>PS2_Data,
                DO(7 downto 0)=>XLXN_51(7 downto 0),
                DO_Rdy=>XLXN_54,
                E0=>XLXN_47,
                F0=>LED_0_DUMMY);
   
   XLXI_21 : String_printer_2
      port map (Clk=>Clk_50MHz,
                DI(7 downto 0)=>XLXN_51(7 downto 0),
                DIRdy=>XLXN_57,
                F0=>LED_0_DUMMY,
                Reset=>btn_south,
                TxBusy=>XLXN_52,
                Busy=>open,
                DO(7 downto 0)=>XLXN_2(7 downto 0),
                DORdy=>XLXN_59,
                Finished=>LED_1);
   
   XLXI_22 : AND3B2
      port map (I0=>XLXN_47,
                I1=>LED_0_DUMMY,
                I2=>XLXN_54,
                O=>XLXN_57);
   
end BEHAVIORAL;


