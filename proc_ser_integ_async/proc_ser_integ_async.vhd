-- biblioteka STD jest wlaczana automatycznie do projektu

entity PROC_SER_INTEG_ASYNC is			-- deklaracja sprzegu 'PROC_SER_INTEG_ASYNC'
  port (  A1 : in  natural range 0 to 15;	-- deklaracja portu wejsciowego 'A1'
          A2 : in  natural range 0 to 15;	-- deklaracja portu wejsciowego 'A2'
          B  : out bit_vector(3 downto 0); 	-- deklaracja portu wyjsciowego 'B'
          BS : out bit_vector(3 downto 0); 	-- deklaracja portu wyjsciowego 'BS'
          BZ : out bit_vector(3 downto 0) 	-- deklaracja portu wyjsciowego 'BZ'
       ); 					-- zakonczenie deklaracji listy portow
end PROC_SER_INTEG_ASYNC;	 		-- zakonczenie deklaracji naglowka

architecture cialo of PROC_SER_INTEG_ASYNC is	-- deklaracja ciala 'cialo' architektury
  signal S, SY: natural range 0 to 15;          -- deklaracja sygnalow 'S' i 'SY'
begin
						-- poczatek czesci wykonawczej
  proc1: process (A1, A2) is			-- lista czulosci procesu asynchronicznego
  begin						-- czesc wykonawcza procesu
    S <= (A1+A2)/2;				-- przypisanie do 'S' wartosci sredniej z 'A1' i 'A2'
  end process;					-- zakonczenie procesu
  
  proc2: process (S) is				-- lista czulosci procesu asynchronicznego
  begin						-- czesc wykonawcza procesu
    if    (S<4)  then B <= "0001";     		-- przypisanie portu 'B' na "0001" gdy sygnal 'S'<4
    elsif (S<8)  then B <= "0010";     		-- lub przypisanie portu 'B' na "0010" gdy sygnal 'S'<8
    elsif (S<12) then B <= "0100";     		-- lub przypisanie portu 'B' na "0100" gdy sygnal 'S'<12
    else              B <= "1000";     		-- lub przypisanie portu 'B'  na "1000"
    end if;					-- zakonczenie instrukcji wyboru
  end process;					-- zakonczenie procesu

  proc12S: process (A1, A2, SY) is		-- lista czulosci procesu asynchronicznego
  begin						-- czesc wykonawcza procesu
    SY <= (A1+A2)/2;				-- przypisanie do 'SY' wartosci sredniej z 'A1' i 'A2'
    if    (SY<4)  then BS <= "0001";     	-- przypisanie portu 'BS' na "0001" gdy sygnal 'S'<4
    elsif (SY<8)  then BS <= "0010";     	-- lub przypisanie portu 'BS' na "0010" gdy sygnal 'S'<8
    elsif (SY<12) then BS <= "0100";     	-- lub przypisanie portu 'BS' na "0100" gdy sygnal 'S'<12
    else               BS <= "1000";     	-- lub przypisanie portu 'BS'  na "1000"
    end if;					-- zakonczenie instrukcji wyboru
  end process;					-- zakonczenie procesu
  
  proc12Z: process (A1, A2) is		        -- lista czulosci procesu asynchronicznego
    variable Z :natural range 0 to 15;          -- deklaracja zmiennej 'Z'
  begin						-- czesc wykonawcza procesu
    Z := (A1+A2)/2;				-- przypisanie do 'Z' wartosci sredniej z 'A1' i 'A2'
    if    (Z<4)  then BZ <= "0001";     	-- przypisanie portu 'BZ' na "0001" gdy zmienna 'Z'<4
    elsif (Z<8)  then BZ <= "0010";     	-- lub przypisanie portu 'BZ' na "0010" gdy zmienna 'Z'<8
    elsif (Z<12) then BZ <= "0100";     	-- lub przypisanie portu 'BZ' na "0100" gdy zmienna 'Z'<12
    else              BZ <= "1000";     	-- lub przypisanie portu 'BZ'  na "1000"
    end if;					-- zakonczenie instrukcji wyboru
  end process;					-- zakonczenie procesu
  
end architecture cialo;			        -- zakonczenie deklaracji ciala 'cialo'
