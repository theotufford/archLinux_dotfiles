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

keyboard = KMKKeyboard()

split = Split(
    split_side=SplitSide.LEFT,
    use_pio=True,
)

layers = Layers()
holdtap = HoldTap()
mouse_key = MouseKeys()
macros = Macros()


keyboard.modules = [macros, layers, split, holdtap, mouse_key]
keyboard.keymap = []

# Cleaner key names
_______ = KC.TRNS
___x___ = KC.TRNS
XXXXXXX = KC.NO


# Layer tap for other home row keys

# Mod-taps


# fmt: off

# keyboard.keymap += [[
#                     _______, _______, _______, _______, _______,     _______, _______, _______, _______, _______,
#                     _______, _______, _______, _______, _______,     _______, _______, _______, _______, _______,
#                     _______, _______, _______, _______, _______,     _______, _______, _______, _______, _______,
#                                                _______, _______,     _______, _______
#                     ]]
# S_L5 = KC.LT(5, KC.S)
# D_L1 = KC.LT(1, KC.D)
# F_L3 = KC.LT(3, KC.F)
# J_L4 = KC.LT(4, KC.J)
# K_L2 = KC.LT(2, KC.K)
# L_L6 = KC.LT(6, KC.L)
# SPC_L7 = KC.LT(7, KC.SPC)
# A_SFT = KC.HT(KC.A, KC.LSFT)
# SCLN_SFT = KC.HT(KC.SCLN, KC.LSFT)
# X_CTL = KC.HT(KC.X, KC.LCTRL)
# C_ALT = KC.HT(KC.C, KC.LALT)
# COM_ALT = KC.HT(KC.COMM, KC.LALT)
# DOT_CTL = KC.HT(KC.DOT, KC.LCTRL)
# CTL_ALT = KC.HT(KC.KC.LALT)
# keyboard.keymap += [[  #qwerty
#                     KC.Q,   KC.W,   KC.E,    KC.R,    KC.T,    KC.Y,    KC.U,    KC.I,    KC.O,     KC.P,
#                     A_SFT,  S_L5,   D_L1,    F_L3,    KC.G,    KC.H,    J_L4,    K_L2,    L_L6, SCLN_SFT,
#                     KC.Z,  X_CTL,  C_ALT,    KC.V,    KC.B,    KC.N,    KC.M, COM_ALT, DOT_CTL,  KC.SLSH,
#                                           KC.LGUI, KC.BSPC,    SPC_L7,  KC.ENT,
#                     ]]

# monolithic thumb symbols layer 1: text / code
#   left: period, comm, colon, quot, exclm, grv, ques, perc, DLR pound, at
#   right: eq, mins, plus, star, pipe, underscore, circ, and, tilde, bslsh,

# numbers: all the numbers, dot, plus, min, star, eql, circ, underscr, slsh, parentheses

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

SPC_L1 = KC.LT(1, KC.SPC)
ENT_L2 = KC.LT(2, KC.ENT)
S_L3 = KC.LT(3, KC.S)
R_L4 = KC.LT(4, KC.R)
BSPC_L5 = KC.LT(5, KC.BSPC)
ESC_L6 = KC.LT(6, KC.ESC)
A_SFT = KC.HT(KC.A, KC.LSFT)
O_SFT = KC.HT(KC.O, KC.LSFT)
Z_CTL = KC.HT(KC.Z, KC.LCTRL)
X_ALT = KC.HT(KC.X, KC.LALT)
SLSH_ALT = KC.HT(KC.SLSH, KC.LALT)
DQUO_CTRL = KC.HT(KC.DQUO, KC.LCTRL)

