-- biblioteka STD jest wlaczana automatycznie do projektu

entity BOR2_TB is			-- pusty sprzeg projektu symulacji
end BOR2_TB;

architecture behavioural of BOR2_TB is	-- cialo architektoniczne projektu

  signal A	:bit;			-- symulowane wejscie A
  signal B	:bit;			-- symulowane wejscie B
  signal Y	:bit;			-- obserwowane wyjscie

begin

  process is				-- proces bezwarunkowy
  begin					-- czesc wykonawcza procesu
    A <= '0';				-- przypisanie sygnalowi 'A' wartosci '0'
    wait for 10 ns;			-- odczekanie 10 ns
    A <= '1';				-- przypisanie sygnalowi 'A' wartosci '1'
    wait for 10 ns;			-- odczekanie 10 ns
  end process;				-- zakonczenie procesu

  process is				-- proces bezwarunkowy
  begin					-- czesc wykonawcza procesu
    B <= '0';				-- przypisanie sygnalowi 'B' wartosci '0'
    wait for 20 ns;			-- odczekanie 20 ns
    B <= '1';				-- przypisanie sygnalowi 'B' wartosci '1'
    wait for 20 ns;			-- odczekanie 20 ns
  end process;				-- zakonczenie procesu

  bor2_inst: entity work.BOR2(cialo)	-- instancja projektu 'BOR2'
    port map (				-- mapowanie portow
      A => A,				-- przypisanie sygnalu 'A do portu 'A'
      B => B,				-- przypisanie sygnalu 'B do portu 'B'
      Y => Y				-- przypisanie sygnalu 'Y do portu 'Y'
    );
end behavioural;			-- zakonczenie ciala architektonicznego