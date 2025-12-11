-- biblioteka STD jest wlaczana automatycznie do projektu
entity SIGNAL_COND is			        -- deklaracja sprzegu 'SIGNAL_COND'
  port (  A  : in  natural range 0 to 15;	-- deklaracja portu wejsciowego 'A'
          YA : out bit_vector(3 downto 0); 	-- deklaracja portu wyjsciowego 'YA'
          YP : out bit_vector(3 downto 0) 	-- deklaracja portu wyjsciowego 'YP'
       ); 					-- zakonczenie deklaracji listy portow
end SIGNAL_COND;	 			-- zakonczenie deklaracji naglowka

architecture cialo of SIGNAL_COND is	        -- deklaracja ciala 'cialo' architektury
begin						-- poczatek czesci wykonawczej
  YA <= "0001" when (A<4)  else    		-- przypisanie portu 'YA' na "0001" gdy portu 'A'<4
        "0010" when (A<8)  else    		-- lub przypisanie portu 'YA' na "0010" gdy portu 'A'<8
        "0100" when (A<12) else    		-- lub przypisanie portu 'YA' na "0010" gdy portu 'A'<12
        "1000";                     		-- lub przypisanie portu 'YA'  na "1000"

  process (A) is				-- lista czulosci procesu asynchronicznego
  begin						-- czesc wykonawcza procesu
    if    (A<4)  then YP <= "0001";    		-- przypisanie portu 'Y' na "0001" gdy portu 'A'<4
    elsif (A<8)  then YP <= "0010";    		-- lub przypisanie portu 'Y' na "0010" gdy portu 'A'<8
    elsif (A<12) then YP <= "0100";    		-- lub przypisanie portu 'Y' na "0100" gdy portu 'A'<12
    else              YP <= "1000";    		-- lub przypisanie portu 'Y'  na "1000"
    end if;					-- zakonczenie instrukcji wyboru
  end process;					-- zakonczenie procesu
  
end architecture cialo;			        -- zakonczenie deklaracji ciala 'cialo'
