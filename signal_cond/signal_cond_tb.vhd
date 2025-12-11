-- biblioteka STD jest wlaczana automatycznie do projektu

entity SIGNAL_COND_TB is		-- pusty sprzeg projektu symulacji
end SIGNAL_COND_TB;

architecture behavioural of SIGNAL_COND_TB is -- cialo architektoniczne projektu
  signal A  :natural range 0 to 15;	-- symulowane wejscie 'A'
  signal YA : bit_vector(3 downto 0);	-- obserwowane wyjscie 'YA'
  signal YP : bit_vector(3 downto 0);	-- obserwowane wyjscie 'YP'
begin					-- poczatek czesci wykonawczej architektury

  process is				-- proces bezwarunkowy
  begin					-- czesc wykonawcza procesu
    wait for 10 ns;		        -- odczekanie 10 ns
    A <= (A + 1) mod 16;		-- zwiekszenie 'A' o 1 w zakresie 4 bitow
  end process;				-- zakonczenie procesu

  inst: entity work.SIGNAL_COND    -- instancja projektu 'SIGNAL_COND'
    port map (				-- mapowanie portow
      A  => A,				-- przypisanie sygnalu 'R' do portu 'R'
      YA => YA,				-- przypisanie sygnalu 'YA' do portu 'YA'
      YP => YP				-- przypisanie sygnalu 'YP' do portu 'YP'
    );

end behavioural;			-- zakonczenie ciala architektonicznego
