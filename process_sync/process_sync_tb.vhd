-- biblioteka STD jest wlaczana automatycznie do projektu
entity PROCESS_SYNC_TB is		-- pusty sprzeg projektu symulacji
end PROCESS_SYNC_TB;

architecture behavioural of PROCESS_SYNC_TB is -- cialo architektoniczne projektu
  signal R, C, D, E : bit;		-- symulowane wejscie 'R', 'C', 'D' i 'E'
  signal Q : bit;	                -- obserwowane wyjscie 'Q
begin					-- poczatek czesci wykonawczej architektury

  process is begin			-- proces bezwarunkowy
    R <= '0'; wait for 40 ns;		-- przypisanie R='0' i odczekanie 40 ns
    R <= '1'; wait;			-- przypisanie R='1' i zatrzymanie
  end process;				-- zakonczenie procesu

  process is begin			-- proces bezwarunkowy
    C <= '0'; wait for 10 ns;		-- przypisanie C='0' i odczekanie 10 ns
    C <= '1'; wait for 10 ns;		-- przypisanie C='1' i odczekanie 10 ns
  end process;				-- zakonczenie procesu

  process is begin			-- proces bezwarunkowy
    D <= '0'; wait for 20 ns;		-- przypisanie D='0' i odczekanie 20 ns
    D <= '1'; wait for 20 ns;		-- przypisanie D='1' i odczekanie 20 ns
  end process;				-- zakonczenie procesu

  process is begin			-- proces bezwarunkowy
    E <= '0'; wait for 20 ns;		-- przypisanie E='0' i odczekanie 20 ns
    E <= '1'; wait for 40 ns;		-- przypisanie E='1' i odczekanie 40 ns
  end process;				-- zakonczenie procesu

  process_sync_inst: entity work.PROCESS_SYNC(cialo) -- instancja projektu 'PROCESS_SYNC'
    port map (				-- mapowanie portow
      R => R,				-- przypisanie sygnalu 'R' do portu 'R'
      C => C,				-- przypisanie sygnalu 'C' do portu 'C'
      E => E,				-- przypisanie sygnalu 'E' do portu 'E'
      D => D,				-- przypisanie sygnalu 'D' do portu 'D'
      Q => Q);				-- przypisanie sygnalu 'Q' do portu 'Q'

end behavioural;			-- zakonczenie ciala architektonicznego
