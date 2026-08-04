// Name: LaunchKarmanLine
// Author: JitteryJet
// Version: V01
// kOS Version: 1.6.0.1
// KSP Version: 1.12.5
// Description:
//    Launch the Karman Line sounding rocket.
//
// Assumptions:
//    - Staging Stack setup:
//      - Stage 4:  Ignite the booster engine.
//                  Declamp.
//      - Stage 3:  Ignite sustainer engine.
//      - Stage 2:  Stage separation.
//      - Stage 1:  Jettison fairing.
//                  Arm parachute.
//      - Stage 0:  Payload separation.
//    - 
//
// Notes:
//    -
//
// Todo:
//    -
//
// Update History:
//    04/08/2026 V01  - Created.
//                    -
//
@lazyglobal off.
sas off.
rcs off.
clearscreen.
// Launch confirmation.
print "Program function: Launch Karman Line".
print "Ship name: "+ship:name.
print "Press the ENTER key to launch".
terminal:input:clear().
wait until terminal:input:haschar
  and terminal:input:getchar()=terminal:input:enter.
print "Launching in 10 seconds".
wait 10.
set ship:control:pilotmainthrottle to 1.0.

// Ignite booster engine and declamp.
print "Ignite booster".
stage.
wait until stage:ready.
wait 3.0.

// Ignite sustainer engine.
// The sustainer ignites before the
// booster burns out - this provides ullage to the
// sustainer.
print "Ignite sustainer".
stage.
wait until stage:ready.
wait 0.

// Stage separation.
print "Stage separation".
stage.
wait until stage:ready.

wait until ship:thrust=0.0.
print "MECO".
wait 1.

// Jettison fairing.
print "Jettison fairing".
stage.
wait until stage:ready.
print "Coasting".

// Wait until Karman Line.
wait until ship:altitude>100E3.
print "Karman Line reached".

// Payload separation.
print "Payload separation".
stage.
wait until stage:ready.

// Program completion. 
set ship:control:pilotmainthrottle to 0.0.
print "Program completed".