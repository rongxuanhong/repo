#!/bin/bash
make modules -j$(getconf _NPROCESSORS_ONLN)
make -j$(getconf _NPROCESSORS_ONLN)
make modules_install -j$(getconf _NPROCESSORS_ONLN)
make install -j$(getconf _NPROCESSORS_ONLN)
