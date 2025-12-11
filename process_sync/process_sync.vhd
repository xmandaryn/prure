-- biblioteka STD jest wlaczana automatycznie do projektu

entity PROCESS_SYNC is				-- deklaracja sprzegu PROCESS_SYNC'
  port ( R : in  bit;				-- deklaracja portu inicjalizacji 'R'
         C : in  bit; 				-- deklaracja portu zegarowego 'C'
         E : in  bit;		                -- deklaracja portu zapisu 'E'
         D : in  bit;		                -- deklaracja portu wejsciowego 'D'
         Q : out bit	 	                -- deklaracja portu wyjsciowego 'Q
       ); 					-- zakonczenie deklaracji listy portow
end PROCESS_SYNC;	 			-- zakonczenie deklaracji naglowka

architecture cialo of PROCESS_SYNC is		-- deklaracja ciala 'cialo' architektury

  signal S : bit;		                -- deklaracja sygnalu 'S'

begin
						-- poczatek czesci wykonawczej
  process (R, C) is				-- lista czulosci procesu synchronicznego
  begin						-- czesc wykonawcza procesu
    if (R='0') then				-- warunek asynchronicznej inicjalizacji
      S <= '0';					-- asynchroniczne przypisanie stalej do sygnalu
    elsif  (C'event and C='1') then		-- warunek wystapienia zbocza narastajacego 'C'
      if (E='1') then				-- warunek zapisu synchronicznego
        S <= D;					-- przypisanie synchroniczne sygnalu
      end if;					-- zakonczenie instrukcji wyboru
    end if;					-- zakonczenie instrukcji wyboru
  end process;					-- zakonczenie procesu
  
  Q <= S ;					-- przypisanie sygnalu do wyjscia
  
end architecture cialo;			-- zakonczenie deklaracji ciala 'cialo'
