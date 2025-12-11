-- biblioteka STD jest wlaczana automatycznie do projektu
entity PROCESS_IF_MIX is			-- deklaracja sprzegu PROCESS_IF_MIX'
  port ( R : in  bit;				-- deklaracja portu inicjalizacji 'R'
         C : in  bit; 				-- deklaracja portu zegarowego 'C'
         Z : in  natural;			-- deklaracja portu wejsciowego 'Z'
         Y : out bit_vector(3 downto 0)         -- deklaracja portu wyjsciowego 'Y'
       ); 					-- zakonczenie deklaracji listy portow
end PROCESS_IF_MIX;	 			-- zakonczenie deklaracji naglowka

architecture cialo of PROCESS_IF_MIX is	        -- deklaracja ciala 'cialo' architektury
  signal L : natural;		                -- deklaracja sygnalu 'L'
begin
						-- poczatek czesci wykonawczej
  process (R, C) is				-- lista czulosci procesu synchronicznego
  begin						-- czesc wykonawcza procesu
    if (R='0') then				-- warunek asynchronicznej inicjalizacji
      L <= 0;					-- asynchroniczne przypisanie stalej do sygnalu 'L'
    elsif  (C'event and C='1') then		-- warunek wystapienia zbocza narastajacego 'C'
      L <= (L+1) mod Z;				-- inkrementacja cykliczna 'L' w zakresie od 0 do 'Z'-1 
    end if;					-- zakonczenie instrukcji wyboru
  end process;					-- zakonczenie procesu

  process (L) is				-- lista czulosci procesu synchronicznego
  begin						-- czesc wykonawcza procesu
    if    (L<(Z/4)*1) then Y <= "0001";		-- warunkowe przypisanie portu 'Y' na "0001" gdy portu 'L'<1/4*Z
    elsif (L<(Z/4)*2) then Y <= "0010";		-- lub warunkowe przypisanie portu 'Y' na "0010" gdy portu 'L'<2/4*Z
    elsif (L<(Z/4)*3) then Y <= "0100";		-- lub warunkowe przypisanie portu 'Y' na "0100" gdy portu 'L'<3/4*Z
    else                   Y <= "1000";		-- lub warunkowe przypisanie portu 'Y'  na "1000"
    end if;					-- zakonczenie instrukcji wyboru
  end process;					-- zakonczenie procesu
  
end architecture cialo;			        -- zakonczenie deklaracji ciala 'cialo'
