-- biblioteka STD jest wlaczana automatycznie do projektu

entity PROCESS_IF_ASYNC_TB is		-- pusty sprzeg projektu symulacji
end PROCESS_IF_ASYNC_TB;

architecture behavioural of PROCESS_IF_ASYNC_TB is -- cialo architektoniczne projektu
  signal A  :natural range 0 to 15;	-- symulowane wejscie 'A'
  signal Y : bit_vector(3 downto 0);	-- obserwowane wyjscie 'Y'
begin					-- poczatek czesci wykonawczej architektury

  process is				-- proces bezwarunkowy
  begin					-- czesc wykonawcza procesu
    wait for 10 ns;		        -- odczekanie 10 ns
    A <= (A + 1) mod 16;		-- zwiekszenie 'A' o 1 w zakresie 4 bitow
  end process;				-- zakonczenie procesu

  inst: entity work.PROCESS_IF_ASYNC    -- instancja projektu 'PPROCESS_IF_ASYNC'
    port map (				-- mapowanie portow
      A => A,				-- przypisanie sygnalu 'A' do portu 'A'
      Y => Y				-- przypisanie sygnalu 'Y' do portu 'Y'
    );

end behavioural;			-- zakonczenie ciala architektonicznego
