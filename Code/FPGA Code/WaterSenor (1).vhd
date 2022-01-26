library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ADC_8_bit is
  port (analog_in : in real range -10.0 to +10.0;
        digital_out : out std_logic_vector(7 downto 0));
end entity;

Architecture original of ADC_8_bit is
    signal instantly_digitized_signal : std_logic_vector(7 downto 0);
  
  FUNCTION ADC_8b_10v_bipolar ( analog_in: real range -10.0 to +10.0) RETURN std_logic_vector IS
     variable digitized_signal: integer;
    variable d_out: std_logic_vector(7 downto 0);
     begin
      digitized_signal := integer(analog_in * 12.8);
    if (digitized_signal < 0) then    
        if (digitized_signal < -128) then
           digitized_signal := -128;   
        end if;
    elsif (digitized_signal > 127) then  
        digitized_signal := 127;
      end if;
    --end if;
    d_out := std_logic_vector(to_signed(digitized_signal, d_out'length));
    return d_out;
  end ADC_8b_10v_bipolar;
begin

   digital_out <= std_logic_vector (ADC_8b_10v_bipolar (analog_in));

end original;

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity Water_Sensor is 
port (digital_in : in std_logic_vector(7 downto 0) ; Water_level : buffer std_logic_vector(1 downto 0));
end Water_sensor;



Architecture Water_Sensor_arch of Water_Sensor is 

component ADC_8_bit is 
port (analog_in : in real range -10.0 to +10.0;
        digital_out : out std_logic_vector(7 downto 0));	--check comp
end component;
signal dig_in : std_logic_vector(7 downto 0) ;
begin
AK: ADC_8_bit port map (analog_in=> 5.0 , digital_out=>dig_in);
process(dig_in) is
    begin
 
        case Water_level is
            when "00" =>
                dig_in<="00000000"; --	empty	
            when "01" =>
                dig_in<="10000000"; --	50%
            when "10" =>
                dig_in<="11000000" ;-- 	75%
            when "11" =>
                dig_in<="11111111" ;--	full
            when others => 
                dig_in<="10000000"; -- 50% got water not accurate
        end case;
 
    end process;


end Water_Sensor_arch;


--We need bridge function input:sensors reading ,output: out1 , out2  