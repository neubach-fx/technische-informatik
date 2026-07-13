# Berechnung ggT. $s3 = ggT($s1, $s2)

ADDIU $s1, $zero, 40               # Startwerte setzen
ADDIU $s2, $zero, 12               # $zero ist immer 0
ADDIU $s3, $zero, 0

BNE $s1, $zero, a_ist_nicht_null   # Falls ($s1 != 0), springe zum Label 'a_ist_nicht_null'
ADDU $s0, $zero, $s0               # NOP für Delayslot

a_ist_null:                        # Label
ADDIU $s3, $s2, 0                  # $s3 = $s2
J fertig                           # Springe zum Label 'fertig'
ADDU $s0, $zero, $s0               # NOP für Delayslot

a_ist_nicht_null:

loop:
BEQ $s2, $zero, loop_fertig        # Falls ($s2 == 0), springe zum Label 'loop_fertig'
ADDU $s0, $zero, $s0               # NOP für Delayslot
SLTU $s4, $s2, $s1                 # Falls ($s2 < $s1), setze $s4 = 1, sonst 0
BEQ $s4, $zero, a_nicht_groesser_b # Falls ($s4 == 0) bzw. ($s2 !< $s1), springe
ADDU $s0, $zero, $s0               # NOP für Delayslot

a_groesser_b:
SUBU $s1, $s1, $s2                 # $s1 = $s1 - $s2
J if_zuende
ADDU $s0, $zero, $s0               # NOP für Delayslot

a_nicht_groesser_b:
SUBU $s2, $s2, $s1                 # $s2 = $s2 - $s1

if_zuende:
J loop
ADDU $s0, $zero, $s0               # NOP für Delayslot

loop_fertig:
ADDIU $s3, $s1, 0                  # $s3 = $s1
J fertig
ADDU $s0, $zero, $s0               # NOP für Delayslot

fertig: