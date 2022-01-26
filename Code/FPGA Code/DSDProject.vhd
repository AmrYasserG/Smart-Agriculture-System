library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity DSDProject is

port ( SoilS ,waterSign :  in std_logic;
       buzzer, pumpSign , noWaterSoil , a,b,c,d,e,f,g : out std_logic);
         
end DSDProject;

Architecture DSDProject_arc of DSDProject is
begin

process(SoilS , waterSign )
begin

if (SoilS = '0') and (waterSign  = '1')  then 
    buzzer <= '0'; 
	 noWaterSoil <= '0' ;
	 pumpSign <= '0';
	 a <= '1';
	 b <= '0';
	 c <= '0';
	 d <= '1';
	 e <= '1';
	 f <= '1';
	 g <= '1'; -- will display 1 = all good
end if ;

if (SoilS = '0') and (waterSign  = '0')  then 
    buzzer <= '1';
    noWaterSoil <= '0';
	 pumpSign <= '0';
	 a <= '0';
	 b <= '0';
	 c <= '1';
	 d <= '0';
	 e <= '0';
	 f <= '1';
	 g <= '0';  -- will display 2 = the tank needs water
end if ;

if (SoilS = '1') and (waterSign  = '1')  then 
  noWaterSoil <= '1';
  pumpSign <= '1';
  buzzer <= '0' ;
  a <= '0';
  b <= '0';
  c <= '0';
  d <= '0';
  e <= '1';
  f <= '1';
  g <= '0';  -- will display 3 = soil needs water 
end if ;  

 if (SoilS = '1') and (waterSign  = '0')  then 
  noWaterSoil <= '1';
  buzzer <= '1' ;
  pumpSign <= '0';
  a <= '1';
  b <= '0';
  c <= '0';
  d <= '1';
  e <= '1';
  f <= '0';
  g <= '0';  -- will display 4 = tank and soil need water
end if;


end process;

end DSDProject_arc;00oo