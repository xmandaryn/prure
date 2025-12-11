-- biblioteka STD jest wlaczana automatycznie do projektu

entity PROC_PAR_INTEG_ASYNC_TB is               -- pusty sprzeg projektu symulacji
end PROC_PAR_INTEG_ASYNC_TB;

architecture behavioural of PROC_PAR_INTEG_ASYNC_TB is -- cialo architektoniczne projektu
  signal A1, A2    :natural range 0 to 15;      -- symulowane wejscia 'A1', 'A2'
  signal L, L1, L2 :natural range 0 to 15;      -- obserwowane wyjscia 'L', 'L1', 'L2'
  signal H, H1, H2 :natural range 0 to 15;      -- obserwowane wyjscia 'H', 'H1', 'H2'
begin	                                        -- poczatek czesci wykonawczej architektury

  process is				        -- proces bezwarunkowy
  begin			                        -- czesc wykonawcza procesu
    wait for 10 ns;		                -- odczekanie 10 ns
    A1 <= (A1 + 4) mod 16;		        -- zwiekszenie 'A' o 4 w zakresie 4 bitow
    A2 <= (A2 + 3) mod 16;		        -- zwiekszenie 'A' o 3 w zakresie 4 bitow
  end process;				        -- zakonczenie procesu

  inst: entity work.PROC_PAR_INTEG_ASYNC        -- instancja projektu 'PROC_PAR_INTEG_ASYNC'
    port map (				        -- mapowanie portow
      A1 => A1,				        -- przypisanie sygnalu 'A1' do portu 'A1'
      A2 => A2,				        -- przypisanie sygnalu 'A2' do portu 'A2'
      L  => L,				        -- przypisanie sygnalu 'L' do portu 'L'
      H  => H,				        -- przypisanie sygnalu 'H' do portu 'H'
      L1 => L1,				        -- przypisanie sygnalu 'L1' do portu 'L1'
      H1 => H1,				        -- przypisanie sygnalu 'H1' do portu 'H1'
      L2 => L2,				        -- przypisanie sygnalu 'L2' do portu 'L2'
      H2 => H2				        -- przypisanie sygnalu 'H2' do portu 'H2'
    );

end behavioural;			        -- zakonczenie ciala architektonicznego
