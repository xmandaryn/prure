-- biblioteka STD jest wlaczana automatycznie do projektu

entity PROC_PAR_INTEG_ASYNC is			-- deklaracja sprzegu 'PROC_SER_INTEG_ASYNC'
  port (  A1, A2 : in  natural range 0 to 15;	-- deklaracja portu wejsciowego 'A1' i 'A2'
          L,  H  : out natural range 0 to 15; 	-- deklaracja portu wyjsciowego 'L' i 'H'
          L1, H1 : out natural range 0 to 15; 	-- deklaracja portu wyjsciowego 'L1' i 'H1'
          L2, H2 : out natural range 0 to 15 	-- deklaracja portu wyjsciowego 'L2' i 'H2'
       ); 					-- zakonczenie deklaracji listy portow
end PROC_PAR_INTEG_ASYNC;	 		-- zakonczenie deklaracji naglowka

architecture cialo of PROC_PAR_INTEG_ASYNC is	-- deklaracja ciala 'cialo' architektury
  signal S: natural range 0 to 15;              -- deklaracja sygnalu 'S'
begin
						-- poczatek czesci wykonawczej
  proc1: process (A1, A2) is			-- lista czulosci procesu asynchronicznego
  begin						-- czesc wykonawcza procesu
    L <= A1;                                    -- poczatkowe przypisanie wartosci 'A1' do 'L'
    if (A2<A1) then  L<= A2; end if;		-- warunkowe przypisanie wartosci 'A2' do 'L'
  end process;					-- zakonczenie procesu
  
  proc2: process (A1, A2) is			-- lista czulosci procesu asynchronicznego
  begin						-- czesc wykonawcza procesu
    H <= A1;                                    -- poczatkowe przypisanie wartosci 'A1' do 'H'
    if (A2>A1) then  H<= A2; end if;		-- warunkowe przypisanie wartosci 'A2' do 'H'
  end process;					-- zakonczenie procesu
  
  proc12: process (A1, A2) is		        -- lista czulosci procesu asynchronicznego
  begin						-- czesc wykonawcza procesu
    L1 <= A1;                                   -- poczatkowe przypisanie wartosci 'A1' do 'L1'
    if (A2<A1) then  L1<= A2; end if;		-- warunkowe przypisanie wartosci 'A2' do 'L1'
    H1 <= A1;                                   -- poczatkowe przypisanie wartosci 'A1' do 'H1'
    if (A2>A1) then  H1<= A2; end if;		-- warunkowe przypisanie wartosci 'A2' do 'H1'
  end process;					-- zakonczenie procesu
  
  proc21: process (A1, A2) is		        -- lista czulosci procesu asynchronicznego
  begin						-- czesc wykonawcza procesu
    H2 <= A1;                                   -- poczatkowe przypisanie wartosci 'A1' do 'H2'
    L2 <= A1;                                   -- poczatkowe przypisanie wartosci 'A1' do 'L2'
    if (A2>A1) then  H2<= A2; end if;		-- warunkowe przypisanie wartosci 'A2' do 'H2'
    if (A2<A1) then  L2<= A2; end if;		-- warunkowe przypisanie wartosci 'A2' do 'L2'
  end process;					-- zakonczenie procesu
  
end architecture cialo;			        -- zakonczenie deklaracji ciala 'cialo'
