-- biblioteka STD jest wlaczana automatycznie do projektu

entity BBUF_TB is			-- pusty sprzeg projektu symulacji
end BBUF_TB;

architecture behavioural of BBUF_TB is	-- cialo architektoniczne projektu

  signal A	:bit;			-- symulowane wejscie A
  signal Y	:bit;			-- obserwowane wyjscie

begin

  process is				-- proces bezwarunkowy
  begin					-- czesc wykonawcza procesu
    A <= '0';				-- przypisanie sygnalowi 'A' wartosci '0'
    wait for 10 ns;			-- odczekanie 10 ns
    A <= '1';				-- przypisanie sygnalowi 'A' wartosci '1'
    wait for 10 ns;			-- odczekanie 10 ns
  end process;				-- zakonczenie procesu

  bbuf_inst: entity work.BBUF(cialo)	-- instancja projektu 'BBUF'
    port map (				-- mapowanie portow
      A => A,				-- przypisanie sygnalu 'A' do portu 'A'
      Y => Y				-- przypisanie sygnalu 'Y' do portu 'Y'
    );
end behavioural;			-- zakonczenie ciala architektonicznego