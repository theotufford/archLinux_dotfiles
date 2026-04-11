# Replicates default Ferris keymap from QMK
# Credit: Pierre Chevalier, 2020
# https://github.com/qmk/qmk_firmware/tree/master/keyboards/ferris/keymaps/default
from kb import KMKKeyboard
from kb import pins
from kmk.keys import KC, Key
from kmk.modules.holdtap import HoldTap
from kmk.modules.layers import Layers
from kmk.modules.mouse_keys import MouseKeys
from kmk.modules.split import Split, SplitSide
from kmk.hid import Debug, HIDModes
from kmk.modules.macros import Macros, Press, Release, Tap

c_in_dquo = KC.MACRO("ci\"")
y_in_dquo = KC.MACRO("yi\"")
d_in_dquo = KC.MACRO("di\"")
y_in_quo = KC.MACRO("yi\'")
c_in_quo = KC.MACRO("ci\'")
d_in_quo = KC.MACRO("di\'")
c_in_paren = KC.MACRO("ci(")
y_in_paren = KC.MACRO("yi(")
d_in_paren = KC.MACRO("di(")
c_in_brc = KC.MACRO("ci[")
y_in_brc = KC.MACRO("yi[")
d_in_brc = KC.MACRO("di[")
c_in_cbrc = KC.MACRO("ci{")
y_in_cbrc = KC.MACRO("yi{")
d_in_cbrc = KC.MACRO("di{")
# vim window swapping
winRight = KC.MACRO(
    Press(KC.LCTL),
    Tap(KC.W),
    Release(KC.LCTL),
    Tap(KC.RGHT)
)

winLeft = KC.MACRO(
    Press(KC.LCTL),
    Tap(KC.W),
    Release(KC.LCTL),
    Tap(KC.LEFT)
)

winDown = KC.MACRO(
    Press(KC.LCTL),
    Tap(KC.W),
    Release(KC.LCTL),
    Tap(KC.DOWN)
)

winUp = KC.MACRO(
    Press(KC.LCTL),
    Tap(KC.W),
    Release(KC.LCTL),
    Tap(KC.UP)
)

vblok = KC.MACRO(
    Press(KC.LCTL),
    Tap(KC.V),
    Release(KC.LCTL),
)

v_split = KC.MACRO(
    Press(KC.LCTL),
    Tap(KC.W),
    Release(KC.LCTL),
    Tap(KC.V)
)

cap_E = KC.LSFT(KC.E)
cap_B = KC.LSFT(KC.B)
visendl = KC.MACRO("g$")
visbegl = KC.MACRO("g^")

go_mark_A = KC.MACRO("`A")
set_mark_A = KC.MACRO("mA")

go_mark_B = KC.MACRO("`B")
set_mark_B = KC.MACRO("mB")

go_mark_C = KC.MACRO("`C")
set_mark_C = KC.MACRO("mC")


search_replace = KC.MACRO("*:%s//")
up_jlst = KC.LCTL(KC.O)
down_jlst = KC.LCTL(KC.I)
ext = KC.MACRO(
    Press(KC.LSFT),
    Tap(KC.E),
    Release(KC.LSFT)
)
conc = KC.MACRO(
    Press(KC.LSFT),
    Tap(KC.O),
    Release(KC.LSFT)
)
sym = KC.MACRO(
    Press(KC.LSFT),
    Tap(KC.Q),
    Release(KC.LSFT)
)

undo = KC.RCTRL(KC.Z)
redo = KC.RCTRL(KC.Y)

modkey = KC.LALT
fFox = modkey(KC.W)
yazi = modkey(KC.E)
launcher = modkey(KC.R)
term = modkey(KC.Q)
newfzf = modkey(KC.ENT)
newedit = modkey(KC.Z)
killWindow = modkey(KC.C)
hypr_up = modkey(KC.K)
hypr_down = modkey(KC.J)
hypr_left = modkey(KC.H)
hypr_right = modkey(KC.L)
winfloat = modkey(KC.V)

hypr_w1 = modkey(KC.N1)
hypr_w2 = modkey(KC.N2)
hypr_w3 = modkey(KC.N3)
hypr_w4 = modkey(KC.N4)
hypr_w5 = modkey(KC.N5)
hypr_w6 = modkey(KC.N6)
hypr_w7 = modkey(KC.N7)
hypr_w8 = modkey(KC.N8)

rfrsh_bar = modkey(KC.LSFT(KC.R))
