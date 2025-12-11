-- biblioteka STD jest wlaczana automatycznie do projektu
entity PROCESS_IF_LATCH is			-- deklaracja sprzegu 'PROCESS_IF_LATCH'
  port (  A  : in  natural range 0 to 15;	-- deklaracja portu wejsciowego 'A'
          Y  : out bit_vector(3 downto 0) 	-- deklaracja portu wyjsciowego 'Y'
       ); 					-- zakonczenie deklaracji listy portow
end PROCESS_IF_LATCH;	 			-- zakonczenie deklaracji naglowka

architecture cialo of PROCESS_IF_LATCH is	-- deklaracja ciala 'cialo' architektury
begin                                           -- poczatek czesci wykonawczej

  process (A) is				-- lista czulosci procesu synchronicznego
  begin						-- czesc wykonawcza procesu
    Y <= "0000";                                -- likwidacja LATCH: wstepne ustawienie portu 'Y'  na "0000"
    if    (A<4)  then Y <= "0001";     		-- przypisanie portu 'Y' na "0001" dla 'A'<4
    elsif (A<8)  then Y <= "0010";     		-- lub przypisanie portu 'Y' na "0010" dla 'A'<8
    elsif (A<12) then Y <= "0100";     		-- lub przypisanie portu 'Y' na "0100" dla 'A'<12
    end if;					-- zakonczenie instrukcji wyboru
    
  end process;					-- zakonczenie procesu
  
end architecture cialo;			        -- zakonczenie deklaracji ciala 'cialo'



    -- Y <= "0000";                                -- likwidacja LATCH: wstepne ustawienie portu 'Y'  na "0000"
    -- else              Y <= "1000";     	-- lub przypisanie portu 'Y'  na "1000"
  
