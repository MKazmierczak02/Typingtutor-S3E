library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;

entity String_printer_2 is
    port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           TxBusy : in  STD_LOGIC;
			  DIRdy : in  STD_LOGIC;			  
			  F0 : in  STD_LOGIC;
			  DI : in STD_LOGIC_VECTOR (7 downto 0);
           DO : out  STD_LOGIC_VECTOR (7 downto 0);
           DORdy : out  STD_LOGIC;           
			  Finished : out  STD_LOGIC;

           Busy : out  STD_LOGIC  );
end String_printer_2;

architecture RTL of String_printer_2 is

  -- FSM
  type state_type is (
    sReset,
    sBusyWait,
    sWE,
    sLoop,
	 sReady,
	 keyboardWait,
	 sKeyboardWE,
	 keyboardBusy,
	 keyboardReady,
	 keyboardFinished
    );
  signal State, nextState : state_type; 

  -- String to print
  type STRINGZ is array ( NATURAL range <> ) of CHARACTER;
  constant nStrSize : POSITIVE := 97;  
  constant textStrSize : POSITIVE := 49;

  signal romStr : STRINGZ( 0 to nStrSize - 1 ) := "Hello, it's typing tutor. Let's get it started! happy girrafe went to lorem ipsum dolor sit amet" & NUL;  
  signal keyboardStr : STRINGZ( 0 to textStrSize - 1 ) := "happy girrafe went to lorem ipsum dolor sit amet" & NUL;

  -- Character index
  signal cntIdx : std_logic_vector( 7 downto 0 ) := ( others => '0' );
  signal cntIdxKeyboard : std_logic_vector( 7 downto 0 ) := ( others => '0' );
  
  signal regDI : STD_LOGIC_VECTOR (7 downto 0);
  
  
  function map_key() return STD_LOGIC_VECTOR is
		variable result: STD_LOGIC_VECTOR (7 downto 0);\
		
	begin
	
	
	
	
	return result;
	end function;

begin
	
  regDI <= DI when rising_edge( Clk) and State = sReady;

  -- FSM
	process ( Clk )
  begin
    if rising_edge( Clk ) then
      if Reset = '1' then
        State <= sReset;
      else
        State <= nextState;
      end if;
		
		if State = sReset then
			cntIdxKeyboard <= ( others => '0' );
        -- nothing
      elsif State = sWE then
			cntIdx <= cntIdx + 1;
		elsif State = sKeyboardWE then
			cntIdxKeyboard <= cntIdxKeyboard + 1;
      end if;
						
		
    end if;
  end process;
  
	process( State, TxBusy, DIRdy, cntIdx, romStr)
	--variable charArray : character_array(nStrSize);
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

      when sReady =>
        if DIRdy = '1' then
			 nextState <= sWE;
			end if;
			 
			 --read(keyboardStr, charArray);
			 --charArray(cntIdxKeyboard+1) := 'X';
			 --write(keyboardStr, charArray);
			 
			 -- przeniesienie blokady o pozycje dalej
		  
		  
      when sLoop =>
		  if romStr( conv_integer( cntIdx ) ) /= NUL then
			 nextState <= sBusyWait;
		  else
			nextState <= keyboardWait;
		  end if;   
    
	 
	 -- keyboardWait - stan poczatkowy oczekiwania na znak z klawiatury. if DIRdy = 1, to (sprawdzamy znak i jesli ok) idziemy dalej
	 -- jesli gotowy do wyswietlenia, to idziemy dalej
	 when keyboardWait =>
		if DIRdy = '1' then
		
			-- czy znak jest ok
			-- DI =
			
			-- klikajac literke H, przechodzi do nastepnego znaku.
			-- TODO: porownanie znaku przychodzacego do tego ktory poiwnineb byc.
			 --if DI = "00110011"  then
			if DI = STD_LOGIC_VECTOR( to_unsigned ( CHARACTER'Pos( keyboardStr( conv_integer( cntIdxKeyboard ) )), 7)) then
			
				if keyboardStr( conv_integer( cntIdxKeyboard ) ) /= NUL then
					 nextState <= keyboardReady;
				  else
					nextState <= keyboardFinished;
			  end if;
		  
		  end if;
		
			   
		end if;
		
		-- stan oczekiwania na TxBusy = '0'
	 when keyboardReady =>
			if TxBusy = '0' then 
				nextState <= sKeyboardWE;
			 end if;
	 
	  -- stan wyslania znaku do monitora
	 when sKeyboardWE =>   -- WE pulse
			nextState <= keyboardBusy;
	 
	 -- czekanie na F0 = 0
	 -- przejscie na keyboardWait
	 when keyboardBusy =>
			if F0 = '0' then
				nextState <= keyboardWait;
			end if;
			
	when keyboardFinished =>
			if F0 = '0' then
				
			end if;
		
	 end case;
	 
	 
  end process;
		  
		
  DORdy <= '1' when State = sWE OR State = sKeyboardWE else '0';  
  Finished <= '1' when State = keyboardFinished else '0';

  DO <= '0' & CONV_STD_LOGIC_VECTOR( CHARACTER'Pos( romStr( conv_integer( cntIdx ) ) ), 7 ) when (State = sBusyWait OR State = sWE OR State = sReady OR State = sLoop) else '0' & CONV_STD_LOGIC_VECTOR( CHARACTER'Pos( keyboardStr( conv_integer( cntIdxKeyboard ) ) ), 7 );
  
end RTL;
-- A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   SPACE,
-- 1C, 32, 21, 23, 24, 2B, 34, 33, 43, 3B, 42, 4B, 3A, 31, 44, 4D, 15, 2D, 1B, 2C, 3C, 2A, 1D, 22, 35, 1A, 29

















