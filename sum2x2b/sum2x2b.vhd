-- bibioteka STD jest wlaczana automatycznie do projektu

entity SUM2X2B is			-- deklaracja sprzegu 'SUM2X4B'
 port (	A : in  bit_vector(1 downto 0);	-- deklaracja portu wejsciowego 'A'
        B : in  bit_vector(1 downto 0);	-- deklaracja portu wejsciowego 'B'
        S : out bit_vector(1 downto 0);	-- deklaracja portu wyjsciowego 'S'
        P : out bit			-- deklaracja portu wyjsciowego 'P'
      ); 				-- zakonczenie deklaracji listy portow
end SUM2X2B; 				-- zakonczenie deklaracji sprzegu

architecture cialo of SUM2X2B is	-- deklaracja ciala 'cialo' architektury

  signal K :bit_vector(1 downto 0);	-- deklaracja sygnalu 'K'

begin					-- poczatek czesci wykonawczej

  SUM3B_inst0: entity work.SUM3B	-- pierwsze dolaczenie projektu 'SUMB'
    port map (A=>A(0), B=>B(0), C=>'0', -- mapowanie portow wejsciowych 
                    S=>S(0), P=>K(0)); 	-- mapowanie portow wyjsciowych

  SUM3B_inst1: entity work.SUM3B	-- drugie dolaczenie projektu 'SUMB'
    port map (A=>A(1), B=>B(1), C=>K(0),-- mapowanie portow wejsciowych 
                  S=>S(1), P=>K(1)); 	-- mapowanie portow wyjsciowych

  P <= K(1);				-- instrukcja przypisania sygnalu do portu

end architecture cialo;			-- zakonczenie deklaracji ciala 'cialo'