keyboard.keymap += [[  # 0 COLEMAKDH
                     KC.Q  ,KC.W  ,KC.F  ,KC.P  ,KC.B    ,KC.J  ,KC.L    ,KC.U    ,KC.Y     ,KC.TAB,
                     A_SFT ,R_L4  ,S_L3  ,KC.T  ,KC.G    ,KC.M  ,KC.N    ,KC.E    ,KC.I     ,O_SFT,
                     Z_CTL ,X_ALT ,KC.C  ,KC.D  ,KC.V    ,KC.K  ,KC.H    ,KC.SCLN ,DQUO_CTRL ,SLSH_ALT,
                                    ESC_L6   ,BSPC_L5    ,SPC_L1  ,ENT_L2
                     ]]


keyboard.keymap += [[  # 1 MAIN SYMBOLS
                     KC.CIRC, KC.PLUS, KC.AMPR, KC.LCBR, KC.RCBR,     KC.DQUO, KC.AT,  KC.QUES, KC.QUOT,  KC.POUND,
                     KC.UNDS, KC.ASTR, KC.EQL,  KC.LPRN, KC.RPRN,     KC.LABK, KC.DOT, KC.COMM, KC.COLN,   KC.MINS,
                     KC.PERC, KC.DLR,  KC.PIPE, KC.LBRC, KC.RBRC,     KC.RABK, KC.EXLM,KC.TILDE,KC.GRV,    KC.BSLSH,
                                                KC.F,    _______,     ___x___, _______
                     ]]

keyboard.keymap += [[  # 2 some vim editing
                     y_in_cbrc, y_in_brc, y_in_paren, y_in_dquo,  y_in_quo,   _______, down_jlst,set_mark_A, set_mark_B, set_mark_C,
                     c_in_cbrc, c_in_brc, c_in_paren, c_in_dquo,  c_in_quo,   _______, up_jlst,  go_mark_A,  go_mark_B,  go_mark_C,
                     d_in_cbrc, d_in_brc, d_in_paren, d_in_dquo,  d_in_quo,   _______,_______, _______,_______,    _______,
                                                      _______,     _______,   _______, ___x___
                     ]]


keyboard.keymap += [[  # 3 Navigation
                     _______, KC.LPRN, _______, KC.RPRN, _______,     _______, winLeft, winDown, winUp, winRight,
                     KC.N0,   cap_B,    ___x___, cap_E,  KC.DLR,      v_split, KC.LEFT,  KC.DOWN, KC.UP, KC.RGHT, 
                     _______, _______, _______, vblok,   _______,     _______, _______, _______, _______, _______,
                                                _______, KC.LCTL,      KC.LSFT, _______
                     ]]

keyboard.keymap += [[  # 4 onshape layer
                     _______, _______, KC.U,    KC.H,     undo,       _______, _______, _______, _______, _______,
                     ext,     ___x___, KC.ENT,  KC.L,    sym,         _______, _______, _______, _______, _______,
                     _______, _______, conc,    KC.I,    redo,        _______, _______, _______, _______, _______,
                                                _______, _______,     _______, _______
                     ]]

keyboard.keymap += [[  # 5 NUMBERS
                     _______, _______, _______, _______, _______,   _______, _______, _______, _______, _______,
                     KC.N1,   KC.N2,   KC.N3,   KC.N4,   KC.N5,     KC.N6,  KC.N7,   KC.N8,   KC.N9, KC.N0,
                     _______, _______, _______, _______, _______,   _______, _______, _______, _______,
                                                _______, ___x___,   _______, _______
                     ]]

keyboard.keymap += [[  # 6 window management - hypr
                     hypr_w5, hypr_w6, hypr_w7, hypr_w8,   _______,    KC.ESC,  term,       fFox,    launcher,  yazi, 
                     hypr_w1, hypr_w2, hypr_w3, hypr_w4,   _______,    KC.LSFT, hypr_left,  hypr_up, hypr_down, hypr_right, 
                     rfrsh_bar, _______, _______, _______, _______,    _______, killWindow, _______, _______,   _______, 
                                                ___x___,   _______,    newfzf,  newedit
                     ]]

if __name__ == '__main__':
    keyboard.go(hid_type=HIDModes.USB)
