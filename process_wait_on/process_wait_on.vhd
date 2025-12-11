-- biblioteka STD jest wlaczana automatycznie do projektu
entity PROCESS_WAIT_ON is		-- pusty sprzeg projektu symulacji
end entity PROCESS_WAIT_ON;

architecture cialo of PROCESS_WAIT_ON is -- cialo architektoniczne projektu
  signal A, B, C :natural;              -- symulowane wejscie A
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
    C <= C+1;                           -- zwiekszenie C o 1
    wait on A, B;                       -- odczekanie na zmiane stanu A
  end process;				-- zakonczenie procesu

end cialo;			        -- zakonczenie ciala architektonicznego	
