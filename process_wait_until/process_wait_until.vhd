-- biblioteka STD jest wlaczana automatycznie do projektu

entity PROCESS_WAIT_UNTIL is		-- pusty sprzeg projektu symulacji
end entity PROCESS_WAIT_UNTIL;

architecture cialo of PROCESS_WAIT_UNTIL is -- cialo architektoniczne projektu
  signal A, B :natural;                 -- symulowane wejscie A
begin                                   -- poczatek czesci wykonawczej architektury

  process is				-- proces bezwarunkowy
  begin					-- czesc wykonawcza procesu
    wait for 10 ns;                     -- odczekanie 10 ns
    A <= A+1;                           -- zwiekszenie A o 1
  end process;				-- zakonczenie procesu

  process is    			-- proces bezwarunkowy
  begin					-- czesc wykonawcza procesu
    B <= 100;                           -- ustawienie B na wartosc 100
    wait until A=5;                     -- odczekanie na stan A=5
    B <= B+1;                           -- zwiekszenie B o 1
    wait until A=7;                     -- odczekanie na stan A=5
    B <= B+2;                           -- zwiekszenie B o 2
    wait;                               -- odczekanie do konca symulacji
  end process;				-- zakonczenie procesu

end cialo;			-- zakonczenie ciala architektonicznego	
