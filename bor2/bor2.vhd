-- bibioteka STD jest wlaczana automatycznie do projektu

entity BOR2 is			-- deklaracja sprzegu 'BOR2'
 port (	A : in   bit;		-- deklaracja portu wejsciowego 'A'
        B : in   bit; 		-- deklaracja portu wejsciowego 'B'
        Y : out bit		-- deklaracja portu wyjsciowego 'Y'
      ); 			-- zakonczenie deklaracji listy portow
end BOR2; 			-- zakonczenie deklaracji sprzegu

architecture cialo of BOR2 is	-- deklaracja ciala 'cialo' architektury

  signal S :bit;		-- deklaracja sygnalu 'S'

begin				-- poczatek czesci wykonawczej
  NOR_inst: entity work.bnor2	-- pierwsze dolaczenie projektu 'BNOR2'
    port map (	A => A, B => B,	-- podlaczenie wejsc 'A' i 'B' projektu
		Y => S ); 	-- podlaczenie wyjscia 'Y'  projektu
  NOT_inst: entity work.bnor2 	-- drugie dolaczenie projektu 'BNOR'
    port map (	A => S, B => S,	-- podlaczenie wejsc 'A' i 'B' projektu
		Y => Y ); 	-- podlaczenie wyjscia 'Y' projektu
end architecture cialo;		-- zakonczenie deklaracji ciala 'cialo'
