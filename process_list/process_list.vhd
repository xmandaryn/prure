-- biblioteka STD jest wlaczana automatycznie do projektu

entity PROCESS_LIST is		        -- pusty sprzeg projektu symulacji
end entity PROCESS_LIST;

architecture cialo of PROCESS_LIST is   -- cialo architektoniczne projektu

  signal A, B, C1, C2 :natural;         -- symulowane wejscie A, B, C1 i C2

begin                                   -- poczatek czesci wykonawczej architektury

  process is				-- proces bezwarunkowy
  begin					-- czesc wykonawcza procesu
    wait for 10 ns;                     -- odczekanie 10 ns
    A <= A+1;                           -- zwiekszenie A o 1
  end process;				-- zakonczenie procesu

  process is				-- proces bezwarunkowy
  begin					-- czesc wykonawcza procesu
    wait for 25 ns;                     -- odczekanie 10 ns
    B <= B+1;                           -- zwiekszenie B o 1
  end process;				-- zakonczenie procesu

  process is    			-- proces bezwarunkowy
  begin					-- czesc wykonawcza procesu
    C1 <= C1+1;                         -- zwiekszenie C1 o 1
    wait on A, B;                       -- oczekiwanie na zmiane dowolnego sygnalu
  end process;				-- zakonczenie procesu

  process (A, B) is    			-- proces z lista sygnalow
  begin					-- czesc wykonawcza procesu
    C2 <= C2+1;                         -- zwiekszenie C2 o 1
  end process;				-- zakonczenie procesu

end cialo;			        -- zakonczenie ciala architektonicznego	
