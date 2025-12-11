-- bibioteka STD jest wlaczana automatycznie do projektu

entity BBUF is				-- deklaracja sprzegu 'BUF'
  port ( A : in   bit;			-- deklaracja portu wejsciowego 'A'
	 Y : out bit			-- deklaracja portu wyjsciowego 'Y'
       ); 				-- zakonczenie deklaracji listy portow
end BBUF;	 			-- zakonczenie deklaracji sprzegu

architecture cialo of BBUF is		-- deklaracja ciala 'cialo' architektury

begin					-- poczatek czesci wykonawczej architektury
					-- poczatek czesci wykonawczej
  OR_inst : entity work.bor2		-- dolaczenie projektu 'BOR2'
    port map (A=>A, B=>A, Y=>Y);	-- podlaczenie wejsc i wyjsc  projektu

end architecture cialo;			-- zakonczenie deklaracji ciala 'cialo'
