-- biblioteka STD jest wlaczana automatycznie do projektu

entity PROCESS_WAIT_FOR is		-- pusty sprzeg projektu symulacji
end entity PROCESS_WAIT_FOR;

architecture cialo of PROCESS_WAIT_FOR is -- cialo architektoniczne projektu
  signal A, B :natural;                 -- symulowane wejscia A i B, inicjowane na 0 (lewa wartoœæ podtypu 'natural')
begin                                   -- poczatek czesci wykonawczej architektury

  process is				-- proces bezwarunkowy
  begin					-- czesc wykonawcza procesu
    wait for 10 ns;                     -- odczekanie 10 ns
    A <= A+1;                           -- zwiekszenie A o 1
  end process;				-- zakonczenie procesu

  process is    			-- proces bezwarunkowy
  begin					-- czesc wykonawcza procesu
    B <= 100;                           -- ustawienie B na wartosc 100
    wait for 0 ns;                     -- odczekanie 20 ns
    B <= B+1;                           -- zwiekszenie B o 1
    B <= B+2;                           -- zwiekszenie B o 2 (nadpisanie)
    wait for 30 ns;                     -- odczekanie 30 ns
    B <= B+2;                           -- zwiekszenie B o 2
    wait;                               -- odczekanie do konca symulacji
  end process;				-- zakonczenie procesu

end cialo;				-- zakonczenie ciala architektonicznego	
