-- biblioteka STD jest wlaczana automatycznie do projektu
entity SIGNAL_SELECT is			        -- deklaracja sprzegu 'SIGNAL_SELECT'
  port (  A  : in  natural range 0 to 15;	-- deklaracja portu wejsciowego 'A'
          YA : out bit_vector(3 downto 0); 	-- deklaracja portu wyjsciowego 'YA'
          YP : out bit_vector(3 downto 0) 	-- deklaracja portu wyjsciowego 'YP'
       ); 					-- zakonczenie deklaracji listy portow
end SIGNAL_SELECT;	 			-- zakonczenie deklaracji naglowka

architecture cialo of SIGNAL_SELECT is	        -- deklaracja ciala 'cialo' architektury
begin					        -- poczatek czesci wykonawczej
  with A select YA <= "0001" when 0 to 3,	-- przypisanie portu 'YA' na "0001" gdy portu 'A'<4
                      "0010" when 4 to 7,    	-- lub przypisanie portu 'YA' na "0010" gdy portu 'A'<8
                      "0100" when 8 to 11,    	-- lub przypisanie portu 'YA' na "0010" gdy portu 'A'<12
                      "1000" when others;       -- lub przypisanie portu 'YA'  na "1000"

  process (A) is			        -- lista czulosci procesu ssynchronicznego
  begin						-- czesc wykonawcza procesu
    case A is					-- sekcejny wyboru sygnalem 'S'
      when  0 to  3 => YP <= "0001";            -- przypisanie portu 'YP' na "0001" gdy port 'A'=0..3
      when  4 to  7 => YP <= "0010";	        -- przypisanie portu 'YP' na "0010" gdy port 'A'=4..7
      when  8 to 11 => YP <= "0100";	        -- przypisanie portu 'YP' na "0100" gdy port 'A'=8..11
      when others   => YP <= "1000";	        -- przypisanie portu 'YP' na "1000" gdy inne wartosci 'A'
    end case;
  end process;					-- zakonczenie procesu 
end architecture cialo;			        -- zakonczenie deklaracji ciala 'cialo'
