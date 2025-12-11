-- biblioteka STD jest wlaczana automatycznie do projektu

entity PROCESS_CASE_RANGE is			-- deklaracja sprzegu 'PROCESS_CASE_ASYNC'
  port (  A  : in  natural range 0 to 15;	-- deklaracja portu wejsciowego 'A'
          Y  : out bit_vector(3 downto 0) 	-- deklaracja portu wyjsciowego 'Y'
       ); 					-- zakonczenie deklaracji listy portow
end PROCESS_CASE_RANGE;	 			-- zakonczenie deklaracji naglowka

architecture cialo of PROCESS_CASE_RANGE is	-- deklaracja ciala 'cialo' architektury

begin
						-- poczatek czesci wykonawczej
  process (A) is				-- lista czulosci procesu synchronicznego
  begin						-- czesc wykonawcza procesu
    case A is					-- sekcejny wyboru sygnalem 'A'
      when  0 to  3 => Y <= "0001";             -- przypisanie portu 'Y' na "0001" gdy port 'A'=0..3
      when  4 to  7 => Y <= "0010";	        -- przypisanie portu 'Y' na "0010" gdy port 'A'=4..7
      when  8 to 11 => Y <= "0100";	        -- przypisanie portu 'Y' na "0100" gdy port 'A'=8..11
      when others   => Y <= "1000";	        -- przypisanie portu 'Y' na "1000" gdy inne wartosci 'A'
    end case;                                   -- zakonczenie instrukcji selekcji
  end process;					-- zakonczenie procesu
  
end architecture cialo;			        -- zakonczenie deklaracji ciala 'cialo'
