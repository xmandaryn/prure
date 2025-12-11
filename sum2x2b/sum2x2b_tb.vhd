-- biblioteka STD jest wlaczana automatycznie do projektu

entity SUM2X2B_TB is			-- pusty sprzeg projektu symulacji
end SUM2X2B_TB;

architecture behavioural of SUM2X2B_TB is	-- cialo architektoniczne projektu

  signal A	:bit_vector(1 downto 0);	-- symulowane wejscie A
  signal B	:bit_vector(1 downto 0);	-- symulowane wejscie B
  signal S	:bit_vector(1 downto 0);	-- obserwowane wyjscie S
  signal P	:bit;				-- obserwowane wyjscie P

begin

  process is					-- proces bezwarunkowy
  begin						-- czesc wykonawcza procesu
    A <= "00";					-- przypisanie sygnalowi 'A' wartosci
    wait for 10 ns;				-- odczekanie 10 ns
    A <= "01";					-- przypisanie sygnalowi 'A' wartosci
    wait for 10 ns;				-- odczekanie 10 ns
    A <= "10";					-- przypisanie sygnalowi 'A' wartosci
    wait for 10 ns;				-- odczekanie 10 ns
    A <= "11";					-- przypisanie sygnalowi 'A' wartosci
    wait for 10 ns;				-- odczekanie 10 ns
  end process;					-- zakonczenie procesu

  process is					-- proces bezwarunkowy
  begin						-- czesc wykonawcza procesu
    B <= "00";					-- przypisanie sygnalowi 'B' wartosci
    wait for 40 ns;				-- odczekanie 10 ns
    B <= "01";					-- przypisanie sygnalowi 'B' wartosci
    wait for 40 ns;				-- odczekanie 10 ns
    B <= "10";					-- przypisanie sygnalowi 'B' wartosci
    wait for 40 ns;				-- odczekanie 10 ns
    B <= "11";					-- przypisanie sygnalowi 'B' wartosci
    wait for 40 ns;				-- odczekanie 10 ns
  end process;					-- zakonczenie procesu

  SUM2X2B_inst: entity work.SUM2X2B(cialo)	-- instancja projektu 'SUM2X2B'
    port map (					-- mapowanie portow
      A => A,					-- przypisanie sygnalu 'A do portu 'A'
      B => B,					-- przypisanie sygnalu 'B do portu 'B'
      S => S,					-- przypisanie sygnalu 'S do portu 'S'
      P => P					-- przypisanie sygnalu 'P do portu 'P'
    );	
end behavioural;				-- zakonczenie ciala architektonicznego