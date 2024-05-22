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
			  NewLine : out  STD_LOGIC;
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
	 fBusyWait,
	 fWE,	 
	 fReset,
	 fReady,
	 fLoop,
	 scoreBusyWait,
	 scoreWE,
	 scoreReady,
	 scoreLoop,
    tutorFinished
    );
  signal State, nextState : state_type; 

  -- String to print
  type STRINGZ is array ( NATURAL range <> ) of CHARACTER;
  constant nStrSize : POSITIVE := 97;  
  constant textStrSize : POSITIVE := 49;  
  constant finishedStrSize : POSITIVE := 21;  
  constant scoreStrSize : POSITIVE := 3;

	-- strings
  signal romStr : STRINGZ( 0 to nStrSize - 1 ) := "Hello, it's typing tutor. Let's get it started! happy giraffe went to lorem ipsum dolor sit amet" & NUL;  
  signal keyboardStr : STRINGZ( 0 to textStrSize - 1 ) := "happy giraffe went to lorem ipsum dolor sit amet" & NUL;  
  signal finishedStr : STRINGZ( 0 to finishedStrSize - 1 ) := "Finished. Mistakes: " & NUL;  
  signal scoreStr : STRINGZ( 0 to scoreStrSize  ) := "00" & NUL & NUL;

  -- Character index
  signal cntIdx : std_logic_vector( 7 downto 0 ) := ( others => '0' );
  signal cntIdxKeyboard : std_logic_vector( 7 downto 0 ) := ( others => '0' );  
  signal cntIdxFinished : std_logic_vector( 7 downto 0 ) := ( others => '0' );  
  signal cntIdxScore : std_logic_vector( 7 downto 0 ) := ( others => '0' );


  
  signal regDI : STD_LOGIC_VECTOR (7 downto 0);
  
  signal mistakeCount : integer := 0;
  
  -- Function to convert integer to ASCII characters
    function int_to_str(num : integer) return STRINGZ is
        variable str : STRINGZ(0 to scoreStrSize-1);
        variable tmp : integer := num;
        variable i : integer := scoreStrSize - 1;
    begin
        for j in 0 to scoreStrSize-1 loop
            str(j) := ' ';
        end loop;
        while (tmp > 0) loop
            str(i) := CHARACTER'VAL(tmp mod 10 + CHARACTER'POS('0'));
            tmp := tmp / 10;
            i := i - 1;
        end loop;
        return str;
    end function;

 -- Function to map character to keycode
 function char_to_keycode(c : CHARACTER) return STD_LOGIC_VECTOR is
 begin
	  case c is
			when 'a' => return "00011100";
			when 'b' => return "00110010";
			when 'c' => return "00100001";
			when 'd' => return "00100011";
			when 'e' => return "00100100";
			when 'f' => return "00101011";
			when 'g' => return "00110100";
			when 'h' => return "00110011";
			when 'i' => return "01000011";
			when 'j' => return "00111011";
			when 'k' => return "01000010";
			when 'l' => return "01001011";
			when 'm' => return "00111010";
			when 'n' => return "00110001";
			when 'o' => return "01000100";
			when 'p' => return "01001101";
			when 'q' => return "00010101";
			when 'r' => return "00101101";
			when 's' => return "00011011";
			when 't' => return "00101100";
			when 'u' => return "00111100";
			when 'v' => return "00101010";
			when 'w' => return "00011101";
			when 'x' => return "00100010";
			when 'y' => return "00110101";
			when 'z' => return "00011010";
			when ' ' => return "00101001";
			when others => return "00000000";
	  end case;
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
					 cntIdxFinished <= ( others => '0' );					 
					 cntIdx <= ( others => '0' );					 
					 cntIdxScore <= ( others => '0' );



            elsif State = sWE then
                cntIdx <= cntIdx + 1;
            elsif State = sKeyboardWE then
                cntIdxKeyboard <= cntIdxKeyboard + 1;
				elsif State = fWE then
                cntIdxFinished <= cntIdxFinished + 1;
				elsif State = scoreWE then
                cntIdxScore <= cntIdxScore + 1;
					 
            end if;
                        
        end if;
    end process;


    process( State, TxBusy, DIRdy, cntIdx, romStr, cntIdxKeyboard, keyboardStr, DI, mistakeCount)
    begin
        nextState <= State;   
        
        case State is
				-- wyswietlenie tekstu na start
            when sReset =>
				if Reset = '1' then
					nextState <= sReset;
				else
                nextState <= sBusyWait;
            end if;

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
             
            when sLoop =>
                if romStr( conv_integer( cntIdx ) ) /= NUL then
                    nextState <= sBusyWait;
                else
                    nextState <= keyboardWait;
                end if;   


				-- pobieranie znakow z klawiatury
            when keyboardWait =>
                if DIRdy = '1' then
                    if DI = char_to_keycode(keyboardStr(conv_integer(cntIdxKeyboard))) then
                        if keyboardStr( conv_integer( cntIdxKeyboard ) ) /= NUL then
                            nextState <= keyboardReady;
                        end if;
						  else
								mistakeCount <= mistakeCount + 1;
                    end if;
						  if keyboardStr( conv_integer( cntIdxKeyboard ) ) = NUL then		
								nextState <= fBusyWait;
                    end if;
                end if;
                
            when keyboardReady =>
                if TxBusy = '0' then 
                    nextState <= sKeyboardWE;
                end if;
         
            when sKeyboardWE =>   -- WE pulse
                nextState <= keyboardBusy;
         
            when keyboardBusy =>
                if F0 = '0' then
                    nextState <= keyboardWait; 
                end if;
					 
				 --- wyswietlenie napisow koncowych
				 when fReset =>
				 nextState <= fBusyWait;

            when fBusyWait =>
                if TxBusy = '0' then
                    nextState <= fReady;
                end if;

            when fWE =>   -- WE pulse
                nextState <= fLoop;

            when fReady =>
                nextState <= fWE;
             
            when fLoop =>
                if finishedStr( conv_integer( cntIdxFinished ) ) /= NUL then
                    nextState <= fBusyWait;
                else
							scoreStr <= int_to_str(mistakeCount) & NUL;
                    nextState <= scoreReady;
                end if;   
					 
					 
					 --- wyswietlenie wyniku
					 

            when scoreBusyWait =>
                if TxBusy = '0' then
                    nextState <= scoreReady;
                end if;

            when scoreWE =>   -- WE pulse
                nextState <= scoreLoop;

            when scoreReady =>
                nextState <= scoreWE;
             
            when scoreLoop =>
                if scoreStr( conv_integer( cntIdxScore ) ) /= NUL then
                    nextState <= scoreBusyWait;
                else
                    nextState <= tutorFinished;
                end if;   
                
            when tutorFinished =>
                if F0 = '0' then
                end if;
            
        end case;
    end process;
          
    DORdy <= '1' when State = sWE OR State = sKeyboardWE OR State = fWE OR State = scoreWE else '0';  
    Finished <= '1' when State = tutorFinished else '0';
	 NewLine<= '1' when State = sReset else '0';

    DO <= '0' & CONV_STD_LOGIC_VECTOR( CHARACTER'Pos( romStr( conv_integer( cntIdx ) ) ), 7 ) when (State = sBusyWait OR State = sWE OR State = sReady OR State = sLoop) 
	 else '0' & CONV_STD_LOGIC_VECTOR( CHARACTER'Pos( finishedStr( conv_integer( cntIdxFinished ) ) ), 7 ) when (State = fBusyWait OR State = fWE OR State = sReady OR State = sLoop) 	 
	 else '0' & CONV_STD_LOGIC_VECTOR( CHARACTER'Pos( scoreStr( conv_integer( cntIdxScore ) ) ), 7 ) when (State = scoreBusyWait OR State = scoreWE OR State = scoreReady OR State = scoreLoop) 
	 else '0' & CONV_STD_LOGIC_VECTOR( CHARACTER'Pos( keyboardStr( conv_integer( cntIdxKeyboard ) ) ), 7 );
  
end RTL;
