#!/usr/bin/env bash
yosys -p "read -sv top.sv clock_en.sv fsm.v; synth_intel -top top -vqm top.vqm"
