#!/bin/bash

pacman -Sy git
git clone https://github.com/Deissson/personal-arch.git
cd personal-arch/arch-script
chmod +x arch.sh
./arch.sh
