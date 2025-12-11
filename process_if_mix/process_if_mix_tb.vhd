-- biblioteka STD jest wlaczana automatycznie do projektu
entity PROCESS_MIX_SYNC_TB is		-- pusty sprzeg projektu symulacji
end PROCESS_MIX_SYNC_TB;

architecture behavioural of PROCESS_MIX_SYNC_TB is -- cialo architektoniczne projektu
  signal R : bit;			-- symulowane wejscie 'A'
  signal C : bit; 			-- symulowane wejscie 'C'
  signal Y : bit_vector(3 downto 0);    -- obserwowane wyjscie 'Y'
begin					-- poczatek czesci wykonawczej architektury

  process is				-- proces bezwarunkowy
  begin					-- czesc wykonawcza procesu
    R <= '0'; wait for 20 ns;		-- przypisanie R='0' i odczekanie 20 ns
    R <= '1'; wait;			-- przypisanie R='1' i zatrzymanie
  end process;				-- zakonczenie procesu

  process is				-- proces bezwarunkowy
  begin					-- czesc wykonawcza procesu
    C <= '0'; wait for 10 ns;		-- przypisanie C='0' i odczekanie 10 ns
    C <= '1'; wait for 10 ns;		-- przypisanie C='1' i odczekanie 10 ns
  end process;				-- zakonczenie procesu

  inst: entity work.PROCESS_IF_MIX      -- instancja projektu 'PROCESS_IF_MIX'
    port map (				-- mapowanie portow
      R => R,				-- przypisanie sygnalu 'R' do portu 'R'
      C => C,				-- przypisanie sygnalu 'C' do portu 'C'
      Z => 8,				-- przypisanie wartoœci 8 do portu 'Z'
      Y => Y				-- przypisanie sygnalu 'Y' do portu 'Y'
    );

end behavioural;			-- zakonczenie ciala architektonicznego
