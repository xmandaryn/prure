-- biblioteka STD jest wlaczana automatycznie do projektu

entity PROCESS_ASYNC is				-- deklaracja sprzegu 'PROCESS_ASYNC'
 port (	A : in  bit_vector(3 downto 0);		-- deklaracja portu wejsciowego 'A'
        S : out bit_vector(3 downto 0)		-- deklaracja portu wyjsciowego 'S'
      ); 					-- zakonczenie deklaracji listy portow
end PROCESS_ASYNC; 				-- zakonczenie deklaracji sprzegu

architecture cialo of PROCESS_ASYNC is		-- deklaracja ciala 'cialo' architektury

begin						-- poczatek czesci wykonawczej

  process (A) is				-- lista czulosci procesu asynchronicznego
    variable AN, SN : natural ;--range 0 to 15;	                -- deklaracja zmiennych dla procesu
  begin						-- poczatek czesci wykonawczej

    AN := 0;					-- przypisanie wartosci stalej do zmiennej
    if (A(0)='1') then AN := AN+1; end if;	-- warunkowa modydyfikacja zmiennej
    if (A(1)='1') then AN := AN+2; end if;	-- warunkowa modydyfikacja zmiennej
    if (A(2)='1') then AN := AN+4; end if;	-- warunkowa modydyfikacja zmiennej
    if (A(3)='1') then AN := AN+8; end if;	-- warunkowa modydyfikacja zmiennej
    
    SN := (AN + 1) MOD 16;			-- operacja sumowania oraz modulo (sumowanie na 4 bitach)

    S <= (others => '0');			-- ustawienie wartosci bitow sygnalu S na '0' 
    if SN>=8 then SN := SN-8; S(3) <= '1'; end if; -- warunkowa modydyfikacja zmiennej oraz bitu sygnalu 
    if SN>=4 then SN := SN-4; S(2) <= '1'; end if; -- warunkowa modydyfikacja zmiennej oraz bitu sygnalu
    if SN>=2 then SN := SN-2; S(1) <= '1'; end if; -- warunkowa modydyfikacja zmiennej oraz bitu sygnalu
    if SN>=1 then SN := SN-1; S(0) <= '1'; end if; -- warunkowa modydyfikacja zmiennej oraz bitu sygnalu

  end process;					-- zakonczenie procesu

end architecture cialo;			-- zakonczenie deklaracji ciala 'cialo'
