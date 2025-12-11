-- biblioteka STD jest wlaczana automatycznie do projektu

entity PROCESS_IF_SYNC is			-- deklaracja sprzegu PROCESS_IF_SYNC'
  port ( R : in  bit;				-- deklaracja portu inicjalizacji 'R'
         C : in  bit; 				-- deklaracja portu zegarowego 'C'
         Z : in  natural;			-- deklaracja portu wejsciowego 'Z'
         Y : out bit	 	                -- deklaracja portu wyjsciowego 'Y'
       ); 					-- zakonczenie deklaracji listy portow
end PROCESS_IF_SYNC;	 			-- zakonczenie deklaracji naglowka

architecture cialo of PROCESS_IF_SYNC is	-- deklaracja ciala 'cialo' architektury

  signal L : natural;		                -- deklaracja sygnalu 'L'

begin
						-- poczatek czesci wykonawczej
  process (R, C) is				-- lista czulosci procesu synchronicznego
  begin						-- czesc wykonawcza procesu
    if (R='0') then				-- warunek asynchronicznej inicjalizacji
      L <= 0;					-- asynchroniczne przypisanie stalej do sygnalu 'L'
      Y <= '0';					-- asynchroniczne przypisanie stalej do sygnalu 'Y'
    elsif  (C'event and C='1') then		-- warunek wystapienia zbocza narastajacego 'C'
      L <= (L+1) mod Z;				-- inkrementacja cykliczna 'L' w zakresie od 0 do 'Z'-1 
      Y <= '0';					-- wstepne ustawienie sygnalu 'Y' na '0'
      if (L>=Z/2) then Y <= '1'; end if;        -- warunkowe ustawienie sygnalu 'Y' na '1' gdy 'L'>='Z'/2
    end if;					-- zakonczenie instrukcji wyboru
  end process;					-- zakonczenie procesu
  
end architecture cialo;			        -- zakonczenie deklaracji ciala 'cialo'
