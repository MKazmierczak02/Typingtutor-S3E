library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity String_printer is
    port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           TxBusy : in  STD_LOGIC;
           DO : out  STD_LOGIC_VECTOR (7 downto 0);
           DORdy : out  STD_LOGIC;
           Busy : out  STD_LOGIC  );
end String_printer;

architecture RTL of String_printer is

  -- FSM
  type state_type is (
    sReset,
    sBusyWait,
    sWE,
    sLoop
    );
  signal State, nextState : state_type; 

  -- String to print
  type STRINGZ is array ( NATURAL range <> ) of CHARACTER;
  constant nStrSize : POSITIVE := 48;
  signal romStr : STRINGZ( 0 to nStrSize - 1 ) := "Hello, it's typing tutor. Let's get it started!" & NUL;

  -- Character index
  signal cntIdx : std_logic_vector( 5 downto 0 ) := ( others => '0' );

begin

  -- Character index
  process ( Clk )
  begin
    if rising_edge( Clk ) then
      if State = sReset then
        cntIdx <= ( others => '0' );
      elsif State = sWE then
        cntIdx <= cntIdx + 1;
      end if;
    end if;
  end process;

  -- FSM
	process ( Clk )
  begin
    if rising_edge( Clk ) then
      if Reset = '1' then
        State <= sReset;
      else
        State <= nextState;
      end if;
    end if;
  end process;
	process( State, TxBusy, cntIdx, romStr )
  begin
    nextState <= State;   -- default is to stay in current State
    
    case State is

      when sReset =>
        nextState <= sBusyWait;

      when sBusyWait =>
        if TxBusy = '0' then
          nextState <= sWE;
        end if;

      when sWE =>   -- WE pulse
        nextState <= sLoop;

      when sLoop =>
        if romStr( conv_integer( cntIdx ) ) /= NUL then
          nextState <= sBusyWait;
        end if;   -- else null; => stay in sLoop till Reset
      
    end case;
  end process;
  
  -- Outputs
  --LCD_WE  <= '1' when State = sWE else '0';
  --LCD_DnI <= '1';
  --LCD_DI <= '0' & 
   -- CONV_STD_LOGIC_VECTOR( CHARACTER'Pos( romStr( conv_integer( cntIdx ) ) ), 7 );
	 
	-- Outputs = process3
 -- with HalfByte select         -- 0-15 => ASCII '0'-'F'
 --   DO <= X"30" when "0000",
  --        X"31" when "0001",
   --       X"32" when "0010",
     --     X"33" when "0011",
       --   X"34" when "0100",
         -- X"35" when "0101",
--          X"36" when "0110",
  --        X"37" when "0111",
    --      X"38" when "1000",
      --    X"39" when "1001",
        --  X"41" when "1010",
--          X"42" when "1011",
  --        X"43" when "1100",
    --      X"44" when "1101",
      --    X"45" when "1110",
        --  X"46" when others;
		  
  DORdy <= '1' when State = sWE else '0';
  Busy  <= '1' when State /= sBusyWait else '0';
  DO <= '0' & CONV_STD_LOGIC_VECTOR( CHARACTER'Pos( romStr( conv_integer( cntIdx ) ) ), 7 );
  
end RTL;

