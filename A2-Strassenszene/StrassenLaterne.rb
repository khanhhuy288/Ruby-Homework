require "Kreis"
require "Dreieck"
require "Rechteck"

class StrassenLaterne
  def initialize()
    @tag = true
    @schirm = Kreis.new(120,60,40,"orange",false)
    @stiel = Rechteck.new(116,90,10,80,"green",false)
    @fuss = Rechteck.new(84,165,70,15,"blue",false)
    @leuchtstrahl1 = Rechteck.new(90,97,3,25,"yellow",false)
    @leuchtstrahl2 = Rechteck.new(100,97,3,25,"yellow",false)
    @leuchtstrahl3 = Rechteck.new(135,97,3,25,"yellow",false)
    @leuchtstrahl4 = Rechteck.new(145,97,3,25,"yellow",false)
  end

  # macht die Stehlampte sichtbar
  def sichtbar_machen
    @fuss.sichtbar_machen
    @stiel.sichtbar_machen
    @schirm.sichtbar_machen
    unless @tag
      @leuchtstrahl1.sichtbar_machen
      @leuchtstrahl2.sichtbar_machen
      @leuchtstrahl3.sichtbar_machen
      @leuchtstrahl4.sichtbar_machen
    end
  end

  # macht die Stehlampe unsichtbar
  def unsichtbar_machen
    @fuss.unsichtbar_machen
    @stiel.unsichtbar_machen
    @schirm.unsichtbar_machen
    @leuchtstrahl1.unsichtbar_machen
    @leuchtstrahl2.unsichtbar_machen
    @leuchtstrahl3.unsichtbar_machen
    @leuchtstrahl4.unsichtbar_machen
  end

  def vertikal_bewegen(anzahl_punkte)
    @fuss.vertikal_bewegen(anzahl_punkte)
    @stiel.vertikal_bewegen(anzahl_punkte)
    @schirm.vertikal_bewegen(anzahl_punkte)
    @leuchtstrahl1.vertikal_bewegen(anzahl_punkte)
    @leuchtstrahl2.vertikal_bewegen(anzahl_punkte)
    @leuchtstrahl3.vertikal_bewegen(anzahl_punkte)
    @leuchtstrahl4.vertikal_bewegen(anzahl_punkte)
  end

  def horizontal_bewegen(anzahl_punkte)
    @fuss.horizontal_bewegen(anzahl_punkte)
    @stiel.horizontal_bewegen(anzahl_punkte)
    @schirm.horizontal_bewegen(anzahl_punkte)
    @leuchtstrahl1.horizontal_bewegen(anzahl_punkte)
    @leuchtstrahl2.horizontal_bewegen(anzahl_punkte)
    @leuchtstrahl3.horizontal_bewegen(anzahl_punkte)
    @leuchtstrahl4.horizontal_bewegen(anzahl_punkte)
  end

  def bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @fuss.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @stiel.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @schirm.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @leuchtstrahl1.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @leuchtstrahl2.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @leuchtstrahl3.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @leuchtstrahl4.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
  end

  # Zum Ändern der Leuchtfarbe werden alle Leuchtstrahlen in die neue Farbe geändert
  def leucht_farbe_aendern(farbe)
    @leuchtstrahl1.farbe_aendern(farbe)
    @leuchtstrahl2.farbe_aendern(farbe)
    @leuchtstrahl3.farbe_aendern(farbe)
    @leuchtstrahl4.farbe_aendern(farbe)
  end

  def breite
    @fuss.breite
  end

  def links
    @fuss.obere_linke_ecke.x
  end

  def rechts
    @fuss.obere_linke_ecke.x + @fuss.breite
  end

  def position
    @fuss.obere_linke_ecke + Point.new(0,@fuss.hoehe)
  end

  def auf_position_setzen(ziel_pos_x,ziel_pos_y)
    bewegen(ziel_pos_x - position.x, ziel_pos_y - position.y, 1,0,0)
  end

  def einschalten
    @schirm.farbe_aendern('gelb')
    @leuchtstrahl1.farbe_aendern('gelb')
    @leuchtstrahl2.farbe_aendern('gelb')
    @leuchtstrahl3.farbe_aendern('gelb')
    @leuchtstrahl4.farbe_aendern('gelb')

    @leuchtstrahl1.sichtbar_machen
    @leuchtstrahl2.sichtbar_machen
    @leuchtstrahl3.sichtbar_machen
    @leuchtstrahl4.sichtbar_machen
    @tag = false
  end

  def ausschalten
    @schirm.farbe_aendern('orange')
    @leuchtstrahl1.unsichtbar_machen
    @leuchtstrahl2.unsichtbar_machen
    @leuchtstrahl3.unsichtbar_machen
    @leuchtstrahl4.unsichtbar_machen
    @tag = true
  end

  def abdunkeln
    einschalten
    @stiel.farbe_aendern('hellgrau')
    @fuss.farbe_aendern('grau')
  end

  def in_farbe_aendern
    ausschalten
    @stiel.farbe_aendern('gruen')
    @fuss.farbe_aendern('blau')
  end

  def to_s
    "StrassenLatern (#{@nummer})"
  end
end