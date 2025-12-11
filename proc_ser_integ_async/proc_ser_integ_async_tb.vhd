-- biblioteka STD jest wlaczana automatycznie do projektu

entity PROC_SER_INTEG_ASYNC_TB is               -- pusty sprzeg projektu symulacji
end PROC_SER_INTEG_ASYNC_TB;

architecture behavioural of PROC_SER_INTEG_ASYNC_TB is -- cialo architektoniczne projektu
  signal A1, A2    : natural range 0 to 15;     -- symulowane wejscia 'A1', 'A2'
  signal B, BS, BZ : bit_vector(3 downto 0);    -- obserwowane wyjscia 'B', 'BS', 'BZ'
begin	                                        -- poczatek czesci wykonawczej architektury

  process is				        -- proces bezwarunkowy
  begin			                        -- czesc wykonawcza procesu
    wait for 10 ns;		                -- odczekanie 10 ns
    A1 <= (A1 + 1) mod 16;		        -- zwiekszenie 'A' o 1 w zakresie 4 bitow
    A2 <= (A2 + 3) mod 16;		        -- zwiekszenie 'A' o 3 w zakresie 4 bitow
  end process;				        -- zakonczenie procesu

  inst: entity work.PROC_SER_INTEG_ASYNC        -- instancja projektu 'PROC_SER_INTEG_ASYNC'
    port map (				        -- mapowanie portow
      A1 => A1,				        -- przypisanie sygnalu 'A1' do portu 'A1'
      A2 => A2,				        -- przypisanie sygnalu 'A2' do portu 'A2'
      B  => B,				        -- przypisanie sygnalu 'B' do portu 'B'
      BS => BS,				        -- przypisanie sygnalu 'BS' do portu 'BS'
      BZ => BZ				        -- przypisanie sygnalu 'BZ' do portu 'BZ'
    );

end behavioural;			        -- zakonczenie ciala architektonicznego
