-- biblioteka STD jest wlaczana automatycznie do projektu

entity PROCESS_ASYNC_TB is			-- pusty sprzeg projektu symulacji
end PROCESS_ASYNC_TB;

architecture cialo of PROCESS_ASYNC_TB is	-- cialo architektoniczne projektu

  signal A	:bit_vector(3 downto 0);	-- symulowane wejscie 'A'
  signal S	:bit_vector(3 downto 0);	-- obserwowane wyjscie 'S'

begin

  process is					-- proces bezwarunkowy
  begin						-- czesc wykonawcza procesu
    A <= "0000";				-- przypisanie sygna?owi 'A' wartosci
    wait for 10 ns;				-- odczekanie 10 ns
    A <= "0110";				-- przypisanie sygna?owi 'A' wartosci
    wait for 10 ns;				-- odczekanie 10 ns
    A <= "0100";				-- przypisanie sygna?owi 'A' wartosci
    wait for 10 ns;				-- odczekanie 10 ns
    A <= "1100";				-- przypisanie sygna?owi 'A' wartosci
    wait for 10 ns;				-- odczekanie 10 ns
    A <= "1111";				-- przypisanie sygna?owi 'A' wartosci
    wait for 10 ns;				-- odczekanie 10 ns
  end process;					-- zakonczenie procesu

  PROCESS_ASYNC_inst: entity work.PROCESS_ASYNC(cialo) -- instancja projektu 'PROCESS_ASYNC'
    port map (					-- mapowanie portow
      A => A,					-- przypisanie sygnalu 'A do portu 'A'
      S => S					-- przypisanie sygnalu 'S do portu 'S'
    );	
end cialo;					-- zakonczenie ciala architektonicznego