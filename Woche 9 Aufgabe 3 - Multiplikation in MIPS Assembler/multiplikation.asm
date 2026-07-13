# Multiplikation zweier ganzer Zahlen. $s3 = $s1 * $s2

# $s3 = 0
# while $s2 > 0:
#     $s3 += $s1.
#     $s2--
# while $s2 < 0:
#     $s3 -= $s1.
#     $s2++
# => Ergebnis steht in $s3

ADDIU $s1, $zero, 12                   # 1. Operand
ADDIU $s2, $zero, -4                   # 2. Operand
ADDIU $s3, $zero, 0                    # Ergebnis

ADDIU $s5, $zero, 1                    # Eine 1 zwischengespeichert

while_loop:
SLT $s4, $zero, $s2                    # is $s2 > 0 ?
BEQ $s4, $s5, zweiter_operand_positiv  # if yes, jump
ADDU $s0, $zero, $s0                   # NOP für Delayslot
SLT $s4, $s2, $zero                    # is $s2 < 0 ?
BEQ $s4, $s5, zweiter_operand_negativ  # if yes, jump
ADDU $s0, $zero, $s0                   # NOP für Delayslot

zweiter_operand_null:
J end_while_loop                       # wir sind fertig
ADDU $s0, $zero, $s0                   # NOP für Delayslot

zweiter_operand_positiv:
ADDU $s3, $s3, $s1                     # $s3 += $s1
SUBU $s2, $s2, $s5                     # $s2--; Zieht die zwischengespeicherte 1 von $s2 ab.
J while_loop
ADDU $s0, $zero, $s0                   # NOP für Delayslot

zweiter_operand_negativ:
SUBU $s3, $s3, $s1                     # $s3 -= $s1
ADDU $s2, $s2, $s5                     # $s2++; Addiert die zwischengespeicherte 1 zu $s2.
J while_loop
ADDU $s0, $zero, $s0                   # NOP für Delayslot

end_while_loop: